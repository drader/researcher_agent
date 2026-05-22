---
description: Continue a prior pipeline run from its saved checkpoint pipeline-logbook via the orchestrate skill in resume mode.
model: sonnet
---

Invoke the `orchestrate` skill in **resume mode**.

A prior pipeline run was paused (or interrupted). Pick up from the
saved pipeline-logbook file and continue. This mode is also used for re-runs
that branch off a prior stage (the user resets the pipeline-logbook boundary
to a specific stage and continues from there).

Workflow:

1. Locate the pipeline-logbook file:
   - Default: `.claude/pipeline-logbook.json`
   - If the user specifies a different path, use that
   - If multiple pipeline-logbooks exist, ask the user which to resume

2. Read the pipeline-logbook via state-persistor agent. Validate the schema.
   Extract:
   - Pipeline ID and start timestamp
   - All completed stages with their deliverable paths
   - Current stage (or last incomplete stage)
   - Pending checkpoint, if any
   - User parameters (topic, venue, citation style, etc.)

3. Present a recap to the user:
   - Started: {{date}}
   - Last activity: {{date}}
   - Stages completed: {{N}} of 10
   - Current state: {{at checkpoint X | mid-stage Y | between stages})
   - Deliverables produced so far: {{table}}

4. Ask the user how to proceed:
   - **Resume from next stage** — continue normally
   - **Revisit a prior stage** — user picks a stage; pipeline-logbook is reset
     by truncating completed-stages after that boundary; deliverables
     from later stages are archived (not deleted) but the pipeline
     restarts from the chosen point
   - **Resolve the pending checkpoint** (if one is pending)
   - **Inspect a specific deliverable** without advancing
   - **Abandon and start fresh** (the pipeline-logbook is archived, a new
     pipeline-logbook begins)

5. Once the user chooses, proceed accordingly. For resume-from-next,
   hand off to the pipeline-conductor agent in pipeline mode with
   the existing pipeline-logbook. For revisit, reset the pipeline-logbook to the
   chosen boundary and resume from there.

6. Validate handoffs. Before each new stage executes, the
   gap-detector verifies that the artifacts from prior stages are
   still present and well-formed. If any are missing or have changed
   (hash mismatch from pipeline-logbook record), flag this to the user and
   ask whether to:
   - Treat the change as intentional (update the pipeline-logbook hash)
   - Treat the change as accidental (restore from archive if available)
   - Re-run the affected stage

Mandatory checkpoints: same as pipeline mode for any stages newly
executed.

Refusals:
- Do not silently advance past a pending checkpoint. If the pipeline-logbook
  shows a pending checkpoint, the user must resolve it before resume.
- Do not modify a pipeline-logbook without recording the change.
- Do not delete prior deliverables; archive them when boundary-reset
  truncates the pipeline-logbook.

Output: continued pipeline execution, or a presented recap if the
user only wants to inspect rather than continue.
