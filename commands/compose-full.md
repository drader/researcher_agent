---
description: Complete manuscript draft (IMRaD or domain-appropriate) via the compose skill in full mode.
model: sonnet
---

Invoke the `compose` skill in **full mode**.

Produce a complete first-draft manuscript from a confirmed outline,
a verified source list, and the user's intended target venue.

Workflow:

1. Verify inputs are present:
   - Approved outline (from compose-outline mode or from the user)
   - Verified source list (typically from `research` skill output)
   - Target venue or audience (journal name, conference, internal report)
   If any input is missing, ask before drafting. Do not silently
   substitute a generic structure.

2. Choose the structural template based on venue and field:
   - IMRaD (Introduction, Methods, Results, Discussion) — empirical
     research papers
   - Clinical case report — case + discussion
   - Systematic review template — if the user already ran the
     `research` skill's systematic mode, that output IS the manuscript
     scaffold; refine rather than reproduce
   - Philosophy / humanities essay — thesis, argument, counter-
     arguments, response, conclusion
   - Engineering paper — problem, approach, design, evaluation, related
     work, conclusion

   Confirm the template choice with the user before drafting.

3. Draft the manuscript section by section. For each section:
   - Pull facts from the verified source list only
   - Attribute each factual claim to a source with citation
   - Use the user's writing samples (if provided) as a voice anchor;
     otherwise default to clear professional academic register
   - Flag any claim that cannot be sourced

4. After the full draft is complete, run the report-compiler agent's
   internal checks: citation consistency, cross-reference integrity,
   section-length proportionality.

5. Present the draft. Offer up to two revision passes. After two,
   remaining issues become Unresolved Issues.

Mandatory checkpoints: input verification (step 1), template choice
(step 2), final acceptance (step 5).

Length target: depends on venue. Typical journal article 4000–8000
words; conference paper 2000–6000 words; report variable. Confirm
with the user.

Citation style: APA 7 default, but use venue's required style if known
(e.g., Vancouver for biomedical, IEEE for engineering).

This mode does NOT search for sources. If the source list is thin,
route the user to the `research` skill first.
