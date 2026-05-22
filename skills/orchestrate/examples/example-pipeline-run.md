# Example: a worked end-to-end pipeline run

> Illustrative only. The topic, intermediate artifacts, and final
> deliverables below are fictional, produced as a worked example for
> the `orchestrate` skill. Names of sources, source counts, and
> timing figures are made up for illustration. Do not cite this
> example or its synthetic sources elsewhere.

This document walks through a complete pipeline from initial prompt
through final disclosure on a synthetic topic. The intent is to show
what the user sees at each step and how the pipeline-logbook evolves. The
substantive content of each artifact is sketched in 2 to 3 sentences;
in a real run the artifacts would be much longer.

The synthetic topic is:

> *An empirical study of energy savings from event-based vision
> sensors in always-on wearable devices.*

The illustrative venue is *Journal of Low-Power Embedded Sensing*
(fictional). Citation style: IEEE. Language: English. Target length:
6,000 words.

---

## Initial setup

**User prompt.** "I want to write a paper comparing the energy budget
of frame-based and event-based cameras for always-on wearable
devices. I have some bench measurements from our lab and a sense of
the literature, but I need help shaping the question and going from
there to a finished paper."

**Scope dialog summary (compressed).** The orchestrator engages
`research-socratic` for Stage 1. Across about 45 minutes of dialog,
candidate questions emerge:

1. Are event-based vision sensors meaningfully more energy-efficient
   than frame-based sensors in always-on wearable contexts?
2. At what duty cycle does the crossover occur between frame-based
   and event-based being the more efficient choice?
3. Does the answer depend on the downstream pipeline (classifier,
   detector, raw recording)?

The user selects question 2 as primary, with question 3 carried as a
secondary lens. The scope-summary names: included subfields
(wearables, neuromorphic vision, event-based sensors), time window
(2018 to present), exclusions (vehicle-mounted automotive vision,
which has different power budgets). Stage 2 is recommended in `full`
mode given the venue's expected length.

**Pipeline Logbook at start (just-created).**

```
pipeline_id:           event-vision-wearables-20260521T091500Z
current_stage:         scope
current_stage_status:  in-progress
completed_stages:      []
user_parameters:
  target_venue:        Journal of Low-Power Embedded Sensing
  citation_style:      IEEE
  length_target_words: 6000
  language:            en
  disclosure_required: true
```

---

## Stage 1 — scope

- **Skill+mode.** research-socratic.
- **Artifact (sketch).** A scope-summary document listing the three
  candidate questions, marking question 2 as primary, naming the
  included subfields and time window, declaring vehicle-mounted
  exclusions, and recommending Stage 2 in `full` mode.
- **Checkpoint resolution (Gate 1).** Approved. The user agrees that
  question 2 is the question; question 3 stays as a secondary lens.
- **Pipeline Logbook update.** Stage 1 record appended with
  `checkpoint_outcome: approved`. `current_stage` advances to
  `lit-search`.

---

## Stage 2 — lit-search (first attempt; failure example)

- **Skill+mode.** research-full.
- **Artifact (sketch).** A literature report on event-based vs
  frame-based vision sensors. First-pass retrieval yielded only 18
  verified sources after filtering — well below `research-full`'s
  minimum of 30.
- **Failure.** The underlying skill flagged the deliverable as
  insufficient: too-few-sources, threshold breach. The orchestrator
  did not advance silently; it surfaced the failure to the user with
  the three-option menu.
- **User decision.** Broaden the scope: relax the wearable-only
  restriction to "wearable and adjacent body-worn devices", widen the
  time window to 2015–present (instead of 2018), and add adjacent
  terms covering "dynamic vision sensor" alongside "event-based
  camera." Re-run Stage 2.
- **Pipeline Logbook update.** No completed-stage record yet. The pending
  decision is resolved; the user's parameter changes are recorded.

### Stage 2 — second attempt

- **Skill+mode.** research-full (re-run with broadened parameters).
- **Artifact (sketch).** A literature report with 47 verified sources
  organized into five themes: sensor architectures, power
  measurements, downstream-pipeline studies, deployment case studies,
  and methodology debates. Per-source citations carry DOIs or arXiv
  IDs.
- **Inner-skill acceptance.** User accepts the report. No
  pipeline-level gate after Stage 2.
- **Pipeline Logbook update.** Stage 2 record appended with `mode: full`,
  `checkpoint_outcome: not-applicable`, `completion_method: framework`.
  47 sources logged. `current_stage` advances to `synthesis`.

---

## Stage 3 — synthesis

- **Skill+mode.** research-annotate (the user does not want a full
  PRISMA-style systematic review; the venue does not require one).
- **Artifact (sketch).** An annotated bibliography of 22 of the 47
  retrieved sources, selected as most directly relevant to the
  duty-cycle crossover question. Each entry has a summary, a
  methodology note, and a relevance note.
- **Checkpoint resolution (Gate 2).** Edited. The user notes that
  two of the methodology summaries underplay sensor-noise
  considerations that matter for low-light wearable contexts. The
  underlying skill applies the edits; the artifact is re-presented;
  the user approves on pass 1 of the loop.
- **Pipeline Logbook update.** Stage 3 record appended with
  `mode: annotate`, `checkpoint_outcome: edited`, notes recording
  the noise-consideration revision.

---

## Stage 4 — outline

- **Skill+mode.** compose-outline.
- **Artifact (sketch).** An outline with seven sections: introduction,
  background on sensor architectures, methods, bench-measurement
  results, simulation extension to higher duty cycles, discussion,
  conclusion. An evidence map ties each section to between three and
  eight of the 47 sources. Per-section word counts allocated to sum
  to the 6,000-word target.
- **Checkpoint resolution (Gate 3).** Edited. The gap-detector flags
  that the "simulation extension" section has only two mapped sources
  and one of them is a methodology paper rather than a primary
  result. The user accepts the gap as a known thin spot and adds a
  brief note that this section will be presented as exploratory. The
  artifact is re-presented; the user approves on pass 1.
- **Pipeline Logbook update.** Stage 4 record appended with `checkpoint_outcome:
  edited`, notes recording the thin-spot acknowledgement. Two
  artifact records added: `outline.md` and `evidence-map.md`.

---

## Stage 5 — draft

- **Skill+mode.** compose-full.
- **Artifact (sketch).** A 6,200-word manuscript draft in IMRaD form
  (with the simulation-extension section folded into discussion as
  exploratory). In-text citations applied throughout. Reference list
  generated from the upstream 47 sources, with the 25 actually cited
  retained. The draft assembly took two sessions distributed across
  three calendar days.
- **Inner-skill acceptance.** User accepts the draft. No
  pipeline-level gate after Stage 5.
- **Pipeline Logbook update.** Stage 5 record appended; artifact record for
  `draft.md` added; `current_stage` advances to `self-critique`.

---

## Mid-pipeline pause example

After Stage 5, the user types: "I want to pause here and come back to
this next week — I'd like a few days to reread the draft on my own
before the self-critique stage."

**Orchestrator response (compressed).** Confirms the pause intent.
Reports: pipeline-logbook saved at `.claude/pipeline-logbook.json`,
`current_stage: self-critique`, `current_stage_status: pending`. The
user can resume by invoking the orchestrator from the same project
directory; it will default to `resume` mode and present a recap.

The orchestrator exits cleanly. The session ends.

### Resume (one week later)

The user starts a new Claude Code session in the same project. They
invoke the orchestrator. The pipeline-logbook is read; the recap is
presented:

- Pipeline ID: `event-vision-wearables-20260521T091500Z`
- Started: 21 May 2026, 09:15 UTC
- Last activity: 23 May 2026, 16:08 UTC
- Completed stages: 1 through 5 (scope, lit-search, synthesis,
  outline, draft)
- Current stage: self-critique (pending)
- No unresolved checkpoint
- Five artifacts in the manifest

The user chooses "resume." The orchestrator runs an input-hash check
on the draft (matches), and dispatches Stage 6.

---

## Stage 6 — self-critique

- **Skill+mode.** critique-full.
- **Artifact (sketch).** Five simulated reviewer reports, an editorial
  decision letter recommending "major revisions," and a revision
  roadmap with 14 itemized actions covering: clarification of the
  duty-cycle definition (3 items), strengthening of methods (4),
  better engagement with two contested sources (3), tightening of
  conclusions (2), and minor editorial points (2).
- **Checkpoint resolution (Gate 4).** Approved. The user agrees that
  the roadmap is the right set of priorities, including the items
  the user had themselves noted as thin spots.
- **Pipeline Logbook update.** Stage 6 record appended with
  `checkpoint_outcome: approved`. Artifact records for the five
  reviewer reports plus the roadmap added.

---

## Stage 7 — revise

- **Skill+mode.** compose-revision.
- **Artifact (sketch).** A revised manuscript (now 6,650 words) and a
  point-by-point response letter addressing each of the 14 roadmap
  items. Two items are explicitly deferred: one because it would
  require new bench measurements outside the paper's scope, and one
  because the contested source it referred to has since been
  retracted (the response letter notes the retraction and updates the
  reference).
- **Inner-skill acceptance.** User accepts. No pipeline-level gate
  after Stage 7.
- **Pipeline Logbook update.** Stage 7 record appended. Artifact records for
  the revised manuscript and the response letter added. The two
  deferred items are recorded as Unresolved Issues.

---

## Stage 8 — citation-audit

- **Skill+mode.** compose-citation-check.
- **Artifact (sketch).** Citation consistency report finding six
  issues: three orphan reference entries (cited in earlier drafts but
  not in the revision), two style inconsistencies (mix of "et al." and
  full author lists in inline citations), one DOI mismatch. All six
  are resolved by the user during the audit pass.
- **Checkpoint resolution (Gate 5).** Approved. Verdict: clean.
- **Pipeline Logbook update.** Stage 8 record appended with
  `checkpoint_outcome: approved`. Audit report artifact recorded.

---

## Stage 9 — finalize-format

- **Skill+mode.** compose-format.
- **Artifact (sketch).** Manuscript converted to the venue's required
  IEEE conference-style LaTeX template. Bibliography rendered with
  the venue's `.bst` file. PDF compiled and visually inspected. Figure
  files referenced; no embedded raster images.
- **Checkpoint resolution (Gate 6).** Approved. The user agrees the
  manuscript is ready as a final artifact.
- **Pipeline Logbook update.** Stage 9 record appended. Artifact records for
  the `.tex` source, the compiled `.pdf`, and the supporting bib file
  added.

---

## Stage 10 — disclosure

- **Skill+mode.** compose-disclosure.
- **Artifact (sketch).** A standalone disclosure statement enumerating
  the framework's contributions: AI-assisted question framing
  (Stage 1), literature search (Stage 2), synthesis (Stage 3),
  outline construction (Stage 4), drafting (Stage 5), simulated peer
  review (Stage 6), revision (Stage 7), citation audit (Stage 8),
  formatting (Stage 9). The disclosure clarifies that the user
  reviewed and approved every stage's output, that the bench
  measurements and lab data are the user's, and that the literature
  citations were verified by the framework but checked by the user.
- **Acceptance.** User accepts the disclosure on pass 1.
- **Pipeline Logbook update.** Stage 10 record appended with
  `checkpoint_outcome: not-applicable` (Stage 10 has acceptance, not a
  gate). Disclosure artifact recorded.

---

## Final deliverables manifest

The orchestrator produces the deliverables manifest. Compressed
example:

- **Pipeline ID.** event-vision-wearables-20260521T091500Z
- **Started.** 21 May 2026, 09:15 UTC
- **Ended.** 28 May 2026, 14:50 UTC
- **Total attended time (approx).** 5 hours 40 minutes across
  approximately 7 sessions over 8 calendar days.
- **Per-stage entries.**

| # | Stage              | Skill+mode               | Artifact(s)                                | Gate outcome       | Method     |
|---|--------------------|--------------------------|--------------------------------------------|--------------------|------------|
| 1 | scope              | research-socratic        | scope-summary.md                           | approved (Gate 1)  | framework  |
| 2 | lit-search         | research-full            | lit-report.md (47 sources)                 | not-applicable     | framework  |
| 3 | synthesis          | research-annotate        | annotated-bib.md (22 sources)              | edited (Gate 2)    | framework  |
| 4 | outline            | compose-outline          | outline.md, evidence-map.md                | edited (Gate 3)    | framework  |
| 5 | draft              | compose-full             | draft.md                                   | not-applicable     | framework  |
| 6 | self-critique      | critique-full            | critique-reports/, roadmap.md              | approved (Gate 4)  | framework  |
| 7 | revise             | compose-revision         | manuscript-rev.md, response-letter.md      | not-applicable     | framework  |
| 8 | citation-audit     | compose-citation-check   | citation-audit.md                          | approved (Gate 5)  | framework  |
| 9 | finalize-format    | compose-format           | manuscript.tex, manuscript.pdf, refs.bib   | approved (Gate 6)  | framework  |
| 10| disclosure         | compose-disclosure       | disclosure.md                              | not-applicable     | framework  |

- **Consolidated cited sources.** 25 unique sources (deduplicated
  across the lit-report and revisions).
- **Acknowledged limitations propagated up.**
  - Simulation-extension section presented as exploratory due to thin
    direct-source support.
  - Two Stage 6 roadmap items explicitly deferred (one out-of-scope,
    one due to source retraction).
- **Disclosure statement.** (Quoted in full in the actual manifest;
  omitted here for brevity in the example.)

---

## What the example illustrates

- Every mandatory gate halted the pipeline. Approval was always
  explicit.
- One stage failed cleanly (Stage 2, too-few-sources) and was rerun
  with broadened parameters; the orchestrator did not silently lower
  the bar.
- A mid-pipeline pause (after Stage 5) was handled cleanly by
  persisting state and resuming a week later from the recap.
- Two stages produced edits at their gate (synthesis, outline) and
  one stage produced explicit Unresolved Issues at the
  revision stage; both were propagated forward without losing
  visibility.
- The final manifest carries provenance for every artifact and
  surfaces the disclosure statement that ends the pipeline.

The real run would differ in detail — different topic, different
sources, different gate outcomes — but the shape of the workflow is
the shape shown here.
