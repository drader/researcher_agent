# Editorial Decision Framework

Operational guidance for the `editorial-decider` sub-agent. Defines
how reviewer reports translate into a recommended editorial
disposition and how the decision letter is composed.

This document is descriptive and prescriptive: it describes the
conventions editors use and prescribes how the skill applies those
conventions consistently.

---

## The disposition categories

The skill uses five categories. They sit on an ordered scale of
severity but are not interchangeable steps; each represents a
distinct editorial judgement.

### Accept

The manuscript is ready for publication as is. Any remaining
issues are at the level of copyediting or editor-stage cleanup. On
first submission, this is rare. On a later round of revision, it
is common when the prior round addressed all substantive issues.

**Criteria.** No issues at severity major or critical. Minor issues,
if any, are mechanical and do not require author response beyond
mechanical correction.

### Accept with minor revisions

The manuscript is substantively ready. Minor issues remain;
addressing them will be mechanical. The revised version may not be
re-reviewed.

**Criteria.** Minor issues only. No major issues. The required
revisions can be completed without new analysis, new data, new
literature engagement, or structural rewriting.

### Major revisions required

Substantive revision is needed before the manuscript can be
published. The core contribution is viable; the issues are
addressable within a single revision cycle; the revised version
will be re-reviewed.

**Criteria.** At least one major issue exists, or several
significant minor issues that together constitute a pattern. The
issues are fixable with effort the authors can be expected to
expend within a normal revision timeline (weeks to a few months).

### Reject and resubmit

The work is potentially publishable but the issues are too
substantial for a normal revision cycle. The required changes
include new data, new analyses, a re-framing of the contribution,
or a substantial methodological redesign. The authors are
encouraged to do the work and resubmit, possibly as a new
manuscript.

**Criteria.** At least one critical issue exists, but the core
contribution is viable. The work needed to address the critical
issue is substantial (months or more) but feasible.

### Reject

The manuscript cannot be salvaged at this venue. The reasons are
either substantive (the work is flawed in ways that cannot be
fixed without redefining it) or fit-related (the work is good but
wrong for this venue).

**Criteria.** Critical issues that go to the framing of the
contribution or the validity of the central evidence. Alternatively,
the work is methodologically sound but is not in the venue's scope
or has been clearly superseded by published work.

Reject is the heaviest disposition and the skill uses it sparingly.
Many manuscripts that look reject-worthy on first read benefit from
a "reject and resubmit" framing that leaves the door open.

---

## Severity to disposition mapping

The skill applies the following heuristics, then exercises
judgement on boundary cases.

| Severity present | Default disposition |
|------------------|---------------------|
| Only suggestions | accept |
| Minor issues only, no major | accept with minor revisions |
| One major issue plus minor | major revisions required |
| Multiple major issues across multiple sub-agents | major revisions required |
| One critical issue that is concentrated and replaceable | major revisions required |
| One critical issue that is structural | reject and resubmit |
| Multiple critical issues | reject and resubmit, or reject |
| Critical issue at the framing or evidence level | reject |

The default is a starting point. The editor (in this case, the
`editorial-decider` agent) may shift one step in either direction
based on context. For example:

- A critical issue that is genuinely fixable in a single round may
  warrant "major revisions required" rather than "reject and
  resubmit," provided the author is willing to commit to the
  required work.
- Several minor issues that together suggest a careless manuscript
  may warrant "major revisions required" rather than "accept with
  minor revisions," because the pattern signals problems beyond
  the individual issues.
- A clean manuscript with one significant issue concentrated in a
  single section may warrant "accept with minor revisions" if the
  section can be revised mechanically, rather than "major
  revisions required."

The judgement is documented in the rationale.

---

## Multi-reviewer aggregation

In `full` mode the skill produces five reviewer reports and an
editorial synthesis. The synthesis applies the following logic.

### Convergent reviewers

When the five reviewers recommend the same or adjacent dispositions
(e.g., all five recommend "major revisions" or "accept with minor
revisions"), the synthesis adopts the converged disposition and
notes the convergence.

### Divergent reviewers

When the reviewers disagree, the synthesis weighs the disagreement.

**Substantive disagreement.** Different reviewers raise different
issues. Reviewer 1 (rigour) sees a methodological flaw; Reviewer 3
(clarity) does not. This is normal: each reviewer is anchored to a
different perspective. The synthesis is the union of the issues,
disposition recommended by the severest issue raised.

**Direct disagreement.** Two reviewers reach opposite conclusions
on the same issue. Reviewer 1 says the analysis is correct;
Reviewer 4 says it is unsound. The synthesis names the
disagreement explicitly, presents both views to the author, and
recommends the disposition that aligns with the more carefully
argued view.

**The lone outlier.** Four reviewers converge; the fifth diverges.
The synthesis does not automatically discount the fifth. Two
possibilities exist:

1. The fifth caught something the four missed. The synthesis
   should consider whether the fifth's point is substantive even
   if the other four did not raise it. A single reviewer's
   substantive catch is sufficient to drive a disposition.
2. The fifth is in error. The synthesis should note that four
   reviewers reached a different view and that the fifth's
   argument is, on inspection, less well-supported.

The distinguishing question is: does the fifth reviewer cite a
specific passage and make a specific argument? If yes, the catch
is substantive; weigh it. If no, the divergence is more likely
error or perspective mismatch; note it but follow the four.

### When to seek additional review

In real editorial practice, an editor may seek a sixth reviewer
when the existing reviews are insufficiently decisive. The skill
does not have an external reviewer to seek; instead, when the
sub-agent outputs are genuinely inconclusive (rare), the skill
notes the inconclusiveness to the user and offers to run the
critique again with a different emphasis.

---

## Common editorial mistakes

Failures the skill should not commit.

### Rejecting on grounds the reviewers did not raise

The editor introduces an issue in the decision letter that the
reviewers did not flag. This is generally a sign that the editor
is using their own judgement rather than synthesizing the panel.
In the skill's case, the synthesis must be faithful to the
sub-agents' outputs. If the editorial-decider identifies an issue
the sub-agents missed, it should add it as a synthesis-level
note, not present it as a reviewer finding.

### Accepting despite a critical reviewer

A single reviewer raises a critical issue; the editor accepts on
the basis of the other reviewers' positive views. This is generally
unwise: critical issues are rarely safe to override. The skill's
default rule is that a critical issue drives the disposition,
regardless of the other reviewers' views.

### Indefinite major-revisions loops

The author revises; the editor sends back for further major
revisions; the author revises again; the editor sends back again.
This pattern is unkind to the author and signals that either the
manuscript should have been rejected or the editor is unable to
converge on a decision. The skill applies the same discipline
internally: two revision loops on the critique itself, then the
critique is finalized with remaining disagreements documented as
Unresolved Issues.

In the broader sibling-skill lifecycle, the `compose-revision`
mode is the place where revisions are applied; the `critique`
skill produces the roadmap once and does not iterate the critique
endlessly.

### Disposition mismatch

The decision letter recommends "accept with minor revisions" but
the rationale cites critical issues. This is incoherent and
confuses the author. The skill's quality constraint is that the
disposition must be coherent with the rationale (see
`agents/editorial-decider.md`, quality constraints).

---

## Writing the decision letter

The decision letter is a structured artefact, not a free-form
note. The template in `templates/editorial-decision-letter.md`
prescribes the structure.

### Tone

Professional, neutral, specific. The letter is read by an author
who has invested significant time in the manuscript; the tone
respects this without flattering or softening.

The skill's posture (SKILL.md section 14) applies: no flattery,
no harshness. Praise that the issues do not support is not
included. Severity that the issues do not warrant is not included.

### Sequencing

A well-formed decision letter sequences:

1. **Cover paragraph.** Statement of the disposition with brief
   rationale (one to three sentences).
2. **Required revisions.** Numbered list of items the author must
   address. These are the major and critical issues. Each item is
   specific, located, and actionable.
3. **Recommended revisions.** Numbered list of items the author
   should consider but may decline. These are the minor issues and
   the suggestions.
4. **Per-reviewer summary.** A short paragraph for each reviewer
   noting their primary contribution.
5. **Timeline.** Statement of next steps: when the revision is
   due, whether re-review is expected, what to include in the
   response letter.
6. **Closing.** Professional sign-off.

### Required versus recommended

The distinction matters. A required revision is one the manuscript
cannot publish without addressing. A recommended revision is one
the author may address in this round, in a later round, or not at
all. Conflating the two leaves the author guessing.

The skill's mapping:

- Critical and major issues → required revisions
- Minor issues that affect comprehension → required revisions
- Minor issues that are mechanical → recommended revisions
- Suggestions → recommended revisions

### What to leave to author judgement

Some matters are within the author's discretion: which alternative
analysis to run, how to restructure a section, which of two
equivalent terms to use. The decision letter names the issue and
the constraint (e.g., "the manuscript should explain why this
analysis is preferred") but does not prescribe a specific resolution
where multiple resolutions are valid.

### What to require explicitly

Where one resolution is clearly correct (e.g., reporting the
sample size in the methods section), the letter requires that
resolution. Where the issue is genuinely judgement-bound (e.g.,
how to frame a limitation), the letter requires that the issue be
addressed without prescribing how.

---

## When the recommendation is "accept"

A clean accept is uncommon but it happens. The skill does not
manufacture issues to fill out the report. When the manuscript is
ready, the report says so. The decision letter records the
disposition, notes any minor copyediting items, and closes.

The skill's refusal posture (SKILL.md section 10) applies in the
other direction too: the skill does not soften a recommendation to
flatter the user, and it does not strengthen a recommendation to
perform severity.

---

## When the recommendation is "reject"

A reject is also uncommon. When the issues are genuinely
unrecoverable, the skill recommends reject and explains why. The
explanation is specific: which issue, where in the manuscript,
why it cannot be addressed within the venue's scope.

A reject in a rehearsal critique is not a verdict on the work; it
is a rehearsal of what the author may hear at real review. The
author may choose to revise toward a different venue, redesign the
work substantially, or set it aside. These decisions are the
author's.

---

## Recording the rationale

Every recommended disposition is supported by a rationale that
cites specific issues from specific sub-agents. The format is:

> Sub-agent {{name}} raised an issue at section {{n}} regarding
> {{topic}}; this is the primary driver of the recommended
> disposition.

The rationale is reproducible: given the same sub-agent outputs,
the rationale identifies the same driving issues. This is the
quality constraint in `agents/editorial-decider.md` ("disposition
coherence" and "reproducibility").

---

## Handoff to the revision roadmap

When the disposition is anything above "accept," the skill
produces a revision roadmap alongside the decision letter. The
roadmap is structured for direct consumption by
`compose-revision-triage` and `compose-revision`. Each entry in
the roadmap names the issue, its severity, the sub-agent that
raised it, the location in the manuscript, and a proposed handling.

The decision letter and the revision roadmap together give the
author everything they need to begin the revision. The author
runs `compose-revision-triage` on the roadmap; the coach helps the
author plan the revision; the author runs `compose-revision` to
apply the plan; the cycle continues to the next submission.
