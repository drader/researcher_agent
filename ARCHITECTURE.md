# Architecture

This document describes the technical design of `researcher_agent`.

## High-level layers

```
                     ┌───────────────────────────────┐
                     │     User (Claude Code)        │
                     └───────────────┬───────────────┘
                                     │ invokes
                ┌────────────────────┼────────────────────┐
                │                    │                    │
                ▼                    ▼                    ▼
        ┌─────────────┐      ┌─────────────┐      ┌──────────────┐
        │ slash cmds  │      │ skills      │      │ sub-agents   │
        │ .claude/    │      │ .claude/    │      │ .claude/     │
        │  commands/  │      │  skills/    │      │  agents/     │
        └─────┬───────┘      └──────┬──────┘      └──────┬───────┘
              │                     │                    │
              └─────────────────────┼────────────────────┘
                                    │ each entry references
                                    ▼
                          ┌──────────────────┐
                          │  shared infra    │
                          │  references/     │
                          │  templates/      │
                          │  examples/       │
                          └──────────────────┘
```

Claude Code discovers skills via files at `.claude/skills/<name>/SKILL.md`
(project-local or `~/.claude/skills/` user-level). Slash commands are
discovered via `.claude/commands/*.md`. Sub-agents are discovered via
`.claude/agents/*.md`. Each of these is provided as either a copy or a
symlink pointing to the canonical clone of this repository.

## Skill design

Each skill (e.g., `research`, `compose`, `critique`, `orchestrate`) is
a self-contained unit:

```
skills/<skill>/
├── SKILL.md         Front-door: name, description, modes, triggers
├── agents/          Sub-agent personas this skill uses internally
├── references/      Methodology / standards documents (e.g., PRISMA)
├── templates/       Output structure templates for each mode
└── examples/        Synthetic examples for prompt grounding
```

The `SKILL.md` file uses YAML frontmatter to declare the skill's name,
description, trigger phrases, and mode list. Claude Code's skill loader
reads this and makes the skill available for selection.

## Mode taxonomy

A **mode** is a parameterization of a skill that biases its workflow
toward a specific deliverable. Modes are not separate skills; they are
branches within a skill's logic.

Each mode has:

- **Spectrum bias** — how the skill weights three competing goals:
  - *Generative* (encourage user thinking, avoid prescription)
  - *Hybrid* (default, mixed)
  - *Analytic* (precise, low-creativity, high accuracy)
- **Deliverable** — what artefact the mode produces
- **Oversight level** — how often the user is asked to approve mid-flow
- **Trigger phrases** — natural-language patterns that activate the mode

See [MODE_REGISTRY.md](MODE_REGISTRY.md) for the canonical mode list.

## Sub-agent layer

Sub-agents are persona definitions used internally by skills. The five
personas of the `research` skill, for example:

- **question-formulator** — drives Socratic dialogue with the user
- **source-searcher** — designs and executes search queries
- **source-verifier** — checks credibility, peer-review status,
  retractions, venue quality
- **synthesizer** — integrates across multiple sources, identifies
  consensus and disagreement
- **report-compiler** — assembles the final deliverable

Sub-agents are invoked sequentially or in parallel by the skill, with
results passed through. The skill maintains a context buffer and a
provenance log.

The canonical list of all 21 personas across the four skills lives in
[AGENT_REGISTRY.md](AGENT_REGISTRY.md). All v1.0.0 personas are
skill-internal (`skills/<skill>/agents/<name>.md`), referenced by their
parent skill's prompt logic. Top-level invokable personas
(`.claude/agents/<name>.md`) — directly callable by name in Claude Code
— are reserved for a future extension and are not used in v1.0.0.

## Slash command layer

Slash commands are thin shortcuts that route to a specific skill+mode
combination. For example:

```
/research-socratic   → research skill, socratic mode
/research-systematic → research skill, systematic mode
```

Each command file is a Markdown prompt with YAML frontmatter:

```yaml
---
description: Short one-line summary shown in command palette
model: sonnet                    # optional; otherwise inherits
---

Body: prompt body that the command sends when invoked
```

## Checkpoint discipline

Every skill mode defines **checkpoints** — points in the workflow where
the user is presented with an artefact and asked to approve before the
skill proceeds. Two checkpoint types:

- **Optional (FYI)** — user is shown progress and given a chance to
  redirect. Skipped silently if the user does not respond.
- **Mandatory (gate)** — workflow halts until the user explicitly
  approves, edits, or rejects. Cannot be skipped.

For the `orchestrate-pipeline` mode the canonical list of mandatory
gates is **six**, defined in `skills/orchestrate/SKILL.md` §3–4 (which
is the single source of truth for both the pipeline stages and the
gates between them). Summarised:

| # | Position                  | What is gated                                  |
|---|---------------------------|------------------------------------------------|
| 1 | After Stage 1 (scope)     | Scope locked — primary question chosen         |
| 2 | After Stage 3 (synthesis) | Synthesis approved — evidence base set         |
| 3 | After Stage 4 (outline)   | Outline approved — structure committed         |
| 4 | After Stage 6 (critique)  | Self-critique acknowledged — roadmap accepted  |
| 5 | After Stage 8 (cite-audit)| Revision accepted — citations clean            |
| 6 | After Stage 9 (finalize)  | Final manuscript accepted                      |

Other skill modes inherit acceptance checkpoints from their parent
skill rather than being on the pipeline-level gate schedule above —
those are "deliverable acceptance" within the inner skill, not new
pipeline gates.

Maximum two revision loops per deliverable. After two revisions, any
remaining issues are recorded as "Unresolved Issues" attached
to the deliverable rather than being silently resolved.

## Provenance

Every claim in a produced deliverable is anchored to one of:

- A cited external source (with locator: page number, section heading,
  or paragraph)
- A user-supplied input (with timestamp or message reference)
- A framework-internal computation (clearly marked as such, e.g.,
  "synthesis across sources A, B, and C")

If no anchor is available, the claim is flagged as `<unverified>` and
moved to a notes section rather than published as fact.

## File and naming conventions

- File names: kebab-case (`source-verifier.md`)
- Skill names: kebab-case (`research`)
- Mode names: kebab-case (`systematic-review`)
- Frontmatter keys: snake_case (per YAML convention)
- Markdown headings: title case for major sections

## Versioning

Semantic versioning (`MAJOR.MINOR.PATCH`):

- MAJOR — breaking changes to skill API or file structure
- MINOR — new skills, new modes, or non-breaking enhancements
- PATCH — bug fixes, prompt refinements, documentation updates

See [CHANGELOG.md](CHANGELOG.md).

## Extension points

To add a new skill:

1. Create `skills/<new-skill>/SKILL.md` with frontmatter
2. Add modes to [MODE_REGISTRY.md](MODE_REGISTRY.md)
3. Add sub-agents under `skills/<new-skill>/agents/` as needed
4. Add slash commands under `commands/` as needed
5. Update README skill matrix

To add a new mode to an existing skill:

1. Update the skill's `SKILL.md` frontmatter to list the new mode
2. Add mode logic to the skill prompt body
3. Add the mode to [MODE_REGISTRY.md](MODE_REGISTRY.md)
4. Optionally add a corresponding slash command
