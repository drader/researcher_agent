# Stage Summary

Per-stage completion summary, recorded when a stage closes (whether
because its gate resolved, because its inner-skill acceptance step
closed without a gate, or because the user paused after a stage
boundary). The summary is appended to the pipeline-logbook's stage record
via the `notes` field and may be reproduced in the deliverables
manifest at pipeline end.

---

## Stage

- **Number.** {{stage_number}}
- **Name.** {{stage_name}}

---

## Duration

- **Started.** {{start_ts}}
- **Finished.** {{end_ts}}
- **Elapsed.** {{elapsed_human_readable}}
- **Sessions used.** {{session_count_for_this_stage}}

---

## Underlying skill+mode invoked

- **Skill.** {{skill}}
- **Mode.** {{mode}}
- **Completion method.** {{framework_or_external}}

{{If `completion_method` is `external`, append:

"This stage's artifact was supplied by the user rather than produced
by the framework. The structural contract for the artifact was
validated by the `gap-detector` before acceptance."}}

---

## Inputs consumed

{{List the artifact paths the stage took as input. For Stage 1 there
are no prior artifacts; for later stages, this lists the upstream
deliverables. Each entry includes the producing stage and a one-line
descriptor.}}

- Stage {{prior_stage_number}} ({{prior_stage_name}}):
  {{prior_artifact_path}} — {{prior_artifact_kind}}

---

## Deliverables produced

{{List each artifact path the stage produced, with kind and approximate
size.}}

- {{produced_artifact_path}} — {{kind}} ({{size_bytes}} bytes)

---

## Checkpoint outcome

- **Outcome.** {{approved | edited | rejected-rerun | not-applicable}}
- **Resolved at.** {{resolution_ts}}
- **Revision passes used.** {{revision_passes}} of 2 (gates only;
  non-gating handoffs always show 0)

{{If the outcome was `edited`, append a brief description of what
the user edited. If the outcome was `rejected-rerun`, append the
name of the stage the user reset to.}}

---

## Issues flagged during the stage

{{List any items the underlying skill or the gap-detector raised
during this stage. Examples:

- "gap-detector flagged that two outline sections had only one mapped
  source; user accepted with the limitation recorded."
- "research-full noted that 6 retrieved candidates could not be
  verified and were dropped; final reference count: 42."

If no issues were flagged, write "None.".}}

- {{issue_1}}
- {{issue_2}}

---

## Pending items for the next stage

{{Items the next stage will need to handle, surfaced now so the
hand-off is clean. Examples:

- "Stage 6 will need to weigh the limitation in the methods section
  flagged at outline approval."
- "Stage 4 may need to revisit the unmapped sub-theme on
  power-consumption profiles."

If nothing is pending beyond the standard hand-off, write
"None beyond the standard input contract.".}}

- {{pending_item_1}}
- {{pending_item_2}}

---

## Notes

{{Free-text notes from the user at the checkpoint, if any.}}

{{notes}}
