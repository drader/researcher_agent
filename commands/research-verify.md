---
description: Claim-by-claim fact-check with source locators via the research skill in verify mode.
model: sonnet
---

Invoke the `research` skill in **verify mode**.

This mode takes a piece of text (paragraph, article, draft section)
and checks each factual claim against external sources. It produces
a verification report, not a rewrite.

Workflow:

1. Ask the user to provide the text and, if available, the source
   list they used. If sources are not provided, you will search for
   them.

2. Parse the text into discrete claims. A claim is:
   - A factual statement (not opinion, not framing, not transition)
   - Either a quantitative claim (a number, a percentage, a year, a
     trend direction) or a qualitative claim about what is known
   Skip claims that are clearly the user's own analysis or argument.

3. For each claim:
   a. If the user provided a source: locate the claim in that source
      (with page number, section heading, or paragraph). Verify whether
      the source actually supports the claim as stated. Possible
      verdicts:
      - Verified: source supports the claim as stated
      - Partially supported: source supports a weaker or related
        version of the claim
      - Unsupported: source does not address the claim
      - Contradicted: source states the opposite or qualified
        opposite
   b. If no source was provided or the provided source is unsupported:
      attempt to find a supporting source independently. Report what
      you find.

4. Compile the `verification-report.md` template. For each claim:
   original text, source(s), verdict, locator, notes, alternative
   source (if applicable).

5. Provide a summary at the top of the report: count of claims by
   verdict.

6. Flag systemic issues: if many claims trace to the same source and
   that source is weak, note this. If the user appears to have
   repeated a chain of citations without verifying, note this.

Refusals:
- Do not silently fix the user's text. This mode reports; it does
  not edit. If the user wants edits, recommend transitioning to
  `compose` skill (when available) or doing the edits themselves
  with the report in hand.
- Do not invent locators. If you cannot locate the claim in the
  cited source, the verdict is Unsupported and the locator is left
  empty with a note.

Output: a structured verification report. Length depends on the
size of the input text and the number of claims parsed.

This is an Analytic-spectrum mode: precise, low-creativity. Resist
the urge to elaborate or contextualize. The report is the artefact.
