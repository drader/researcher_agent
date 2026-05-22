# Mandatory Checkpoint

This is what the `checkpoint-coordinator` presents to the user when
the pipeline reaches a mandatory gate. The shape is the same at every
gate; only the stage names and the next-stage preview change.

---

## Stage just completed

- **Stage.** {{stage_number}} — {{stage_name}}
- **Skill+mode.** {{skill}}-{{mode}}
- **Started.** {{start_ts}}
- **Finished.** {{end_ts}}
- **Elapsed (this stage).** {{elapsed_human_readable}}

---

## What the artifact contains

{{Two to four sentences of structural summary. Describe the artifact
by its shape, not by paraphrasing its content. Examples:

- For Stage 1: "A scope-summary listing five candidate questions
  with one selected, three included subfields, and a recommendation
  to run Stage 2 in `full` mode."
- For Stage 3 (annotate): "An annotated bibliography of 18 sources,
  each with a summary, methodology note, and relevance note."
- For Stage 4: "An outline of seven sections (IMRaD-style with a
  related-work split out from introduction) and an evidence map
  linking each section to between two and six sources."

The coordinator does not paraphrase the artifact's argument. The user
is expected to read the artifact directly.}}

---

## Where the artifact lives

{{For each path in `artifact_paths` for this stage, list it as a
bullet. Paths are absolute or project-relative depending on the
working-directory configuration.}}

- {{artifact_path_1}}
- {{artifact_path_2}}

---

## What comes next

{{One sentence describing what Stage N+1 will do if you approve.
Examples:

- After Stage 1: "Stage 2 (lit-search, `full` mode) will run a
  literature search against the locked primary question and produce
  a research report with a verified reference list."
- After Stage 4: "Stage 5 (draft, `full` mode) will produce the
  complete manuscript draft from the outline and the upstream
  reference list."}}

---

## Decision required

Choose one:

- **Approve.** Advance to Stage {{next_stage_number}}
  ({{next_stage_name}}).
- **Edit.** Supply specific edits or instructions to refine the
  artifact. The underlying skill applies them and the artifact is
  re-presented here.
- **Reject.** Re-run a stage. By default this re-runs the just-completed
  stage ({{stage_name}}); you may name a different earlier stage if
  the problem is upstream.
- **Pause.** Stop here for now. The pipeline-logbook is preserved and you can
  resume in a later session by invoking the orchestrator again.

Please respond with one of the four resolutions and, if editing or
rejecting, the specific direction.

---

## Loop status

- **Revision passes on this gate so far.** {{revision_passes}} of 2.

{{If `revision_passes` is 2, append:

"This will be the final revision pass on this gate. After this pass,
any remaining concerns will be recorded as Unresolved Issues
carried forward in the pipeline-logbook, or you may reset to a prior stage
rather than accept the artifact."}}

---

## Time-elapsed note

- **Time since pipeline started.** {{elapsed_since_created_human}}
- **Time since last checkpoint resolution.** {{elapsed_since_last_gate_human}}
- **Sessions used so far.** approximately {{session_count}} session(s).

This note is informational. It does not change the decision you are
being asked to make.
