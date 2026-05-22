# Stage Handoff Protocols

This document is the single source of truth for what each pipeline
transition requires. For every handoff between consecutive stages
(Stage N → Stage N+1) it states the artifacts the upstream stage must
have produced, the artifacts the downstream stage consumes, the
specific structural checks the `gap-detector` performs, and what
counts as a valid handoff, a degraded handoff, or a failed handoff.
Recovery options for failures are listed at the end of each section.

The handoff is validated by the `gap-detector`. It does not evaluate
content quality, only structural sufficiency: are the elements the
downstream stage needs actually present and well-formed in the
artifacts the upstream stage produced?

A handoff has three possible outcomes:

- **Valid.** All required elements are present and well-formed. The
  downstream stage may run.
- **Degraded.** Required elements are present but a threshold is
  below recommended levels (for example, source count above minimum
  but below recommended). The downstream stage may run with the
  limitation recorded.
- **Failed.** A required element is missing or malformed. The
  downstream stage cannot run.

The user is offered the same three recovery options whenever a handoff
fails: re-run the upstream stage with adjusted parameters, accept a
degraded handoff (turning the failure into an explicitly-recorded
limitation), or abandon the pipeline.

---

## Transition 1 → 2: scope → lit-search

- **Stage 1 must produce.** A scope-summary document.
- **Stage 2 consumes.** The locked primary question, the recommended
  Stage 2 mode, and any scope constraints (subfield, time window,
  exclusions).
- **gap-detector checks.**
  - A single primary question is identified and marked selected.
  - The question is in interrogative form (ends with `?`).
  - At least one subfield is named.
  - The recommended Stage 2 mode is either `brief` or `full`, not
    absent or invalid.
- **Valid handoff.** All four checks pass.
- **Degraded handoff.** The question is selected but no time window
  or exclusions are specified; the lit-search will run broader and
  yield more sources than necessary. The user is told.
- **Failed handoff.** No selected primary question, or multiple
  questions all marked primary, or mode recommendation absent.
- **Recovery options.**
  1. Re-run Stage 1 to lock the question.
  2. Accept degraded handoff with the gap recorded as Acknowledged
     Limitation in the pipeline-logbook.
  3. Abandon.

---

## Transition 2 → 3: lit-search → synthesis

(When Stage 3 runs. When the user elects to skip Stage 3, the relevant
transition is 2 → 4, documented below.)

- **Stage 2 must produce.** A lit-search artifact (research-brief or
  research-full report) with a verified reference list.
- **Stage 3 consumes.** The full reference list, the body of the
  report (themes/sections), and the question to be synthesized
  against.
- **gap-detector checks.**
  - Reference list present.
  - Reference list size meets the underlying skill's minimum: 8 for
    `brief`, 30 for `full`.
  - For a sample of citations, locators (DOI, URL, or stable
    identifier) are present.
  - Themes or sub-topics are identifiable from section headings.
- **Valid handoff.** All checks pass.
- **Degraded handoff.** Reference count is above minimum but below
  recommended (e.g., 8–11 for `brief`, 30–40 for `full`); the
  downstream synthesis may have thin coverage in some sub-themes.
- **Failed handoff.** Reference count below minimum, locators missing
  from a substantial fraction of sampled citations, or themes not
  discernible.
- **Recovery options.**
  1. Re-run Stage 2 with broadened query, widened time window, or
     relaxed inclusion criterion.
  2. Accept degraded handoff and record the limitation.
  3. Abandon.

---

## Transition 2 → 4: lit-search → outline (Stage 3 skipped)

- **Stage 2 must produce.** As above.
- **Stage 4 consumes.** The full reference list with locators, the
  themes from Stage 2's section structure, and the question.
- **gap-detector checks.**
  - Same as 2 → 3, plus an additional check that the user has
    explicitly elected to skip Stage 3 (recorded in
    `user_parameters.stage_3_mode = "skip"`).
  - Reference list density per theme is enough to inform an outline
    (heuristic: each theme has at least 3 mapped sources).
- **Valid handoff.** All checks pass.
- **Degraded handoff.** A theme has only 1 or 2 mapped sources;
  outline sections for that theme will be thin.
- **Failed handoff.** Below minimum reference count, or themes lack
  any mapped sources.
- **Recovery options.**
  1. Re-run Stage 2.
  2. Reconsider running Stage 3 after all (the skip election can be
     reversed).
  3. Accept degraded handoff.
  4. Abandon.

---

## Transition 3 → 4: synthesis → outline

- **Stage 3 must produce.**
  - For `systematic`: an inclusion/exclusion record, screening counts
    consistent with the four PRISMA phases, the included-studies
    table.
  - For `annotate`: per-source entries each with summary,
    methodology note, and relevance note; at least 10 entries.
- **Stage 4 consumes.** The synthesis artifact plus the upstream
  reference list.
- **gap-detector checks.**
  - For `systematic`: PRISMA phase counts present and internally
    consistent (identified ≥ screened ≥ eligible ≥ included);
    included-studies count is at least the minimum the question
    requires (default: 5).
  - For `annotate`: per-source treatment present for each entry; no
    entry is missing summary, methodology, or relevance.
- **Valid handoff.** All checks pass.
- **Degraded handoff.** PRISMA counts present but included-studies
  count is borderline; or annotated entries present but a fraction
  are missing one of the three required notes.
- **Failed handoff.** PRISMA counts inconsistent or absent;
  annotated entries with major gaps.
- **Recovery options.**
  1. Re-run Stage 3.
  2. Accept degraded handoff.
  3. Abandon.

---

## Transition 4 → 5: outline → draft

This is the gate after Stage 4 (Gate 3). It is the most consequential
handoff in the pipeline.

- **Stage 4 must produce.**
  - Structural outline naming every planned section.
  - Evidence map linking each section to one or more sources.
  - Per-section target word count or proportional allocation.
- **Stage 5 consumes.** The outline, the evidence map, the
  reference list, and any user parameters (length, language,
  citation style).
- **gap-detector checks.**
  - Outline has at least the canonical section count for the chosen
    structure (IMRaD: introduction, methods, results, discussion;
    review structures vary).
  - Every section in the outline is mapped to at least one source in
    the evidence map. A section with no mapped sources is a hard
    failure — drafting it would require inventing unsupported
    content.
  - Per-section word counts are present and sum to within ±10% of
    the overall length target.
- **Valid handoff.** All checks pass.
- **Degraded handoff.** A section is mapped to a single source where
  multiple sources would be expected; drafting it risks
  over-reliance on one citation. Or per-section word counts sum to
  within ±25% rather than ±10%.
- **Failed handoff.** An unmapped section, or sums far off the
  target, or evidence map absent.
- **Recovery options.**
  1. Re-run Stage 4 to repair the mapping.
  2. Trim the unmapped section from the outline and accept the
     reduced scope.
  3. Re-run Stage 2 to find supporting sources for the unmapped
     section.
  4. Accept degraded handoff with the limitation recorded.
  5. Abandon.

---

## Transition 5 → 6: draft → self-critique

- **Stage 5 must produce.** A complete manuscript draft with
  in-text citations applied to sections the outline mapped, plus
  the reference list.
- **Stage 6 consumes.** The draft.
- **gap-detector checks.**
  - No section contains a `TODO`, `TKTK`, or empty placeholder in
    its body.
  - Sections the outline mapped to sources contain at least one
    in-text citation each.
  - Reference list is present and contains entries for every
    in-text citation found (or close to it; full reconciliation is
    Stage 8's job).
- **Valid handoff.** All checks pass.
- **Degraded handoff.** A small minority (one or two) of mapped
  sections has placeholders; critique can still run but will flag
  them prominently.
- **Failed handoff.** Multiple sections incomplete, citations
  largely missing.
- **Recovery options.**
  1. Re-run Stage 5 to complete missing sections.
  2. Accept degraded handoff and let Stage 6 flag what is missing.
  3. Abandon.

---

## Transition 6 → 7: self-critique → revise

- **Stage 6 must produce.** Five reviewer reports (or the count
  `critique-full` produces in the current version), an editorial
  decision letter, and a structured revision roadmap.
- **Stage 7 consumes.** The roadmap primarily; the reviewer reports
  and decision letter for context.
- **gap-detector checks.**
  - Reviewer report count matches the underlying skill's expected
    output.
  - Decision letter present.
  - Revision roadmap is itemized: each item names the issue, the
    affected section, and a suggested action. Prose-only critique
    without item structure fails this check.
- **Valid handoff.** All checks pass.
- **Degraded handoff.** Roadmap present but a few items omit either
  the section reference or the suggested action; revision can
  proceed but will require user clarification on those items.
- **Failed handoff.** Roadmap absent, unstructured, or has so many
  structural issues (per the "critique overload" failure mode) that
  simple revision cannot address them.
- **Recovery options.**
  1. Re-run Stage 6 with adjusted critique parameters.
  2. Reset to an earlier stage (often Stage 4) if the overload
     indicates a structural rather than a content problem.
  3. Accept degraded handoff.
  4. Abandon.

---

## Transition 7 → 8: revise → citation-audit

- **Stage 7 must produce.** A revised manuscript and a point-by-point
  response letter cross-referencing each roadmap item.
- **Stage 8 consumes.** The revised manuscript and its reference
  list.
- **gap-detector checks.**
  - Revised manuscript file is present.
  - Response letter file is present.
  - Letter cross-references each roadmap item (by item number or by
    quoted issue) — a sample check.
- **Valid handoff.** All checks pass.
- **Degraded handoff.** Letter is present but a small minority of
  roadmap items are unaddressed (with explicit "deferred"
  annotations); citation-audit can still run.
- **Failed handoff.** Letter missing, or letter present but does not
  reference the roadmap.
- **Recovery options.**
  1. Re-run Stage 7 with the missing roadmap items flagged.
  2. Accept degraded handoff with deferred items recorded as
     Unresolved Issues.
  3. Abandon.

---

## Transition 8 → 9: citation-audit → finalize-format

- **Stage 8 must produce.** A citation consistency report listing
  issues found, each with a resolution status (`resolved-by-user`,
  `deferred-with-note`, etc.), and a verdict on whether the
  manuscript is clean enough to format.
- **Stage 9 consumes.** The verdict and any user-acknowledged
  exceptions; the manuscript itself (already in Stage 7's output).
- **gap-detector checks.**
  - Audit report present.
  - Each flagged issue has a non-null resolution status.
  - The verdict statement is present.
- **Valid handoff.** All checks pass and the verdict is "clean."
- **Degraded handoff.** Verdict is "clean with deferred items" — the
  user has explicitly accepted that some issues will be carried
  forward into the final manuscript. The deferred items are recorded
  as Unresolved Issues.
- **Failed handoff.** Verdict is "not clean" and the user has not
  elected to format anyway. Or the audit report itself is missing
  fields.
- **Recovery options.**
  1. Re-run Stage 8 after the user resolves remaining issues
     manually.
  2. Elect to format anyway with limitations recorded.
  3. Abandon.

---

## Transition 9 → 10: finalize-format → disclosure

- **Stage 9 must produce.** A manuscript file in the venue's target
  format, plus any ancillary files the venue requires.
- **Stage 10 consumes.** Not the manuscript content itself, but the
  pipeline-logbook's full record of which stages were framework-driven and
  which were external, plus the user's declared venue and disclosure
  requirements.
- **gap-detector checks.**
  - Formatted manuscript file present.
  - File extension or content-type matches the declared
    `target_venue` format expectation.
- **Valid handoff.** All checks pass.
- **Degraded handoff.** Format matches but with venue-specific
  warnings (missing line numbers, figure resolution low,
  bibliography style only approximate). The user is told; the
  disclosure stage proceeds.
- **Failed handoff.** File format mismatch (e.g., venue requires
  LaTeX, file is DOCX).
- **Recovery options.**
  1. Re-run Stage 9 to convert to the correct format.
  2. Reset the declared venue if the user intended a different one.
  3. Abandon.

---

## Notes on handoff validation in skipped-stage scenarios

When a stage is skipped and the user supplies an external artifact,
the `gap-detector` runs the same checks above. The validation does
not relax just because the artifact came from outside the framework.
If anything, externally produced artifacts are checked more carefully
for the structural elements that framework-produced artifacts are
guaranteed to have (per the underlying skills' own templates).

If an externally supplied artifact fails the structural check, the
recovery menu is the same: adjust and resupply, accept degraded with
recorded limitation, or abandon. The user does not have the option of
"trust me, the artifact is fine" because the downstream stage will
fail in less recoverable ways if it operates on a malformed input.

---

## Summary table of handoffs

| Transition | Gating checkpoint | Critical check                           |
|-----------:|-------------------|------------------------------------------|
| 1 → 2      | Yes (Gate 1)      | Primary question locked                  |
| 2 → 3      | No                | Reference list above minimum             |
| 2 → 4*     | No                | (Stage 3 skipped) reference list density |
| 3 → 4      | Yes (Gate 2)      | Synthesis structurally complete          |
| 4 → 5      | Yes (Gate 3)      | Every section mapped to sources          |
| 5 → 6      | No                | Draft sections complete with citations   |
| 6 → 7      | Yes (Gate 4)      | Structured revision roadmap present      |
| 7 → 8      | No                | Response letter cross-references roadmap |
| 8 → 9      | Yes (Gate 5)      | Audit verdict clean (or knowingly so)    |
| 9 → 10     | Yes (Gate 6)      | Format matches declared venue            |

*Only when the user elects to skip Stage 3.
