---
description: Venue-specific AI-assistance disclosure statement via the compose skill in disclosure mode.
model: sonnet
---

Invoke the `compose` skill in **disclosure mode**.

Generate an AI-assistance disclosure statement for a manuscript
submission, tailored to the target venue's policy.

This mode supports transparent disclosure. It does NOT help conceal
AI involvement. If the user's intent is concealment, decline and
explain that disclosure is the framework's design.

Workflow:

1. Gather inputs:
   - Target venue (journal, conference, preprint server, internal
     report)
   - The user's actual use pattern: what tasks did AI assist with?
     - Planning / question formulation
     - Literature search assistance
     - Drafting (which sections)
     - Revision / editing
     - Citation formatting / check
     - Translation (if any)
     - Code or data analysis (if any)
     - Other
   - Tool name and version (if the user wants this disclosed)
   - Any venue-specific instructions the user has already received

2. Identify the venue's disclosure policy category:
   - **High-disclosure venues** (some Nature, Springer, Elsevier
     journals): require detailed statement; sometimes a specific
     section heading; cannot list AI as author
   - **Moderate-disclosure venues** (most journals): require some
     mention; often in Acknowledgments or a dedicated AI-use line
   - **Preprint servers** (arXiv, bioRxiv, medRxiv): policies vary;
     generally encourage but do not always require
   - **Conferences** (NeurIPS, ICML, ACL, etc.): have their own
     statements; some require disclosure during submission
   - **Internal / non-public**: disclosure may be informal but
     should still be recorded

   If unsure, ask the user to share the venue's current policy text.

3. Draft the statement using `disclosure-stmt.md` template variants:
   - Match the policy category's expected register and length
   - Use clear, direct language: name the tool, name the tasks,
     describe the human oversight applied
   - Do not understate AI involvement; if AI drafted Section 2,
     say so
   - Do not overstate either; if AI only formatted citations, that
     is what to say
   - Refuse to claim AI as author; this is universally disallowed

4. Provide 2–3 statement variants of differing length so the user
   can match a word-count constraint:
   - Long form (50–150 words): for venues with detailed disclosure
     requirements
   - Short form (15–40 words): for in-line acknowledgments
   - One-liner: for narrow disclosure fields in submission forms

5. Present the statements. Remind the user to verify against the
   venue's current policy (policies change).

Length: as above.

Refusals:
- Do not draft a statement that misrepresents AI involvement
- Do not advise the user to omit material AI use
- Do not suggest the user list AI as an author or co-author

This mode is consistent with the framework's stated philosophy:
disclosure, not deception. See POSITIONING.md.
