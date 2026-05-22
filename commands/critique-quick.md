---
description: Brief editor-style first-impression critique via the critique skill in quick mode.
model: sonnet
---

Invoke the `critique` skill in **quick mode**.

Produce a short, editor-style first-impression critique of a manuscript.
Use this when the user wants triage feedback before committing to a
full critique pass.

Workflow:

1. Gather inputs:
   - The manuscript (or its key sections: abstract, introduction,
     methods summary, results summary, conclusion)
   - Target venue if known
   - What the user wants the critique to focus on (default: overall
     submission readiness)

2. Read through the manuscript in pass-through mode. Note:
   - What is the central contribution as you read it?
   - Does the abstract match what the manuscript actually delivers?
   - Are the methods presented well enough to evaluate?
   - Do the results match what methods promised?
   - Are conclusions within what results actually support?
   - Is the manuscript at a stage where full peer review would be
     productive, or is more work needed first?

3. Output: a short report (300–800 words) with:
   - Overall first impression (one paragraph)
   - Top 3–5 issues ordered by severity
   - Rough disposition: probably-accept / probably-minor-revisions /
     probably-major-revisions / probably-reject / not-ready-for-review
   - One sentence on what the author should do next

4. No revision passes; this is a first-impression artifact. If the
   user wants depth, route to full mode.

Length: 300–800 words, no longer.

Output discipline:
- Identify the top issues, not all issues. Quick mode is triage,
  not comprehensive.
- Be honest about disposition. "Not ready for review" is a legitimate
  finding when the manuscript needs more work before peer review
  would be productive.
- Single-agent execution: completeness-reviewer leads, others
  consulted only as needed.
