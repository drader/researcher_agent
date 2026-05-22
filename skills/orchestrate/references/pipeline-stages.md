# Pipeline Stages Reference

This document is the authoritative description of the 10-stage canonical
pipeline that the `orchestrate` skill drives. For each stage it specifies
the underlying skill and mode, the inputs that must be present before the
stage can run, the deliverables the stage produces, an advisory duration
in user-time, whether the transition out of the stage is gated by a
mandatory checkpoint, the most common failure shapes and the recommended
responses, and what skipping the stage means in practice.

Stages are ordered. A later stage may not run before the artifacts of all
prior non-skipped stages exist (either produced by the framework or
declared as externally supplied). Skipping a stage replaces the
"produce" obligation with a "supply" obligation: the user must hand the
orchestrator an equivalent artifact that the `gap-detector` accepts.

---

## Stage 1 — scope

- **Skill and mode.** `research` / `socratic`.
- **Required inputs.** A user-stated research interest, however vague.
  No prior artifact is required.
- **Deliverables.**
  - A short scope-summary document (Markdown) listing 3 to 5 candidate
    research questions, the selected primary question (marked
    explicitly), the included subfields, time window if any, and
    deliberate exclusions.
  - A recommendation of which Stage 2 mode (`brief` or `full`) fits the
    target venue and length.
- **Advisory duration.** 30 to 90 minutes of conversational work in a
  single session.
- **Mandatory checkpoint after?** Yes. Gate 1 — Scope locked.
- **Common failures.**
  - *Question still too vague.* The Socratic exchange converged on a
    framing the user is not confident in. Recommended response: run
    `research-socratic` again rather than push forward, or pause and
    return after a day's reflection.
  - *Multiple questions equally weighted.* The user cannot pick one
    primary. Recommended response: ask whether the project really wants
    two pipelines in sequence; if so, the orchestrator manages them as
    separate pipeline-logbooks.
- **Skip semantics.** Skipping Stage 1 requires the user to supply a
  one-paragraph scope statement that names a single primary question
  in interrogative form, the subfield, and at least one explicit
  exclusion. The `gap-detector` checks for those structural elements
  before accepting the skip.

---

## Stage 2 — lit-search

- **Skill and mode.** `research` / `brief` for short pieces (workshop
  papers, commentary, blog-length writeups) or `research` / `full` for
  substantive work (full papers, thesis chapters, grant narratives).
  The mode is the user's choice; the orchestrator recommends based on
  the Stage 1 scope-summary recommendation.
- **Required inputs.** The Stage 1 scope-summary document, in
  particular the locked primary question.
- **Deliverables.**
  - For `brief`: a `research-brief` Markdown document with a verified
    reference list (typically 8 to 20 entries).
  - For `full`: a `research-report` Markdown document with a verified
    reference list (typically 30 or more entries), thematic sections,
    and an open-questions block.
- **Advisory duration.** `brief`: one to two sessions, around 1 to 3
  hours of attended work. `full`: two to five sessions, distributed
  over days or weeks, with retrieval and verification spread across
  them.
- **Mandatory checkpoint after?** No. The transition is gated only by
  the internal acceptance step of the underlying skill. Gate 2 sits
  after Stage 3.
- **Common failures.**
  - *Too few sources.* The search returned below the underlying skill's
    minimum threshold for the chosen mode. Recommended response: the
    user broadens the query (add adjacent terms, widen the time window,
    relax an inclusion criterion) and reruns the stage. The pipeline
    halts; it does not silently degrade the deliverable.
  - *Verification failures.* A subset of retrieved sources cannot be
    verified (no DOI, broken URL, paywalled and unconfirmed). The
    underlying skill drops the unverified items; the orchestrator
    observes the reduced count and treats it as the same failure mode
    as too-few-sources if the floor is breached.
- **Skip semantics.** Skipping Stage 2 requires the user to supply an
  existing literature document with a reference list and per-claim
  citations. The `gap-detector` samples citations for locators and
  enforces the same minimum source count as the corresponding mode.

---

## Stage 3 — synthesis

- **Skill and mode.** `research` / `systematic` for PRISMA-style
  reviews, `research` / `annotate` for an annotated bibliography that
  feeds a literature review section.
- **Required inputs.** The Stage 2 lit-search deliverable.
- **Deliverables.**
  - For `systematic`: an inclusion/exclusion record, screening counts
    aligned to PRISMA phases, and the synthesized included-studies
    table.
  - For `annotate`: per-source entries each with a short summary, a
    methodology note, and a relevance-to-question note.
- **Advisory duration.** `systematic`: two to four sessions, often
  several hours each. `annotate`: one to three sessions.
- **Mandatory checkpoint after?** Yes. Gate 2 — Synthesis approved.
- **Common failures.**
  - *Irreconcilable disagreement.* The synthesis surfaces a
    contradiction in the literature that affects the central question.
    Recommended response: present the contradiction to the user; the
    user decides whether to narrow the question (return to Stage 1
    via reset-to-stage), to take a position and proceed, or to abandon.
  - *Insufficient included studies.* The systematic mode's screening
    leaves fewer studies than the question can be answered from.
    Treat as the Stage 2 too-few-sources failure routed back upstream.
- **Skip semantics.** Stage 3 is elective. The user may declare that
  the Stage 2 deliverable is itself sufficient synthesis (typical for
  short pieces and `brief` mode runs). The `gap-detector` then
  confirms that the Stage 2 artifact alone meets the Stage 4 input
  contract. If the user supplies an externally produced systematic
  review, the same contract applies.

---

## Stage 4 — outline

- **Skill and mode.** `compose` / `outline`.
- **Required inputs.** The Stage 2 lit-search deliverable, plus the
  Stage 3 synthesis deliverable when Stage 3 ran.
- **Deliverables.**
  - A structural outline naming every planned section and subsection.
  - An evidence map linking each section to the specific sources from
    the upstream reference list that will support it.
  - A per-section target word count (or an overall target plus
    proportional allocation).
- **Advisory duration.** One to two sessions, around 1 to 3 hours.
- **Mandatory checkpoint after?** Yes. Gate 3 — Outline approved. This
  is the single most important gate in the pipeline: it is the last
  point at which a structural mismatch between argument and evidence
  is cheap to fix.
- **Common failures.**
  - *Unmapped sections.* A planned section has no sources mapped to it.
    The `gap-detector` flags this as a structural gap. Recommended
    response: either trim the section from the outline or return to
    Stage 2 to find supporting sources for it.
  - *Argument-evidence mismatch.* The user notices at the checkpoint
    that the outline's claims are not supported by the cited evidence.
    Recommended response: reset to Stage 4 and revise the outline.
- **Skip semantics.** Skipping Stage 4 requires the user to supply an
  outline document plus an evidence map (sources keyed to sections).
  An outline without an evidence map fails the gap check.

---

## Stage 5 — draft

- **Skill and mode.** `compose` / `full`.
- **Required inputs.** The approved Stage 4 outline (with evidence
  map) and the upstream reference list.
- **Deliverables.**
  - A complete manuscript draft in the appropriate domain structure
    (IMRaD for empirical work, alternative structures for theory or
    review pieces).
  - In-text citations applied to all sections that the outline mapped
    to sources.
  - A reference list.
- **Advisory duration.** Two to five sessions, distributed across
  days. The longest single stage in most pipelines.
- **Mandatory checkpoint after?** No. The draft's internal acceptance
  is handled by the underlying `compose-full` mode. The next gate sits
  after Stage 6.
- **Common failures.**
  - *Sections invented beyond the outline.* The draft contains a
    section that the outline did not include. The `gap-detector`
    surfaces this; the user resolves at the inner skill's acceptance
    step.
  - *Missing citations in sections the outline mapped.* The
    `gap-detector` flags this as a transition gap before Stage 6 runs.
- **Skip semantics.** Skipping Stage 5 means the user is bringing an
  existing manuscript draft. The `gap-detector` requires that every
  major section be complete (no `TODO` placeholders) and that
  citations exist in sections the (supplied or framework-produced)
  outline mapped.

---

## Stage 6 — self-critique

- **Skill and mode.** `critique` / `full`.
- **Required inputs.** The Stage 5 draft and its reference list.
- **Deliverables.**
  - A simulated review report set (typically five reviewer reports,
    as `critique-full` produces).
  - An editorial decision letter.
  - A structured revision roadmap: an itemized list, each item naming
    the issue, the affected section, and a suggested action.
- **Advisory duration.** One to two sessions.
- **Mandatory checkpoint after?** Yes. Gate 4 — Self-critique
  acknowledged.
- **Common failures.**
  - *Critique overload.* The roadmap contains structural issues
    (wrong framing, wrong methodology, missing evidence) that simple
    revision in Stage 7 cannot address. Recommended response: present
    the overload to the user; the user decides between reset to an
    earlier stage (often Stage 4), accepting lower confidence, or
    abandoning.
  - *Roadmap unstructured.* If the underlying skill returns the
    roadmap as prose without item structure, the `gap-detector`
    flags it; `compose-revision` cannot consume an unstructured
    roadmap.
- **Skip semantics.** Skipping Stage 6 means the user has already
  obtained an external review (peer feedback, advisor comments). The
  external review must be supplied in the same structured-roadmap
  shape, or the user must reorganize it into that shape before
  Stage 7 runs.

---

## Stage 7 — revise

- **Skill and mode.** `compose` / `revision`.
- **Required inputs.** The Stage 5 draft and the Stage 6 revision
  roadmap (or an externally supplied equivalent).
- **Deliverables.**
  - A revised manuscript.
  - A point-by-point response letter cross-referencing each item in
    the roadmap, even though no real reviewers exist yet. The letter
    documents the changes for later real-review correspondence.
- **Advisory duration.** One to three sessions.
- **Mandatory checkpoint after?** No. The transition to Stage 8 is
  gated by the inner skill's acceptance. The next mandatory gate sits
  after Stage 8.
- **Common failures.**
  - *Unaddressed roadmap items.* A roadmap item cannot be addressed
    within revision scope (it would require new data, new analysis,
    or restructuring). The inner skill records the item as
    Acknowledged Limitation; the orchestrator carries that into the
    pipeline-logbook.
  - *Response letter mismatch.* The letter does not cover every
    roadmap item. `gap-detector` flags before Stage 8.
- **Skip semantics.** Skipping Stage 7 means supplying both a revised
  manuscript and a structured response letter from outside the
  framework.

---

## Stage 8 — citation-audit

- **Skill and mode.** `compose` / `citation-check`.
- **Required inputs.** The Stage 7 revised manuscript and its
  reference list.
- **Deliverables.**
  - A citation consistency report listing every issue (orphan
    citations, orphan references, style inconsistencies, missing
    locators) with a per-issue resolution status.
  - A statement of whether the manuscript is clean enough to format.
- **Advisory duration.** Often under an hour; one session.
- **Mandatory checkpoint after?** Yes. Gate 5 — Revision accepted,
  citations clean.
- **Common failures.**
  - *Outstanding issues.* The audit finishes with unresolved items.
    Recommended response: the user either resolves them and re-audits
    or elects to format anyway, with the unresolved items recorded
    in the pipeline-logbook as Unresolved Issues.
- **Skip semantics.** Skipping Stage 8 means the user has already
  audited the citations externally. The user supplies the report;
  the `gap-detector` checks that it lists issues with resolution
  status, not just a pass/fail summary.

---

## Stage 9 — finalize-format

- **Skill and mode.** `compose` / `format`.
- **Required inputs.** The clean (or knowingly-flagged) Stage 7
  revised manuscript, the Stage 8 audit report, and the user-declared
  target venue and format.
- **Deliverables.**
  - The manuscript in the venue's required format (LaTeX with class
    file, DOCX with template, PDF, plain Markdown — whatever the
    venue requires).
  - Any ancillary files the venue expects (cover letter draft, title
    page, supplementary information document) when the user has
    requested them.
- **Advisory duration.** One session, often under an hour. Longer if
  the venue's class file is unfamiliar.
- **Mandatory checkpoint after?** Yes. Gate 6 — Final manuscript
  accepted.
- **Common failures.**
  - *Format incompatibility.* The manuscript's structure does not fit
    the venue's template (wrong section ordering, length over limit,
    figures in unsupported format). Recommended response: present the
    incompatibility to the user; resolution may require returning to
    an earlier stage (often Stage 4 if the structure is wrong, or
    Stage 7 if length needs trimming).
- **Skip semantics.** Skipping Stage 9 means the user supplies a
  pre-formatted manuscript. The `gap-detector` checks that the
  supplied file is in the declared venue format.

---

## Stage 10 — disclosure

- **Skill and mode.** `compose` / `disclosure`.
- **Required inputs.** The pipeline-logbook's record of which stages the
  framework participated in, plus the user's declared target venue and
  any venue-specific disclosure requirements.
- **Deliverables.**
  - A standalone disclosure statement.
  - The same statement rendered into the form the venue expects
    (acknowledgments-section footnote, methods paragraph,
    declarations-form text), when the venue's requirements are
    specified.
- **Advisory duration.** Under an hour, single session.
- **Mandatory checkpoint after?** Not a gate in the same sense — the
  pipeline ends here. However, the user must accept the disclosure
  before the deliverables manifest is generated. Rejection routes back
  into Stage 10 for a re-draft, not to an earlier stage.
- **Common failures.**
  - *Venue policy not specified.* The user has not provided the
    venue's disclosure expectations. Recommended response: produce a
    generic disclosure statement and flag the missing venue policy in
    the pipeline-logbook.
  - *User elects to omit disclosure.* The user requests that Stage 10
    be skipped without a substitute. The orchestrator confirms the
    election explicitly, records it in the pipeline-logbook, and surfaces the
    election in the deliverables manifest so it remains visible.
- **Skip semantics.** Skipping Stage 10 is permitted only with the
  explicit confirmed election described above. There is no externally
  supplied artifact that substitutes; the absence of disclosure is
  itself the recorded fact.

---

## Cross-stage notes

- **Mandatory-checkpoint summary.** Gates sit after Stages 1, 3, 4, 6,
  8, and 9. Stages 2, 5, 7, and 10 hand off without a pipeline-level
  gate (the inner skill's own acceptance step still applies).
- **Mode elections.** Only Stages 2 and 3 have a user-visible mode
  choice. All other stages have a single default mode.
- **Time accounting.** Durations are advisory wall-clock estimates of
  attended user time. The orchestrator does not measure or report on
  unattended elapsed time except to note, on resume, how long the
  pipeline-logbook has been idle.
