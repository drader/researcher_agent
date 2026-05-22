# Revision roadmap — {{Manuscript title}}

**Manuscript ID.** {{Journal ID}}
**Target venue.** {{Venue}}
**Date prepared.** {{YYYY-MM-DD}}
**Revision deadline.** {{YYYY-MM-DD or "not specified"}}

---

## 1. Per-reviewer summary

### Reviewer 1

{{One paragraph characterizing the reviewer's overall position. Are they broadly positive? Critical? Focused on a specific aspect (methods, analysis, framing)? Note any recurring theme across their comments.}}

**Overall stance.** {{accept with minor revisions | major revisions | reject and resubmit | reject}}
**Tone.** {{constructive | mixed | adversarial}}

### Reviewer 2

{{One paragraph.}}

**Overall stance.** {{...}}
**Tone.** {{...}}

### Reviewer {{N}}

{{...}}

---

## 2. Parsed comments

<!-- Each reviewer comment is decomposed into atomic items. One
     request per item, even if a single sentence contained several
     requests. The user signs off on this parsing before
     classification proceeds. -->

| ID | Source | Comment (paraphrase) | Type |
|----|--------|----------------------|------|
| R1.1 | Rev 1 | {{Paraphrase of the request}} | {{methods | results | analysis | framing | writing | references | scope | other}} |
| R1.2 | Rev 1 | {{...}} | {{...}} |
| R1.3 | Rev 1 | {{...}} | {{...}} |
| R2.1 | Rev 2 | {{...}} | {{...}} |
| R2.2 | Rev 2 | {{...}} | {{...}} |

---

## 3. Classification

| ID | Severity | Rationale | Effort |
|----|----------|-----------|--------|
| R1.1 | {{major | minor | optional | unclear}} | {{One short sentence explaining the classification}} | {{small | medium | large}} |
| R1.2 | {{...}} | {{...}} | {{...}} |
| R1.3 | {{...}} | {{...}} | {{...}} |
| R2.1 | {{...}} | {{...}} | {{...}} |
| R2.2 | {{...}} | {{...}} | {{...}} |

**Severity definitions.**

- **major** — addressing this is required for acceptance; not addressing it risks rejection.
- **minor** — the reviewer expects this addressed but the manuscript can succeed without it if the response justifies the choice.
- **optional** — the reviewer offered a suggestion; the user may accept, decline, or partially accept.
- **unclear** — the request as written is ambiguous; clarification needed from the reviewer or a best-effort interpretation flagged.

**Effort definitions.**

- **small** — under an hour of focused work.
- **medium** — one to several hours; may require re-running an analysis or revisiting the literature.
- **large** — a day or more; may require new data, new experiments, or substantial rewriting.

---

## 4. Dependency graph

<!-- Many revisions interact. If addressing one comment changes a
     section, the changes may ripple into other sections cited by
     other comments. Note the dependencies here. Use the notation
     "A -> B" to mean "addressing A changes the surface against
     which B must be addressed." -->

- {{R1.1 -> R2.2 (adding the requested ablation will change the Results section; the Discussion paragraph that R2.2 wants rewritten will need to incorporate the new ablation finding)}}
- {{R1.3 -> R1.4 (revising the methods description changes what the reproducibility section must say)}}
- {{R2.1 -> R1.2 (clarifying the contribution claim shifts how the related-work comparison must be framed)}}

---

## 5. Sequencing plan

<!-- Suggested order. Address items whose dependencies are upstream
     first, so that downstream items are addressed against a stable
     surface. Group items that touch the same section. -->

| Sequence | Item ID | Notes |
|----------|---------|-------|
| 1 | R1.3 | {{Methods clarification, no dependencies; do first.}} |
| 2 | R1.1 | {{Adds new analysis; affects R2.2.}} |
| 3 | R1.4 | {{Depends on R1.3.}} |
| 4 | R2.1 | {{Contribution-claim revision; affects R1.2.}} |
| 5 | R1.2 | {{Depends on R2.1.}} |
| 6 | R2.2 | {{Depends on R1.1.}} |
| 7 | R2.3 | {{Standalone minor item; handle near the end.}} |
| 8 | R1.5 | {{Optional; address only if time permits.}} |

---

## 6. Items requiring user decision

<!-- Some comments cannot be acted on without the user making a
     substantive choice. List those here. The roadmap does not
     decide; it surfaces the choices. -->

- **{{R1.X}}.** {{Description of the decision the user must make. Possible options: (a) ..., (b) ..., (c) ....}}
- **{{R2.X}}.** {{Description.}}

---

## 7. Items the user may decline

<!-- Comments classified as optional, or where respectful
     disagreement is a viable response. The user signs off on
     whether to decline. -->

- **{{R1.X}}.** {{Why declining is defensible. Sample response text for the response letter.}}
- **{{R2.X}}.** {{...}}

---

## 8. Total estimated effort

| Severity | Count | Approx. effort |
|----------|-------|----------------|
| major | {{N}} | {{hours/days}} |
| minor | {{N}} | {{hours}} |
| optional | {{N}} | {{hours}} |
| unclear | {{N}} | {{depends on clarification}} |

**Estimated total time.** {{e.g., 3–5 working days}}

---

## 9. Notes

- {{Any items requiring clarification from the reviewers via the editor.}}
- {{Any items requiring new data, new collaborators, or new resources.}}
- {{Any items where the user already has a preferred response.}}
