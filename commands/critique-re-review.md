---
description: Verify that revisions addressed the original review's issues via the critique skill in re-review mode.
model: sonnet
---

Invoke the `critique` skill in **re-review mode**.

The user has revised a manuscript in response to a prior review.
This mode verifies that each issue raised in the original review
was actually addressed, partially addressed, or appropriately
disagreed with.

Workflow:

1. Gather inputs:
   - Original review (the critique from a prior run, or an external
     peer review document)
   - Author's response letter (if available)
   - Revised manuscript

2. Build an issue index from the original review. For each issue:
   - Original comment text
   - Manuscript section it touched
   - Severity classification

3. For each issue, examine the author's response and the revised
   manuscript:
   - **Addressed** — the response engages with the issue and the
     manuscript shows a corresponding change
   - **Partially addressed** — the response engages but the change
     is incomplete; OR the change is made but the response is silent
   - **Not addressed** — the response and manuscript both show no
     change, without explicit justification
   - **Disagreement** — the response argues against the issue;
     evaluate whether the argument is reasonable
   - **Cannot determine** — the response references a change but
     the change is not locatable; flag for the user

4. Identify new issues introduced by revisions (changes can create
   problems even while fixing others).

5. Produce the re-review-report template:
   - Per-original-issue table (Original | Author response | Reviewer
     assessment | Notes)
   - New issues introduced by revision
   - Residual issues from the original review
   - Recommended next decision: accept / minor-revisions-still-needed /
     major-revisions-still-needed / reject

6. Optional: editorial-decider synthesizes into an editor's response
   letter if requested. Skipped by default.

Mandatory checkpoint: final acceptance.

Length: depends on the original review size. Typically 1000–3500 words.

Output discipline:
- The original review's issues are the agenda; do not introduce new
  agenda items unless they are direct consequences of revisions.
- An author's argued disagreement is legitimate. Evaluate the
  argument, do not insist on the original position.
- "Cannot determine" is a legitimate verdict. Better to flag than
  to guess.
