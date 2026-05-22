# Agent Registry

Canonical list of all sub-agent personas across `researcher_agent` skills.

Last updated: 2026-05-21 (v1.0.0)

When adding or modifying personas, update this file first. All `SKILL.md`
files and other documentation should reference this registry rather
than restating persona definitions.

## Conventions

**Skill** — the skill the persona belongs to. Personas live in
`skills/<skill>/agents/<persona>.md`.

**Role** — single-line summary. The authoritative description lives in
the persona file's frontmatter `description` field.

**Status** — `available`, `in-development`, or `planned`.

By design, all v1.0.0 personas are skill-internal (`skills/<skill>/agents/`).
None are top-level invokable (`agents/<persona>.md`). Personas are
invoked by their parent skill, not directly by the user. If a future
persona warrants direct invocation, document it here with a note.

---

## research skill (5 personas)

| Persona | Role | Status |
|---|---|---|
| `question-formulator` | Runs Socratic dialogue to help the user move from a vague topic to one or more well-formed research questions. Refuses to give direct answers during dialogue. | available |
| `source-searcher` | Designs and executes literature search queries across academic databases. Reports yield, refines based on results, returns candidate source lists with bibliographic metadata. | available |
| `source-verifier` | Inspects candidate sources for credibility — peer-review status, retraction, venue quality, author affiliations, citation patterns, primary vs secondary. Returns a confidence-graded source list. | available |
| `synthesizer` | Reads verified sources, identifies themes, consensus, and disagreement. Produces a structured synthesis with per-claim source attribution. Refuses to synthesize across contradictory sources without flagging the disagreement. | available |
| `report-compiler` | Assembles the final deliverable from synthesis output and the mode's template. Handles citation formatting, section ordering, reference list construction, and cross-reference validation. | available |

---

## compose skill (6 personas)

| Persona | Role | Status |
|---|---|---|
| `drafter` | Drafts manuscript sections from a confirmed outline and a verified source list. IMRaD and domain-appropriate structures. Refuses to invent citations; flags missing-source gaps. | available |
| `reviser` | Applies user-approved revisions to an existing draft. Handles reviewer feedback, restructuring, expansion or contraction, and prose sharpening. Preserves citations; flags implicit citation removal. | available |
| `response-letter-writer` | Generates point-by-point responses to reviewer comments. Each row maps a comment to a change, a location, and an honest status. Refuses to fabricate manuscript locations or claim un-made changes. | available |
| `citation-checker` | Audits citation consistency across a manuscript: in-text/reference correspondence, internal triplet consistency, uniform style application. Reports rather than silently fixes. | available |
| `format-converter` | Converts manuscripts across Markdown, LaTeX, DOCX, ODT, PDF, EPUB, and HTML via pandoc. Handles citation key reformatting and bibliography style mapping. Produces a delta report listing manual-review items. | available |
| `disclosure-generator` | Composes venue-specific AI-assistance disclosure statements that accurately describe what AI did and what the user did. Refuses to produce statements that misrepresent AI involvement. | available |

---

## critique skill (6 personas)

| Persona | Role | Status |
|---|---|---|
| `completeness-reviewer` | Checks that every claim has supporting evidence, methods sections enable replication, results report what methods promised, and conclusions stay within what results support. Structured issue list. | available |
| `methodology-critic` | Evaluates the rigor of study design and analytical approach. Severity-graded methodology issue list covering design, statistics, validity threats, baselines, ablations, and replicability. | available |
| `clarity-reviewer` | Flags ambiguous prose, undefined terms, structural issues, unsignposted transitions, and sentences that admit multiple readings. Passage-by-passage clarity notes. | available |
| `literature-critic` | Checks whether the manuscript engages adequately with relevant prior work as represented by its own citations. Flags mischaracterization, missing antecedents, treating isolated studies as consensus. | available |
| `devil-advocate` | Adversarially reads the manuscript to surface alternative explanations, hidden assumptions, missed cases, and over-claims. "What would a reviewer who wants to reject this say?" list. | available |
| `editorial-decider` | Synthesizes the outputs of the other five critique sub-agents into a recommended editorial disposition with rationale. Drafts the editor's decision letter when requested. | available |

---

## orchestrate skill (4 personas)

| Persona | Role | Status |
|---|---|---|
| `pipeline-conductor` | Main driver of the orchestrate pipeline. Reads pipeline-logbook state, dispatches the next inner skill, hands off to checkpoint-coordinator at gates. | available |
| `checkpoint-coordinator` | Enforces mandatory gates between pipeline stages. Halts until the user explicitly approves, edits, or rejects the prior stage's deliverable. | available |
| `gap-detector` | Validates that the deliverables required by stage N+1 are actually present and well-formed in the artifacts produced by stage N. | available |
| `state-persistor` | Manages the orchestrate pipeline-logbook file: atomic reads and writes, schema validation, resume support, reset-to-stage truncation. | available |

---

## Summary

| Skill | Personas | Status |
|-------|---------:|--------|
| research | 5 | Phase 1 (available) |
| compose | 6 | Phase 2 (available) |
| critique | 6 | Phase 3 (available) |
| orchestrate | 4 | Phase 4 (available) |
| **Total** | **21** | — |

The 21-persona total matches the count reported in [README.md](README.md)
and on the HTML report pages. When personas are added or removed, this
file is the authoritative count; all other surfaces must follow.
