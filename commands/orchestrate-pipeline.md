---
description: End-to-end research-to-manuscript pipeline (10 stages with mandatory checkpoints) via the orchestrate skill.
model: sonnet
---

Invoke the `orchestrate` skill in **pipeline mode**.

Run a full end-to-end research-to-manuscript pipeline: from scoping
the research question through final deliverable assembly. The
pipeline sequences invocations of the `research`, `compose`, and
`critique` skills with mandatory checkpoints between stages.

This is NOT an unattended run. The orchestrator halts at every
mandatory gate and waits for your input. Expect 2–6 hours of
collaborative work spread across multiple sessions.

Workflow:

1. Initial setup. Ask the user:
   - Topic / research interest (one paragraph is enough)
   - Target venue (journal name, conference, internal report, or
     "TBD — figure out during the pipeline")
   - Citation style preference (default: APA 7)
   - Time horizon (advisory only — affects what kinds of literature
     you may include)
   - Where to save the pipeline-logbook (default: `.claude/pipeline-logbook.json`)
   - Where to save intermediate deliverables (default: `outputs/pipeline/`)

   Confirm these in the pipeline-logbook before any stage runs.

2. Execute the 10 stages in order, dispatching each to the
   appropriate skill+mode:

   - **Stage 1: scope** — research-socratic (refine the question)
   - **Stage 2: lit-search** — research-full (literature investigation)
   - **Stage 3: synthesis** — research-systematic OR research-annotate
     (deeper synthesis; user-skippable if Stage 2 was enough)
   - **Stage 4: outline** — compose-outline (manuscript outline +
     evidence map)
   - **Stage 5: draft** — compose-full (initial manuscript draft)
   - **Stage 6: self-critique** — critique-full (5-reviewer simulated
     review + editorial decision + revision roadmap)
   - **Stage 7: revise** — compose-revision (apply revisions from
     self-critique)
   - **Stage 8: citation-audit** — compose-citation-check (citation
     consistency)
   - **Stage 9: finalize-format** — compose-format (target format)
   - **Stage 10: disclosure** — compose-disclosure (AI-assistance
     statement)

3. At each mandatory checkpoint (before Stages 2, 4, 5, 7, 9, 10):
   - Present the deliverable from the just-completed stage
   - Summarize what comes next
   - Ask the user: approve / edit / reject / pause
   - Block until the user resolves the checkpoint
   - Update the pipeline-logbook with the decision

4. State management. Before, during, and after each stage, the
   state-persistor agent maintains the pipeline-logbook. The pipeline-logbook records
   completed stages, deliverable paths, hashes, timestamps, user
   parameters, and pending checkpoints. The user can pause at any
   point; the pipeline-logbook is the bookmark.

5. Stage failure handling. If a stage cannot produce a valid
   deliverable (e.g., literature search yields too few sources),
   the orchestrator surfaces the failure to the user and offers:
   - Re-run with adjusted parameters
   - Accept the degraded deliverable with a recorded caveat
   - Abandon the pipeline (pipeline-logbook preserved for later)

6. Stage skipping. The user may skip stages by supplying the
   artifacts the skipped stages would have produced. The
   gap-detector agent validates that required inputs for the next
   stage are present and well-formed.

7. Pipeline completion. After Stage 10, present a deliverables
   manifest: every artifact produced, where it lives, and which
   stage produced it. The user can then use those artifacts
   independently of the orchestrator (the pipeline-logbook is preserved
   for re-runs or audits).

Mandatory checkpoints: 6 (before Stages 2, 4, 5, 7, 9, 10).

Refusals:
- This skill will NOT run unattended. Every mandatory gate halts
  the pipeline until the user responds.
- This skill will NOT skip checkpoints to save time.
- This skill will NOT make substantive content decisions; those
  belong to the underlying skills + user.

Output: a manifest at pipeline end + 10 staged deliverables saved
to the user's chosen output directory + an updated pipeline-logbook.
