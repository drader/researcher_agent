---
description: Critical review of one provided source via the research skill in evaluate mode.
model: sonnet
---

Invoke the `research` skill in **evaluate mode**.

The user provides one source (an article, a chapter, a working paper,
a report) and wants a careful critical review of it. Distinct from
`verify` (which fact-checks claims against external sources) and
distinct from the `critique` skill (which simulates peer review of
a draft manuscript).

Workflow:

1. Confirm the source. If the user has not attached it or shared
   the full text, ask: do they want you to (a) read it now (paste
   or link), or (b) work from a public abstract / summary? Note
   that (b) limits the depth of the review.

2. Read the source. Take notes on:
   - The author's central claim or thesis
   - The evidence offered
   - The methodology used (if empirical)
   - The argument structure (if theoretical)
   - The stated scope and limitations
   - The implicit framing assumptions

3. Locate the source in its scholarly context:
   - Publication venue and audience
   - Approximate date relative to the field's state of the art
   - Cited by whom, citing whom (if accessible)

4. Critical review covering (each ~150–300 words):

   a. **Argument summary** — what the source claims, in your own
      words, distinct from what the author wrote
   b. **Evidence quality** — strength of the evidence relative to
      the claim; sample sizes, study design, data sources
   c. **Methodology** — appropriateness of the method to the question;
      defensible choices and questionable ones
   d. **Scope and generalization** — what the source's results can
      and cannot support
   e. **Context and competing accounts** — how the source compares
      to alternative views in the field; whether the author engaged
      with them fairly
   f. **Stated limitations** — what the author acknowledged, what
      they did not
   g. **Implications** — what the source contributes if its claims
      hold; what shifts if they do not
   h. **Recommendation** — for what purposes this source is reliable,
      for what purposes it is not

5. Brief closing assessment (2–4 sentences) that the user could
   adapt for an annotated bibliography or for citing the work in
   their own writing.

Output: a structured review, 1500–3500 words depending on the
source's depth. Use headings (a–h above) as section markers.

Tone: professional, neutral, constructive. Disagreement is allowed
and often necessary; ad hominem is not. Distinguish what you can
say from the source's text versus what you are inferring; the latter
should be flagged ("I read this to mean..." rather than "the author
clearly thinks...").

If you cannot access the full text and are working from abstract or
summary only, say so explicitly at the top of the review and limit
the depth of sections that require full-text access (methodology,
evidence quality).
