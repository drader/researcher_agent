---
description: Full peer-review-style critique (5 reviewer reports + editorial decision + revision roadmap) via the critique skill in full mode.
model: sonnet
---

Invoke the `critique` skill in **full mode**.

Produce a complete peer-review-style critique of a manuscript: five
distinct simulated reviewer reports, an editorial decision letter,
and a revision roadmap. The output is a rehearsal of what real peer
review might surface; it is not a substitute for actual peer review.

Workflow:

1. Gather inputs:
   - The manuscript (full draft, attached or pasted)
   - Target venue if known (affects what counts as "in scope" and
     "out of scope")
   - Anything the user wants the simulated reviewers to weight
     (e.g., "be especially harsh on methodology", "focus on
     contribution significance")

2. Confirm scope with the user. Ask: do you want all five reviewer
   perspectives, or a subset? Do you want the editorial decision
   letter, or only the reviewer reports? The default is full.

3. Invoke the five reviewer perspectives in parallel where possible:
   - Reviewer 1 (methodology rigor) — methodology-critic agent
   - Reviewer 2 (literature grounding) — literature-critic agent
   - Reviewer 3 (clarity and presentation) — clarity-reviewer agent
   - Reviewer 4 (contribution significance) — devil-advocate + editorial-decider combined perspective
   - Reviewer 5 (general / completeness) — completeness-reviewer agent

   Each reviewer produces a report using the reviewer-report template.

4. Editorial-decider agent synthesizes the five reports into a
   decision letter (editorial-decision-letter template) with one of
   five recommendations: accept / accept-with-minor-revisions /
   major-revisions / reject-and-resubmit / reject.

5. Generate a revision roadmap derived from the union of issues
   across the five reports, deduplicated and severity-ranked.

6. Present the full package. Offer one revision pass to address
   user requests (e.g., "I think reviewer 2 is wrong about citation
   X — re-check").

Mandatory checkpoints: scope confirmation (step 2), final acceptance
(step 6).

Length: typically 3000–8000 words total (5 reviews × 500-1200 words
+ decision letter + roadmap).

Output discipline:
- Each of the five reviewer reports is genuinely distinct in voice
  and emphasis. If two reports converge on the same view, flag this
  as a possible failure of perspective diversity.
- The skill does NOT fabricate plausible-but-fake objections to pad
  reviews. If reviewer N has only two genuine issues, that report
  is short. Padding is worse than brevity.
- The editorial decision is a recommendation. The user makes the
  final decision.
- Output is an internal preparatory artifact. Never cite or treat
  as a real independent peer review.
