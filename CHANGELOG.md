# Changelog

All notable changes to `researcher_agent` are recorded here.

The format follows [Keep a Changelog](https://keepachangelog.com/) and
this project uses [Semantic Versioning](https://semver.org/).

---

## [1.0.0] — 2026-05-21

Phase 4: `orchestrate` skill end-to-end. **Feature-complete release**
— all four planned skills are now shipped.

### Added

- `orchestrate` skill, end-to-end (2 modes)
  - `pipeline` — 10-stage end-to-end research-to-manuscript workflow
    with mandatory checkpoints; sequences invocations of research,
    compose, and critique skills
  - `resume` — continue a prior pipeline run from its saved pipeline-logbook;
    supports boundary-reset for branching from a prior stage

- Sub-agent personas within orchestrate skill
  - pipeline-conductor (main driver, dispatches stages)
  - checkpoint-coordinator (enforces mandatory gates)
  - state-persistor (manages pipeline-logbook file)
  - gap-detector (validates stage-to-stage handoffs)

- Reference materials
  - The canonical 10-stage pipeline with per-stage detail
  - Checkpoint discipline (when/how/why)
  - Pipeline Logbook JSON schema and atomic-write protocol
  - Stage-handoff protocols (9 transitions, per-transition contracts)

- Templates
  - Pipeline state (human-readable pipeline-logbook rendering)
  - Pipeline Logbook (JSON skeleton with annotated example values)
  - Checkpoint prompt (what the coordinator presents at gates)
  - Stage summary (per-stage completion report)

- Examples
  - Worked end-to-end pipeline run (synthetic topic) with pause/resume
    and stage-failure recovery

- Slash commands for orchestrate skill
  - `/orchestrate-pipeline`
  - `/orchestrate-resume`

### Changed

- MODE_REGISTRY.md — `orchestrate` skill modes moved from `planned`
  to `available`; project marked feature-complete
- plugin.json — added `orchestrate` skill entry; phase now 4 of 4;
  major version bump to 1.0.0
- README.md — skill matrix updated to show all four phases available

### Project status

With this release, all 24 originally planned modes across all four
skills are available. Future versions will refine existing content,
add new modes within existing skills, or extend the framework
based on user feedback — but the original four-phase plan is
complete.

### Build infrastructure — 2026-05-23

A small but consequential change within v1.0.0: HTML report pages
moved from repo root to `docs/` to give GitHub Pages a clean source.

#### Changed

- `index.html` → `docs/index.html` (file moved)
- `architecture.html` → `docs/architecture.html` (file moved)
- SVG `<img src>` paths in both HTML files updated: `docs/diagrams/...`
  → `diagrams/...` (relative to the HTML's new directory)
- `CLAUDE.md` — parity rule table and surface-list updated to reference
  `docs/index.html` / `docs/architecture.html`; new explanation of why
  the files live under `docs/` (Pages source path)
- `CONTRIBUTING.md` — PR step 6 link paths updated
- `.github/PULL_REQUEST_TEMPLATE.md` — link paths updated
- `.github/ISSUE_TEMPLATE/documentation-issue.yml` — placeholder and
  label paths updated
- `scripts/parity-check.sh` — all HTML file path references updated;
  img-src resolver now uses the HTML's own directory as the relative base
- GitHub Pages source switched from `branch:main path:/` to
  `branch:main path:/docs` (configuration change, applied via API after
  the commit lands)

#### Why

Pages with source `/` makes Jekyll parse every markdown in the repo.
Several `commands/*.md` and persona files contain `{{ ... }}` notation
that collides with Liquid template syntax, failing the build. memex's
pattern (HTML under `docs/`, Pages source `/docs`) avoids the issue
entirely — Jekyll sees only the static HTML/SVG, not the rest of the
repository. This change adopts that pattern.

### Community readiness pass — 2026-05-22

A documentation and infrastructure pass within v1.0.0, prior to the
initial public commit at `github.com/drader/researcher_agent`. No
modes, skills, or personas added; counts unchanged.

#### Added

- `CITATION.cff` — structured citation metadata (Citation File Format
  v1.2.0); enables GitHub's "Cite this repository" button and import
  into Zotero / Mendeley / OpenAlex.
- `SECURITY.md` — framework-specific security policy: prompt-injection
  of sub-agents, AI-disclosure bypass, citation-hallucination
  re-introduction, provenance-chain break, checkpoint discipline
  bypass, two-loop revision cap bypass. Reporting via GitHub private
  vulnerability advisories.
- `AGENT_REGISTRY.md` — canonical list of the 21 sub-agent personas
  across the four skills, symmetric in form with `MODE_REGISTRY.md`.
- `scripts/parity-check.sh` — runs seven parity checks (HTML tag
  balance, image-reference resolution, MODE_REGISTRY row counts,
  AGENT_REGISTRY ↔ disk parity, README counts, command-file count
  consistency, version/date sync across CHANGELOG/CITATION/index/README).
- `.github/ISSUE_TEMPLATE/` — four GitHub Issue Forms templates
  (`bug-report.yml`, `mode-or-skill-proposal.yml`,
  `source-grounding-failure.yml`, `documentation-issue.yml`) plus
  `config.yml` that disables blank issues and routes security reports
  and open-ended questions to their proper channels.
- `.github/PULL_REQUEST_TEMPLATE.md` — five-group checklist mirroring
  CONTRIBUTING.md and CLAUDE.md (scope, registry impact, CHANGELOG,
  HTML parity, parity-check verification) plus standard fields.
- `.github/workflows/parity.yml` — GitHub Actions workflow that runs
  `parity-check.sh` on push to `main`, on every PR, and on manual
  dispatch; annotates failing checks inline; uploads the parity log
  as an artifact.

#### Changed

- `ARCHITECTURE.md` — sub-agent layer examples corrected (the prior
  list included names that did not exist on disk); mandatory-checkpoint
  list expanded from 4 to the canonical 6, with a reference to
  `skills/orchestrate/SKILL.md` as the single source of truth.
- `index.html` — terminal example on slide 9 updated ("6 mandatory
  gates"); slide 14 title changed to "Ten stages. Six gates."; embeds
  the rewritten `pipeline.svg`.
- `architecture.html` — slide 6 rewritten with the real 21-persona list
  across 4 cards (one per skill); slide 7 changed to "Six mandatory
  pipeline gates" with the canonical G1–G6 list; slide 9 title updated.
- `docs/diagrams/pipeline.svg` — fully rewritten: 10 canonical stages
  (scope, lit-search, synthesis, outline, draft, self-critique, revise,
  citation-audit, finalize-format, disclosure) with 6 gate markers
  (G1–G6) placed at the correct stage boundaries.
- `CLAUDE.md` — added "Single sources of truth" table (MODE_REGISTRY
  → 24 modes; AGENT_REGISTRY → 21 personas; orchestrate/SKILL.md
  §3–4 → pipeline and gates; ARCHITECTURE.md → provenance contract;
  CHANGELOG → version); replaced inline parity-check Bash snippet
  with a reference to `scripts/parity-check.sh`.
- `CONTRIBUTING.md` — security paragraph collapsed to a one-line
  redirect to `SECURITY.md`; PR process gained step 6 (HTML
  report-page parity).
- `README.md` — citation block cross-references `CITATION.cff`; header
  gained four shield badges (license, version, parity CI status,
  citation).

#### Fixed (drift)

- Several persona references in `ARCHITECTURE.md` and `architecture.html`
  used names that did not exist as files (`bias-assessor`, `outliner`,
  `prose-drafter`, `voice-anchor`, `reviewer-1…5`, `methods-critic`,
  `stage-router`, `checkpoint-gatekeeper`, `logbook-recorder`,
  `resume-planner`). All now match `skills/<skill>/agents/<name>.md`.
- The mandatory-gate count was inconsistent across files: `ARCHITECTURE.md`
  said 4, `architecture.html` said "Four" (slide 7) and "3" (slide 9 and
  pipeline.svg), while `checkpoint-coordinator.md` said 6. The
  authoritative count is **6**, per `skills/orchestrate/SKILL.md` §3–4;
  all surfaces realigned. `CLAUDE.md`'s new SoT table prevents this
  class of drift going forward.

---

## [0.3.0] — 2026-05-21

Phase 3: `critique` skill end-to-end.

### Added

- `critique` skill, end-to-end (6 modes)
  - `full` — 5 reviewer reports + editorial decision + revision roadmap
  - `quick` — brief editor-style first impression
  - `methodology` — in-depth methodology critique
  - `re-review` — verification of revisions against the original review
  - `guided` — Socratic issue-by-issue dialogue with the author
  - `calibration` — FNR / FPR reviewer-accuracy measurement

- Sub-agent personas within critique skill
  - completeness-reviewer
  - methodology-critic
  - clarity-reviewer
  - literature-critic
  - devil-advocate
  - editorial-decider

- Reference materials
  - Peer-review conventions across disciplines
  - Review rubrics (biomedical, social science, engineering, humanities, mathematics)
  - Reviewer bias and mitigation patterns
  - Editorial decision framework

- Templates
  - Reviewer report
  - Editorial decision letter
  - Methodology critique
  - Re-review report
  - Calibration report

- Examples
  - Full-mode worked example (5-reviewer + editorial + roadmap)
  - Guided-mode dialogue transcript

- Slash commands for critique skill
  - `/critique-full`
  - `/critique-quick`
  - `/critique-methodology`
  - `/critique-re-review`
  - `/critique-guided`
  - `/critique-calibration`

### Changed

- MODE_REGISTRY.md — `critique` skill modes moved from `planned`
  to `available`
- plugin.json — added `critique` skill entry; phase now 3 of 4

### Not yet implemented (planned)

- Phase 4: `orchestrate` skill (2 modes) — end-to-end pipeline
  across research → compose → critique → revision → finalization

---

## [0.2.0] — 2026-05-21

Phase 2: `compose` skill end-to-end.

### Added

- `compose` skill, end-to-end (9 modes)
  - `full` — complete manuscript draft (IMRaD or domain-appropriate)
  - `outline` — detailed outline + evidence map
  - `revision` — revised draft + point-by-point response letter
  - `revision-triage` — revision roadmap from reviewer comments
  - `abstract` — abstract + keywords (structured / unstructured)
  - `lit-section` — literature review section as integrated prose
  - `format` — cross-format conversion (Markdown ↔ LaTeX ↔ DOCX ↔ PDF)
  - `citation-check` — citation consistency audit
  - `disclosure` — venue-specific AI-assistance disclosure statement

- Sub-agent personas within compose skill
  - drafter
  - reviser
  - citation-checker
  - response-letter-writer
  - disclosure-generator
  - format-converter

- Reference materials
  - IMRaD structure and domain variants
  - Citation-style notes (APA 7, MLA 9, Vancouver, IEEE, Chicago)
  - AI-disclosure patterns (venue policy categories)
  - Pandoc format-conversion matrix

- Templates
  - IMRaD manuscript draft
  - Abstract block (structured / unstructured)
  - Response letter (cover + per-reviewer)
  - Revision roadmap
  - Literature review section
  - AI-disclosure statement (multi-venue variants)

- Examples
  - Manuscript snippet (synthetic topic, IMRaD)
  - Response letter (synthetic submission)

- Slash commands for compose skill
  - `/compose-full`
  - `/compose-outline`
  - `/compose-revision`
  - `/compose-revision-triage`
  - `/compose-abstract`
  - `/compose-lit-section`
  - `/compose-format`
  - `/compose-citation-check`
  - `/compose-disclosure`

### Changed

- MODE_REGISTRY.md — `compose` skill modes moved from `planned`
  to `available`
- plugin.json — added `compose` skill entry

### Not yet implemented (planned)

- Phase 3: `critique` skill (6 modes) — peer-review-style critique
- Phase 4: `orchestrate` skill (2 modes) — end-to-end pipeline

---

## [0.1.0] — 2026-05-21

Initial release. Phase 1 of the planned four-phase rollout.

### Added

- Project skeleton and governance documents
  - LICENSE (CC BY-NC 4.0)
  - NOTICE.md (authorship and methodology references)
  - README.md (project overview and quick install)
  - POSITIONING.md (allowed/disallowed uses, design philosophy)
  - ARCHITECTURE.md (technical design)
  - MODE_REGISTRY.md (canonical mode list)
  - CONTRIBUTING.md (contribution guidelines)
  - CHANGELOG.md (this file)
  - `.gitignore`
  - `.claude-plugin/plugin.json` (Claude Code plugin manifest)

- `research` skill, end-to-end (7 modes)
  - `brief` — short literature summary
  - `full` — comprehensive literature report
  - `socratic` — question-formulation dialogue
  - `systematic` — PRISMA 2020 systematic review
  - `verify` — claim-by-claim verification
  - `annotate` — annotated bibliography
  - `evaluate` — critical review of one source

- Sub-agent personas within research skill
  - question-formulator
  - source-searcher
  - source-verifier
  - synthesizer
  - report-compiler

- Reference materials
  - PRISMA 2020 procedure outline
  - Socratic method playbook
  - Source quality assessment criteria
  - Common failure modes in AI-assisted research

- Output templates
  - Research brief template
  - Annotated bibliography template
  - Systematic review template
  - Verification report template

- Slash commands for research skill
  - `/research-brief`
  - `/research-full`
  - `/research-socratic`
  - `/research-systematic`
  - `/research-verify`
  - `/research-annotate`
  - `/research-evaluate`

### Not yet implemented (planned)

- Phase 2: `compose` skill (9 modes) — manuscript drafting and revision
- Phase 3: `critique` skill (6 modes) — peer-review-style critique
- Phase 4: `orchestrate` skill (2 modes) — end-to-end pipeline

### Notes

This is a clean-room implementation. All prompt text, agent
specifications, templates, and documentation are original work.
Common academic methodologies referenced (PRISMA 2020, Socratic
method, peer review, APA 7) are public-domain scholarly practices.

---

## Versioning policy

- `MAJOR` — breaking changes to skill file structure, frontmatter
  schema, or removal of modes
- `MINOR` — new skills, new modes, or new sub-agents (non-breaking)
- `PATCH` — prompt refinements, bug fixes, documentation updates,
  template adjustments
