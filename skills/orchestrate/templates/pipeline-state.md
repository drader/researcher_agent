# Pipeline State

This is a human-readable rendering of the current pipeline-logbook. It is
generated on demand from `.claude/pipeline-logbook.json` (or the
override path the user specified). The underlying JSON is the source
of truth; this document is for reading, not editing.

---

## Pipeline identity

- **Pipeline ID.** {{pipeline_id}}
- **Started at.** {{created_at}}
- **Last activity.** {{updated_at}}
- **Working directory.** {{working_directory}}
- **Pipeline Logbook path.** {{logbook_path}}
- **Status.** {{archived ? "Archived" : "Active"}}

---

## Current stage

- **Name.** {{current_stage}}
- **Status.** {{current_stage_status}}
- **Stage number.** {{current_stage_number}} of 10

{{If a checkpoint is pending, the section below is rendered;
otherwise it is omitted.}}

### Pending checkpoint

- **Gate.** {{gate_number}} (after Stage {{after_stage_number}})
- **First presented.** {{presented_at}}
- **Revision passes so far.** {{revision_passes}} of 2

---

## Completed stages

| # | Stage              | Skill+mode               | Completed   | Outcome             | Method     |
|---|--------------------|--------------------------|-------------|---------------------|------------|
| {{n}} | {{stage_name}} | {{skill}}-{{mode}}       | {{end_ts}}  | {{checkpoint_outcome}} | {{completion_method}} |

{{Repeat the row above for each entry in `completed_stages`. If a
row is marked `superseded`, append " (superseded)" to the stage
name.}}

---

## User parameters

- **Target venue.** {{target_venue}}
- **Citation style.** {{citation_style}}
- **Length target.** {{length_target_words}} words
- **Language.** {{language}}
- **Disclosure required.** {{disclosure_required ? "Yes" : "No"}}
- **Stage 2 mode election.** {{stage_2_mode}}
- **Stage 3 mode election.** {{stage_3_mode}}
- **Up-front skip elections.** {{skip_elections joined with ", "}}

---

## Pending decisions

{{If `pending_decisions` is empty, write "None." Otherwise list each
entry as a sub-section below.}}

### {{decision_id}}

- **Raised at.** {{raised_at}}
- **By.** {{raised_by}}
- **Description.** {{description}}
- **Options.** {{options joined with " | "}}

---

## Deliverables produced so far

{{Render each entry of `artifact_manifest` as a row in the table
below. If `superseded` is true, prefix the path with "[superseded] ".}}

| Stage | Kind                | Path                  | Size       |
|-------|---------------------|-----------------------|------------|
| {{produced_by_stage}} | {{kind}} | {{path}}              | {{size_bytes}} bytes |

---

## Estimated remaining work

{{The orchestrator estimates remaining work from the stages not yet
completed. The estimate is advisory wall-clock and assumes the user
is engaged. It is not a commitment; it does not estimate API cost.}}

- **Stages remaining.** {{10 - completed_count}} of 10
- **Approximate attended time remaining.** {{low_hours}}–{{high_hours}}
  hours, distributed across {{session_count_estimate}} sessions.
- **Heavy stages still ahead.** {{list of heavy stages not yet done,
  e.g. "lit-search, draft"}}

---

## Notes

{{User-attached notes from the pipeline-logbook's `notes` field, if any.
Omitted if the field is empty.}}

{{notes}}
