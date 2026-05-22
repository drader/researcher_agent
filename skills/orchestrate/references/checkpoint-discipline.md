# Checkpoint Discipline

This document explains the framework's checkpoint philosophy: why the
pipeline halts where it halts, what is presented at each halt, how the
user resolves it, and how the revision loop at each gate is bounded so
that the pipeline does not spiral on a single artifact.

The shorthand is: the orchestrator stops six times, the user decides
each time, and after at most two revision passes any remaining concerns
become recorded limitations rather than another loop.

---

## Why mandatory checkpoints exist

A pipeline that runs end-to-end without intervention is fast and wrong
in ways that compound. Every stage's output narrows the search space
the next stage operates over. If the scope is locked on the wrong
question, the literature search wastes time on the wrong literature; if
the outline commits to claims the evidence does not support, the draft
adopts the same defect and the critique inherits it. Mandatory
checkpoints exist where:

- **The decision is hard to reverse later.** Once a draft is written,
  re-scoping the question means discarding most of the work. The cost
  curve rises sharply across the pipeline. The gates sit at the lowest
  points of that curve where the cost of reversal is still moderate.
- **User judgment is the only competent arbiter.** "Is this the
  question you want to answer?" is not a structural question the
  `gap-detector` can verify. It is a value judgment about the user's
  goals, the venue's expectations, and the user's commitment to the
  framing. Only the user can answer it.
- **Silent advancement misrepresents intent.** Producing a manuscript
  the user has not approved at the gating points falsely implies the
  user endorsed every framing decision along the way. The disclosure
  at Stage 10 reflects the user's documented choices; checkpoints are
  where the documentation happens.

These three rationales — irreversibility cost, judgment requirement,
intent representation — together explain why the gates are mandatory
rather than advisory.

---

## The six mandatory gates

Recap from the canonical pipeline definition:

| Gate | After Stage | Decision being made                                  |
|------|-------------|------------------------------------------------------|
| 1    | 1 (scope)   | Is this the primary question the project commits to? |
| 2    | 3 (synthesis) | Is this the evidence base the manuscript builds on? |
| 3    | 4 (outline) | Does this outline reflect the argument the user wants to make, and is every section backed by evidence? |
| 4    | 6 (critique) | Are the revision priorities the right ones?         |
| 5    | 8 (audit)   | Are the citations clean enough to format?            |
| 6    | 9 (format)  | Is the manuscript ready to be a final artifact?      |

Each gate has a specific decision in view. The orchestrator presents the
deliverable and frames the question. The user answers.

---

## The four resolutions

At any mandatory checkpoint the user has four resolutions available.
The checkpoint-coordinator presents them explicitly when prompting.

### Approve

The user accepts the deliverable as-is. The orchestrator marks the
checkpoint outcome as `approved`, persists the pipeline-logbook, and advances
to the next stage.

Approval should be explicit. A reply like "looks fine" without naming
the deliverable is ambiguous; the coordinator asks a clarifying
question rather than treating it as approval.

### Edit

The user accepts the deliverable in substance but supplies edits. The
edits may be inline corrections, additions, or instructions to refine
particular passages. The orchestrator routes the edits to the
underlying skill for application, then re-presents the revised
deliverable at the same checkpoint. The checkpoint outcome is marked
`edited` only after the final post-edit approval; it does not reset to
`pending` indefinitely.

### Reject

The user rejects the deliverable and asks for a re-run. The reject
resolution names which stage to re-run from. Usually it is the stage
just completed, but the user may name an earlier stage if the problem
is rooted upstream (for example, rejecting an outline because the
underlying lit-search missed a key sub-literature: the user resets to
Stage 2). The orchestrator delegates the truncation of the pipeline-logbook
to the `state-persistor` and routes back to the named stage.

### Pause

The user halts the pipeline at this checkpoint and exits the session.
This is not a rejection; the deliverable remains accepted-in-principle
or pending review. The orchestrator persists the pipeline-logbook, marks the
checkpoint as `pending` (if not yet resolved) or carries the
resolution-so-far (if mid-edit), and exits cleanly. The user resumes
later via the `resume` mode.

Pause is always available, regardless of whether a checkpoint is
active. Pause from a non-checkpoint boundary simply records the
in-progress stage state.

---

## What the checkpoint-coordinator presents

When a mandatory checkpoint fires, the coordinator presents to the user
a structured prompt with these elements:

- **Stage just completed.** The number and name of the stage whose
  deliverable is on the table.
- **Deliverable summary.** Two to four sentences describing what the
  artifact contains — not a content summary in the sense of paraphrase,
  but a structural one: how many sources, which sections, key
  decisions made.
- **Artifact location.** The path or paths to the file(s) so the user
  can open them in their editor.
- **Next stage preview.** A one-sentence statement of what Stage N+1
  will do if the user approves.
- **The decision menu.** The four resolutions named explicitly, with
  brief guidance on which to choose when.
- **Time-elapsed note.** Wall-clock time since the pipeline started
  and since the prior checkpoint. This is informational; it does not
  alter what the user is asked.

The coordinator does not summarize the artifact's *content* beyond the
structural sense. The user is expected to read the artifact; the
coordinator does not paraphrase it into a substitute.

The full template for the prompt lives in `templates/checkpoint-prompt.md`.

---

## The two-revision-loop discipline

Without bounds, a checkpoint can spiral: the user requests an edit, the
edit introduces a new concern, another edit, another concern, and the
pipeline stalls on one stage indefinitely. The framework imposes a
loop bound that each underlying skill is expected to honor and that
the orchestrator surfaces at the pipeline level: **after two revision
passes against the same artifact, remaining concerns become
Unresolved Issues** carried forward in the pipeline-logbook.

This means:

- Pass 1: original deliverable. User reviews. If accepted or edited
  cleanly, the gate resolves.
- Pass 2: revised deliverable incorporating Pass 1's edits or
  rejection rationale. User reviews again. If accepted, the gate
  resolves; if edited cleanly, those edits are applied and the gate
  resolves.
- Pass 3 (if reached): the deliverable is presented one last time with
  whatever could not be resolved in the prior two passes explicitly
  surfaced as proposed Unresolved Issues. The user either
  accepts the deliverable with those limitations recorded, or rejects
  and resets to a prior stage.

The two-pass bound is per-checkpoint, not per-pipeline. Stage 4 (the
outline) may go through its two revision passes, and then Stage 6 (the
critique) may go through its own two passes independently.

The discipline exists because:

- It prevents single-stage stalls that block the rest of the pipeline.
- It preserves user authority — the user always has the option to
  reset rather than accept limitations.
- It documents what was unresolved, so downstream stages know the
  upstream is provisional.

The user may always pause within the loop; pause does not consume a
pass.

---

## Checkpoints and stage skipping

When the user skips a stage (either up-front at pipeline start or
mid-pipeline at a prior checkpoint), the *content* of the skipped stage
is supplied externally, but the *gate* after that stage is not
automatically resolved. The orchestrator still presents the supplied
artifact at the gating checkpoint and asks for explicit approval.

This is a design choice: gates are about user commitment to the
artifact, not about whether the framework produced it. An externally
supplied outline still requires the user to commit at Gate 3 before
the draft is begun. The gate's approval timestamp matters even when
the artifact's production timestamp is older.

The only exception is when the user is supplying every artifact from
the beginning of the pipeline through some midpoint — for example,
"I have already done Stages 1 through 5 outside the framework; pick up
at Stage 6." In that case, the orchestrator runs a single consolidated
acceptance step covering the supplied artifacts, then begins the
framework-driven work at Stage 6. The individual gates for the
externally produced upstream stages are recorded as `approved` with a
note that they reflect the consolidated acceptance.

---

## Optional vs mandatory checkpoints

Beyond the six mandatory gates, there are two other kinds of pause
points worth distinguishing.

- **Inner-skill acceptance steps.** Every underlying skill has its own
  acceptance step before declaring its work complete. These are not
  pipeline-level gates; they belong to the inner skill. They still
  halt the work — the user must accept the inner deliverable — but
  they are gates within the stage, not between stages.
- **User-initiated pauses.** The user may pause at any stage boundary,
  not only at mandatory gates. The orchestrator persists state and
  exits. This is "optional" only in the sense that the orchestrator
  does not initiate it; the user does.

The mandatory gates differ from these by being orchestrator-initiated
and by always presenting the four-resolution menu. Inner-skill steps
have their own menus. User-initiated pauses have no menu — the user is
already deciding to stop.

---

## User-initiated pause and resume semantics

When the user types something equivalent to "pause," "stop here for
today," or "let's pick this up later," the orchestrator:

1. Confirms the pause intent (one short question, to avoid pausing on
   an ambiguous reply).
2. Records the current state in the pipeline-logbook: which stage is in
   progress, whether a checkpoint is pending, what user parameters
   are set.
3. Reports the pause: pipeline-logbook path, current stage, what will happen
   on resume.
4. Exits cleanly.

When the user later invokes the orchestrator in the same project, the
default mode is `resume`. The protocol is the one specified in the
skill's main definition: load pipeline-logbook, present recap, ask how to
proceed (resume, revisit, inspect, abandon). The resume protocol
respects whatever state the pause captured.

A pause within a mandatory checkpoint preserves the checkpoint as
`pending`. On resume, the coordinator re-presents the same checkpoint
prompt from scratch — the resume is not a continuation of the
checkpoint dialogue but a fresh presentation, so the user is not
relying on remembered context from the prior session.

A pause within an inner-skill acceptance step preserves the in-progress
stage. On resume, the orchestrator returns control to the inner skill
to resume its own acceptance step, which the inner skill manages.

---

## Closing posture

Checkpoints are the design, not the friction. The orchestrator does
not try to minimize the number of times it halts; it tries to make
each halt count. A user who feels the gates are excessive is being
asked to make decisions the design considers important enough to
require explicit consent. If the user wants a different cost curve,
they can use the individual skills without the orchestrator. The
orchestrator's contract is that it does not advance without consent.
