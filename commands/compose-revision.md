---
description: Apply revisions to a draft and produce a point-by-point response letter via the compose skill in revision mode.
model: sonnet
---

Invoke the `compose` skill in **revision mode**.

The user has received reviewer comments (or has self-edits planned)
and wants both: the revised manuscript and a point-by-point response
letter explaining the changes.

Workflow:

1. Gather inputs:
   - Current draft (manuscript file or paste)
   - Reviewer comments (structured per-reviewer if multi-reviewer)
   - Editor's overall decision letter, if any
   - Author's preliminary disposition on each comment (accept, push
     back, partial, defer)
   If author disposition is missing, work through comments together
   in a brief dialog before revising.

2. Classify each reviewer comment:
   - **Major** — addresses correctness or central argument
   - **Minor** — wording, formatting, small clarifications
   - **Optional** — stylistic suggestions the author may decline
   - **Disagreement** — author will respond but not change

3. Build a revision plan in the `revision-roadmap.md` template:
   per-comment classification, action plan, dependency graph
   (which revisions depend on which), estimated effort, sequencing.

4. Apply revisions to the manuscript. For each:
   - Preserve citations across rewrites
   - Flag where a revision implicitly removes a citation
   - Mark insertion/deletion locations with `<rev-mark>` tags
     internally; remove before final output
   - Do not silently add new claims without sources

5. Produce the point-by-point response letter using the
   `response-letter.md` template. For each comment:
   - Reviewer's comment (paraphrased or quoted)
   - Author's response
   - Action taken (change made, deferred, disagree with reasoning)
   - Manuscript location of the change

6. Run citation-checker against the revised manuscript.

7. Present revised manuscript + response letter together. Offer up to
   two revision passes. After two, remaining issues become
   Unresolved Issues and are noted in the response letter as
   "addressed in part" with rationale.

Mandatory checkpoints: classification approval (step 2), revision
plan approval (step 3), final acceptance (step 7).

Refusals:
- Do not fabricate manuscript locations. If a planned change cannot
  be implemented, state so and propose alternatives.
- Do not silently soften the author's voice; revisions preserve
  authorial register.

Output: revised manuscript + response letter file. Citation style
matches the original manuscript.
