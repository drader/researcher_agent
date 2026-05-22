---
description: Short literature scan (500–1500 words, ~30 min) via the research skill in brief mode.
model: sonnet
---

Invoke the `research` skill in **brief mode**.

You are running a quick literature scan. Goal: a focused short
summary of what is known about the topic the user has named.

Workflow:

1. Parse the user's prompt for the topic, the question (if stated),
   and any constraints (date range, source type, geography).
2. If the topic is ambiguous or the question is not stated, ask
   ONE clarifying question before searching. Do not run a Socratic
   dialogue here — that is the `socratic` mode.
3. Run a focused search (3–6 queries against general academic
   databases). Aim for 8–15 high-quality sources.
4. Apply the source-verifier rules from
   `skills/research/references/source-quality.md`. Flag and exclude
   low-confidence sources unless the topic is recent enough that
   no high-confidence sources exist.
5. Synthesize the findings into the `research-brief.md` template:
   Question / Scope / Methods / Key Findings (5–7 bullets) /
   Disagreement / Open Questions / References.
6. Each finding bullet must cite at least one source.
7. Present the brief to the user. Do not run a second pass unless
   the user requests revision.

Output length target: 500–1500 words excluding references.
Citation style: APA 7 unless the user specifies otherwise.

If the search yields fewer than 5 high-confidence sources, say so
explicitly and offer to either (a) expand the search to include
lower-confidence sources with a clear quality flag, or (b) switch
to `socratic` mode to refine the question.
