---
description: Detailed manuscript outline with evidence map via the compose skill in outline mode.
model: sonnet
---

Invoke the `compose` skill in **outline mode**.

Produce a detailed outline of a planned manuscript without drafting
the full prose. The outline serves as the bridge between research
outputs and full drafting.

Workflow:

1. Gather inputs:
   - Research question (refined from `research-socratic` or user-supplied)
   - Verified source list with quality flags
   - Target venue or audience
   - The author's central claim or contribution

2. Propose a structural skeleton matched to venue and field. Present
   it to the user for explicit approval before adding content. Ask:
   "Use IMRaD, or another structure?"

3. For each section, list:
   - Section heading
   - Approximate word count
   - Key points (3–7 bullets)
   - Evidence map: which source(s) support each key point
   - Open questions or gaps in evidence (flagged for the author)

4. Identify cross-section dependencies (e.g., "this Discussion point
   responds to the limitation introduced in Methods §3.2"). List
   these as a dependency map at the end of the outline.

5. Present the outline. Offer one revision pass to adjust structure,
   add sections, or rebalance proportions.

Mandatory checkpoints: structural approval (step 2), final acceptance
(step 5).

Output length: typically 800–2500 words depending on manuscript size.
Use Markdown headings for sections, nested bullet lists for points.

This is a planning artifact. The user reads it, edits it, then either
runs `compose-full` to draft, or hands sections to other modes.

If evidence for any section is thin or absent, flag this rather than
papering over it. The author may need to run more `research` before
drafting.
