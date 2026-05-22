# researcher_agent

**An LLM-driven research assistance framework for Claude Code.**

[![License: CC BY-NC 4.0](https://img.shields.io/badge/License-CC%20BY--NC%204.0-lightgrey.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](CHANGELOG.md)
[![parity-check](https://github.com/drader/researcher_agent/actions/workflows/parity.yml/badge.svg)](https://github.com/drader/researcher_agent/actions/workflows/parity.yml)
[![Cite](https://img.shields.io/badge/cite-CITATION.cff-orange.svg)](CITATION.cff)

Copyright (c) 2026 Oğuz Gençer · Licensed under [CC BY-NC 4.0](LICENSE)
· See [POSITIONING.md](POSITIONING.md) for allowed/disallowed uses.

---

## What this is

A modular suite of Claude Code skills, slash commands, and sub-agents that
assist a human researcher through the literature → manuscript → review →
revision lifecycle. The framework provides:

- **Structured workflows** for common scholarly tasks (lit review, fact
  verification, systematic review, manuscript drafting, peer review)
- **Sub-agent personas** for division of cognitive labor (question
  formulation, source discovery, synthesis, etc.)
- **Templates and references** anchored to public-domain academic
  methodologies (PRISMA 2020, APA 7, IMRaD, Socratic method)
- **Checkpoint discipline** — human approval is required at key decision
  points; the framework will not run unattended on substantive judgments

This is **assistive**, not autonomous. It will not write your paper for
you. It handles tedious mechanics (search structuring, citation
formatting, consistency checking, draft assembly) and leaves the
intellectual work — what to argue, what to measure, how to interpret —
to you.

## Where this fits

`researcher_agent` is built for **atomic artefact production** — taking
a research question to a verified, peer-review-grade deliverable (a
systematic review, a manuscript, a critique). Each artefact is
self-contained, carries claim-level provenance, and does not depend on
the framework remembering anything between sessions.

It is deliberately **not** a knowledge base. It does not accumulate
domain expertise over time, maintain a personal wiki, or run agents on
a schedule. If you want a system that continuously ingests sources and
grows a body of domain knowledge, that is a different pattern — an
agentic knowledge-vault.

The two compose well side by side: a knowledge-vault for **daily
accumulation** (ingesting papers, building a domain wiki) and
`researcher_agent` for the **writing, review, and disclosure moment**
when that material becomes a concrete deliverable. They use separate
directories — no cross-contamination — and the handoff between them is
intentionally manual: you decide what crosses over.

## Skill matrix

| Skill | Purpose | Modes | Phase |
|---|---|---|---|
| `research` | Literature investigation, source verification, synthesis | 7 | 1 (available) |
| `compose` | Manuscript drafting, revision, formatting | 9 | 2 (available) |
| `critique` | Peer-review-style manuscript critique | 6 | 3 (available) |
| `orchestrate` | End-to-end pipeline across the other three skills | 2 | 4 (available) |

This release (**v1.0.0**) is feature-complete: all four planned skills
ship with all 24 modes. See [CHANGELOG.md](CHANGELOG.md) for the
release history.

## Quick install

```bash
# Clone to a stable canonical location
git clone https://github.com/drader/researcher_agent ~/researcher_agent

# Symlink the skill into a target project's .claude/skills/
cd /path/to/project
mkdir -p .claude/skills .claude/commands
ln -s ~/researcher_agent/skills/research .claude/skills/research
for c in ~/researcher_agent/commands/*.md; do
  ln -s "$c" .claude/commands/$(basename "$c")
done

# Or: install for all projects at user level
mkdir -p ~/.claude/skills
ln -s ~/researcher_agent/skills/research ~/.claude/skills/research
```

See [docs/SETUP.md](docs/SETUP.md) for additional installation options
(plugin marketplace, copy-based install, multi-skill setup).

## Using the research skill

After installation, in any Claude Code session inside the configured
project:

```
You: "Help me run a quick literature scan on stochastic spiking
      neural networks for low-power inference."

Claude: <picks the research skill, brief mode, asks any clarifying
         questions, then produces a research brief>
```

Or invoke a specific mode via slash command:

```
/research-socratic     Guided question-formulation dialogue
/research-brief        Short summary (500-1500 words)
/research-full         Comprehensive synthesis (3000-8000 words)
/research-systematic   PRISMA 2020 systematic review
/research-verify       Claim-by-claim fact-check
/research-annotate     Annotated bibliography
/research-evaluate     Critical review of one provided source
```

See [skills/research/SKILL.md](skills/research/SKILL.md) for the full
mode specification and trigger phrases.

## Design principles

1. **Source-grounded.** Every factual claim in produced output must be
   traceable to a cited source. The framework refuses to fabricate
   citations; if a needed source cannot be located, the gap is reported
   rather than papered over.

2. **Human-in-the-loop.** Major decisions (research question scope,
   methodology choice, inclusion/exclusion criteria, final outputs)
   are presented to the user for explicit approval. The framework will
   not silently resolve ambiguity.

3. **Limited revision loops.** At most two revision passes per
   deliverable. Issues unresolved after the second pass are recorded
   under "Unresolved Issues" rather than hidden.

4. **Transparency over deception.** The framework helps you produce
   better work and document where AI assisted. It does not help you
   conceal AI involvement; an explicit disclosure command is provided
   (Phase 2).

5. **Voice fidelity.** Mode parameters can be set so that produced
   prose stays closer to your prior writing style (when example text
   is provided), rather than defaulting to a generic LLM register.

## License at a glance

CC BY-NC 4.0:

- ✅ Personal academic work (PhD, papers, grant proposals)
- ✅ Teaching, classroom demonstration, training
- ✅ Non-profit research collaboration
- ❌ Commercial SaaS or paid services built on this framework
- ❌ Internal use at a for-profit organization for revenue-generating work
- ❌ Resale, repackaging, or commercial API wrapping

For commercial licensing, contact the copyright holder.

## Citation

```
Gençer, O. (2026). researcher_agent: An LLM-driven research assistance
framework [Computer software]. CC BY-NC 4.0.
```

Structured metadata (BibTeX, APA, Chicago, etc.) is available in
[CITATION.cff](CITATION.cff). GitHub's "Cite this repository" button
on the repo sidebar reads from that file.

## Status

**v1.0.0 (2026-05-21)** — Feature-complete. All four planned skills
ship: research, compose, critique, orchestrate. 24 modes, 24 slash
commands, 21 sub-agent personas, 16 reference docs, 19 templates,
6 worked examples.

See [ARCHITECTURE.md](ARCHITECTURE.md) for the design overview and
[MODE_REGISTRY.md](MODE_REGISTRY.md) for the canonical list of modes.
