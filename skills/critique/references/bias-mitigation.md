# Bias Mitigation

Common reviewer biases and how the `critique` skill mitigates them.
The skill's five-reviewer simulation, sub-agent partitioning, and
checkpoint discipline are designed in part to reduce the influence
of these biases.

This document describes biases and mitigations. It does not claim
that the skill is bias-free. It claims that the skill's design takes
several known sources of reviewer error into account and applies
specific countermeasures.

---

## Why bias matters here

A simulated reviewer can be biased in the same ways a human
reviewer can. The simulation is built from the same kinds of
training data that produced the patterns of judgement humans
exhibit, including the patterns that humans now recognize as
biased. If the skill simply ran a single reviewer with no internal
checks, it would inherit and concentrate those biases.

The five-reviewer assembly, the sub-agent partitioning, and the
checkpoint discipline together produce a structured pluralism: each
perspective applies a different lens, the parts are weighed against
each other, and the user is shown the disagreements rather than a
single homogenized verdict. This structure does not eliminate bias
but it makes individual biases visible and reduces the chance that
any one bias dominates the output.

---

## Confirmation bias

**Definition.** The reviewer expects a particular result before
reading the manuscript and weights evidence in the manuscript
accordingly: evidence consistent with the expectation is accepted at
face value; evidence inconsistent is scrutinized harder.

**Manifestation.** A reviewer who believes a hypothesis is likely
true reads weak evidence supporting it as adequate; the same
reviewer reading evidence against the hypothesis demands stronger
evidence than the field's standard. Same evidential standard
applied asymmetrically.

**Mitigation in the skill.**

- The `devil-advocate` sub-agent is constructed to read the
  manuscript adversarially. It asks: what would a reviewer who
  expects this paper to be wrong look for? This is a deliberate
  counter-weight to confirmation bias.
- The `methodology-critic` sub-agent applies its evaluation
  symmetrically: the same standards for the headline claim and for
  the robustness checks.
- The five-reviewer assembly puts the `methodology-critic`'s
  output and the `devil-advocate`'s output into different reviewer
  voices, so a reader sees both the standard-analysis perspective
  and the adversarial perspective side by side.

The mitigation is incomplete. If the underlying model has strong
priors about a topic, those priors will leak into the sub-agents.
The skill's posture is to make this visible: when sub-agents
converge unanimously on a positive read, the reviewer-position-lock
check (SKILL.md section 10) flags the convergence.

---

## Familiarity bias

**Definition.** The reviewer treats work in their own sub-field
more leniently because they recognize the conventions, the
characters, and the standards. Work outside the sub-field — even
when the standards are equivalent — is treated as suspect because
it looks unfamiliar.

**Manifestation.** A reviewer in sub-field A reads a paper in
sub-field A and accepts the standard methodology without comment;
the same reviewer reading a paper in sub-field B asks for
justifications of methodological choices that are equally
standard in B.

**Mitigation in the skill.**

- The `critique` skill confirms the manuscript's discipline and
  sub-discipline at the scope-confirmation checkpoint. It then
  selects the appropriate rubric from `review-rubrics.md`.
- The simulated reviewers are not specialized to a sub-field; they
  represent five perspectives (rigour, literature, clarity,
  significance, general). Sub-field specialization is replaced by
  perspective specialization.
- When the skill is operating in a domain that is far from its
  competence (SKILL.md section 9), it declares this and limits the
  critique to the dimensions it can assess.

---

## Anchoring on first impression

**Definition.** The reviewer forms an initial judgement during the
first few paragraphs (or, in machine learning conferences, during
the first reading of the abstract and figures) and adjusts
insufficiently in light of subsequent evidence in the manuscript.

**Manifestation.** A reviewer who finds the abstract over-claimed
reads the rest of the paper looking for confirmation that it is
over-claimed; a reviewer who finds the abstract compelling reads
the rest looking for confirmation that it is compelling. The
adjustment from the anchor is partial.

**Mitigation in the skill.**

- The sub-agents are invoked in parallel rather than sequentially
  where possible. The `completeness-reviewer`, `methodology-critic`,
  `clarity-reviewer`, and `literature-critic` form their views
  without seeing each other's outputs. This prevents an early
  sub-agent's view from anchoring the others.
- The `editorial-decider` synthesizes the sub-agent outputs after
  all of them have been produced; it does not start its synthesis
  before they are complete.
- The five-reviewer reports are assembled from sub-agent outputs
  partitioned by perspective, not from a single read of the
  manuscript. This breaks the anchoring chain.

The mitigation is partial. Each sub-agent itself reads the
manuscript sequentially and could anchor on early impressions.
The five-reviewer-from-five-sub-agents design distributes the
anchoring across five different starting points rather than
eliminating it.

---

## Methodological narrowness

**Definition.** The reviewer treats one methodology as the only
legitimate one, and dismisses or undervalues work that uses
alternative methodologies even when those methodologies are
established in the field.

**Manifestation.** A reviewer trained in randomized experiments
dismisses observational work; a reviewer trained in formal proof
dismisses empirical evaluation; a reviewer trained in qualitative
analysis dismisses statistical work. The dismissal is framed as a
methodological deficiency in the manuscript rather than as a
preference of the reviewer.

**Mitigation in the skill.**

- The `methodology-critic` sub-agent evaluates the manuscript's
  methodology against the standards appropriate to that
  methodology. Observational work is evaluated as observational
  work, not as a deficient randomized trial.
- The rubric selection (see `review-rubrics.md`) is explicit about
  what standards apply.
- When a manuscript uses an unusual methodology, the skill notes
  this and asks the user whether the chosen rubric is appropriate.
- The `devil-advocate` sub-agent is allowed to raise methodological
  alternatives but does so as alternatives, not as a verdict that
  the chosen methodology is illegitimate.

---

## Author-identity bias

**Definition.** The reviewer adjusts the review based on the
authors' identities: their institutions, their seniority, their
gender, their geographic origin, their previous work. The
adjustment is sometimes lenient (a senior author from a top
institution gets the benefit of the doubt) and sometimes harsh
(an unknown author from a non-top institution is scrutinized
more carefully).

**Manifestation.** Two identical manuscripts receive different
reviews depending on who appears in the byline. Empirical studies
of double-blind versus single-blind review have shown effects of
this kind, with the size of the effect varying across fields.

**Mitigation in the skill.**

- The `critique` skill is run by the author on the author's own
  manuscript. It does not have an external author whose identity
  could bias the review. However, the author may invoke the skill
  on a colleague's manuscript or on a paper they are preparing for
  another person; in these cases the identity is known.
- The simulated reviewers do not adjust their tone or standards
  based on the author. Their tone is set by the perspective they
  occupy (rigour, literature, clarity, significance, general),
  not by who wrote the paper.
- Where the author has supplied venue information or context that
  would in real review be visible to a single-blind reviewer (a
  letter from a famous co-author, a track record), the skill does
  not adjust the critique. It applies the same rubric.

This bias is in some ways less concerning here than in real review:
the critique is a rehearsal for the author's own benefit, and
flattering the author is exactly what the skill's posture (SKILL.md
section 14) forbids.

---

## Style bias

**Definition.** The reviewer prefers manuscripts written in the
style familiar to the reviewer's own training: a particular
sentence rhythm, a particular structure, a particular level of
hedging. Manuscripts written in a different but equally valid
style are read as less rigorous, less clear, or less appropriate.

**Manifestation.** A non-native English speaker's manuscript is
read as less clear than a native speaker's manuscript even when
the content and structure are equivalent. A manuscript written in
a regional style (American English economics versus British English
economics) is read as off-key by reviewers from the other side.

**Mitigation in the skill.**

- The `clarity-reviewer` sub-agent distinguishes between issues
  that impede comprehension (where a passage's meaning is unclear
  or ambiguous) and issues of style preference (where a passage is
  clear but the style is not the reviewer's preferred style).
  Only the former are flagged as issues in the review; the latter
  are at most noted as suggestions.
- When a manuscript shows signs of being written by a non-native
  speaker of the language, the skill calibrates accordingly:
  surface-level grammatical issues are flagged as suggestions, not
  as evidence of unclear thinking.
- The skill never flags a manuscript as poorly written without
  citing specific passages where comprehension is affected.

---

## Recency bias

**Definition.** The reviewer prefers recent citations and treats
older citations as out of date even when the older citations remain
the appropriate authority. Conversely, in some fields, the reviewer
treats older citations as authoritative regardless of whether more
recent work has superseded them.

**Manifestation.** A reviewer in a fast-moving field demands the
most recent benchmark numbers even when the older numbers remain
relevant for fair comparison; a reviewer in a slow-moving field
treats a 1995 source as the canonical authority even when more
recent work has revised the consensus.

**Mitigation in the skill.**

- The `literature-critic` sub-agent evaluates citation engagement
  against the field's convention, not against a uniform standard.
  Field conventions vary; the rubric in `review-rubrics.md` reflects
  this.
- The skill does not penalize an older citation that remains the
  appropriate authority for a particular claim. It does flag when
  a manuscript appears to be cycling exclusively through citations
  from one decade and missing recent work that updates the
  consensus.
- The skill does not penalize a recent citation that has not yet
  accumulated citation count. New work is treated on its merits.

---

## Reviewer diversity as a structural mitigation

The five-reviewer assembly is the skill's principal structural
mitigation against the biases described above. Each reviewer
occupies a distinct perspective:

- Reviewer 1 (methodological rigour) checks the work against the
  standards of the methodology.
- Reviewer 2 (literature) checks the work against its engagement
  with prior scholarship.
- Reviewer 3 (clarity) checks the work against comprehension.
- Reviewer 4 (significance) checks the work against the
  contribution claim.
- Reviewer 5 (general) reads the work as a non-specialist would.

If any one reviewer's bias drives them toward a verdict the others
do not share, the disagreement is preserved in the report rather
than hidden. The `editorial-decider` agent's synthesis names where
the reviewers agree and disagree, so the author sees the
disagreement rather than only the synthesis.

The reviewer-position-lock check (SKILL.md section 10) explicitly
flags cases where all five reviewers converge: convergence is
either a signal of a genuinely clear-cut manuscript (rare) or a
signal that the diversity in the simulation failed. When it
failed, the skill asks the user whether to re-run with explicit
diversity constraints.

---

## What the skill cannot fix

The skill cannot eliminate biases in the underlying language model.
If the model has systematically wrong priors about a topic, the
sub-agents will inherit them. The skill's mitigations reduce the
influence of common reviewer biases but they do not produce a
neutral oracle.

The mitigation strategy is therefore:

1. Make the structure of the critique transparent: which sub-agent
   raised which issue, which reviewer voice it appears in.
2. Show disagreement when it exists rather than hide it.
3. Defer all final decisions to the user. The user is the one who
   knows the manuscript, the venue, the field, and themselves; the
   skill provides a rehearsal that the user reads, weighs, and acts
   on as they see fit.
4. Calibrate when possible: the `calibration` mode runs the skill
   against a known-outcome manuscript and reports false-negative
   and false-positive rates, so users know how much to trust the
   skill in their domain.

Bias mitigation is a posture, not an achievement. The skill applies
it consistently across all modes and refuses to claim more
neutrality than its design supports.
