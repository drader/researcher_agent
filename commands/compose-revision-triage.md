---
description: Parse reviewer comments into a structured revision roadmap (no draft changes yet) via the compose skill in revision-triage mode.
model: sonnet
---

Invoke the `compose` skill in **revision-triage mode**.

The user has received reviewer comments and wants help understanding
them and planning a response — before any actual revision happens.
This mode is purely planning; no draft changes are made.

Workflow:

1. Gather inputs:
   - Reviewer comments (verbatim or structured by reviewer)
   - Editor's decision letter
   - Current draft (for context; not modified)

2. Parse the comments. For each:
   - Classify: major / minor / optional / disagreement
   - Identify the underlying concern (often distinct from the literal
     comment — a reviewer says "this is unclear" but means "I don't
     see why your method works"). Surface the deeper concern.
   - Note which section of the manuscript the comment touches
   - Estimate effort and risk

3. Cluster comments. Find:
   - Independent comments (can be addressed in parallel)
   - Cross-comment dependencies (changing X affects Y)
   - Conflicting comments between reviewers (one says "expand", the
     other says "cut"; flag for author judgment)

4. Build the `revision-roadmap.md` template:
   - Per-reviewer summary
   - Per-comment classification + concern + section + effort + risk
   - Cluster groups
   - Dependency graph
   - Recommended sequencing
   - Items requiring author judgment (conflicting comments, scope
     decisions, optional pushback)

5. Draft a skeleton of the response letter (template fields only,
   not filled in). This gives the author a target shape for the
   actual response when they later run revision mode.

6. Present the roadmap + response-letter skeleton. Ask which
   comments the author wants to discuss before moving to revision
   mode.

Mandatory checkpoint: roadmap acceptance (step 6).

Output: revision roadmap + response-letter skeleton. Typical length
2000–5000 words depending on review depth.

This mode does NOT modify the draft. When the author is ready to
revise, switch to revision mode with the roadmap as input.

Refusals:
- Do not interpret unclear reviewer intent without flagging it.
  "Reviewer 2 may be asking for X, but the comment also reads as Y;
  recommend asking the editor for clarification" is appropriate.
- Do not recommend pushing back on a comment unless the author has
  a substantive reason. Default disposition is "addressed".
