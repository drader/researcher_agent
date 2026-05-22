# Review Rubrics

Domain-specific evaluation rubrics for the `critique` skill. Each
rubric lists the dimensions reviewers in that domain commonly weigh,
how scoring tends to work, and what the typical weighting looks like.

The skill applies the rubric appropriate to the manuscript's domain.
For interdisciplinary work, multiple rubrics may be combined; this is
declared explicitly in the resulting reviewer reports.

---

## Biomedical and clinical

### Dimensions

- **Study design appropriateness.** Was the design the right tool
  for the question? A retrospective chart review cannot answer a
  causal question that a trial could; an observational study cannot
  establish causation that an RCT could.
- **Reporting completeness.** Does the manuscript meet the relevant
  guideline? CONSORT for trials, STROBE for observational, PRISMA
  for systematic reviews, CARE for case reports, ARRIVE for animal
  studies. Reviewers often check against the guideline checklist.
- **Sample size and power.** Is the sample adequate for the claims
  made? Were sample size calculations performed and reported? For
  subgroup analyses, is power addressed?
- **Statistical analysis.** Were the analyses pre-specified? Were
  the methods appropriate to the data type? Were assumptions
  checked? Were multiple comparisons handled?
- **Ethics and registration.** Was the study approved by an ethics
  committee? Were trials registered prospectively? Were participants
  consented?
- **Outcome reporting.** Are all pre-specified outcomes reported,
  or has the manuscript engaged in outcome switching? Are negative
  results given equal treatment with positive ones?
- **Clinical relevance.** Does the finding translate into a change
  in practice, or is it incremental within a research line?
- **Conflicts of interest.** Are funding sources and competing
  interests disclosed?

### Scoring

Often a structured form with numerical scores per dimension plus
free-text comments. Some journals use a single global score; others
weight statistical review separately.

### Typical weights

Study design and statistical analysis dominate. A flaw in either is
often disposition-changing. Reporting completeness is gate-like:
many journals will not advance a paper that fails to meet the
reporting guideline.

---

## Empirical social science

### Dimensions

- **Research question and contribution.** Is the question well-
  posed? Does the manuscript locate the contribution within the
  existing literature?
- **Identification strategy.** For causal claims, what is the source
  of identifying variation? Are the assumptions credible? Are
  alternative explanations addressed?
- **Measurement validity.** Do the measures capture the concepts
  they claim to measure? Are the instruments validated?
- **Sample and external validity.** Who is in the sample? To whom
  does the finding generalize? Has the manuscript over-claimed
  external validity?
- **Pre-registration.** Was the study pre-registered? If yes, do the
  reported analyses match the pre-registration? If divergences
  exist, are they declared?
- **Data and code availability.** Are the data accessible (subject
  to ethical constraints)? Is the analysis code shared? Could a
  reader reproduce the headline result?
- **Replication considerations.** Is the result robust to plausible
  alternative specifications? Have the authors run robustness
  checks? Is the finding consistent with the broader literature, or
  does it challenge prior findings?
- **Theory and mechanism.** Does the manuscript provide a mechanism
  for the finding, or only report the effect?

### Scoring

Free-text with embedded recommendations; some venues add a small
set of structured ratings (e.g., NeurIPS-style scores on novelty
and clarity, adapted for social science).

### Typical weights

Identification strategy and measurement validity dominate. Theory
contribution is heavily weighted in some sub-disciplines (theoretical
economics, sociology), less so in others (applied microeconomics,
political behaviour). Open-science practices are increasingly
gate-like in many venues.

---

## Engineering and systems papers

### Dimensions

- **Problem definition.** Is the problem clearly stated and
  motivated? Is the scope appropriate?
- **Design rationale.** Why this design? Are alternative designs
  acknowledged and the choice justified? Is the design space
  characterized adequately?
- **Evaluation rigour.** How is the system evaluated? Are the
  metrics meaningful? Are the evaluation conditions realistic? Is
  the evaluation sufficient to support the claims?
- **Baselines.** Are appropriate baselines used? Are they implemented
  fairly (same data, same tuning effort, same evaluation
  conditions)? Is the comparison free of cherry-picking?
- **Ablation.** Are the components that contribute to the
  improvement separated? Can a reader tell which design choice
  matters and which is incidental?
- **Comparison fairness.** Are the prior-work numbers reported
  honestly? Are differences in setup acknowledged? When the
  manuscript out-performs prior work, is the comparison apples-to-
  apples?
- **Replicability.** Is the code available? Are the experimental
  conditions documented thoroughly enough that a competent reader
  could rebuild the system?
- **Cost and engineering tradeoffs.** Are the cost dimensions
  (compute, latency, memory, energy, dollars) reported? Are the
  tradeoffs the system makes clearly stated?

### Scoring

Conference-style: scored rubrics on novelty, soundness, significance,
clarity, plus confidence. Journals tend to use free-text with a
recommended decision.

### Typical weights

Evaluation rigour and comparison fairness dominate at top systems
venues. A clever idea with weak evaluation is typically rejected;
a less novel idea with thorough evaluation is often accepted. In
machine learning specifically, ablation studies are weighted heavily
in recent years.

---

## Humanities

### Dimensions

- **Argument structure.** Is there a clearly stated central
  argument? Is the argument supported by the evidence the
  manuscript brings? Are counter-arguments engaged?
- **Scholarly engagement.** Does the manuscript engage with the
  relevant scholarship? Are key debates in the field named and
  positioned? Are the manuscript's interlocutors selected
  honestly?
- **Original contribution.** Does the manuscript advance the
  conversation, and if so how? An original reading of a familiar
  text, a recovered archival source, a synthesis that names a
  pattern others have not, a critical position not previously
  articulated?
- **Source competence.** Are the primary sources read accurately?
  Are the secondary sources understood in context? For work in
  translation, is the translation choice justified?
- **Methodological self-awareness.** Where the manuscript uses
  archival, ethnographic, computational, or other methods, are
  they applied competently and reflectively?
- **Prose and structure.** Is the writing clear, even when the
  ideas are complex? Is the structure of the manuscript suited to
  its argument?

### Scoring

Free-text reports, often longer than in the sciences. Numerical
scoring is uncommon in many humanities venues. The reviewer's
recommendation carries weight in proportion to their standing in
the sub-discipline.

### Typical weights

Argument structure and scholarly engagement dominate. Original
contribution is gate-like: a manuscript that does not advance the
conversation is typically rejected even if competently executed.

---

## Pure mathematics

### Dimensions

- **Statement clarity.** Are the theorems stated precisely?
  Are the definitions, conventions, and notation introduced and
  used consistently? Does the manuscript state what it proves?
- **Proof correctness.** Are the proofs valid? Are the steps that
  appear obvious actually obvious? Are the citations to standard
  results appropriate?
- **Novelty against the literature.** Is the result new? If it
  strengthens or generalizes a known result, is the relationship
  to the prior result stated honestly? Are the techniques new, or
  is the result a routine consequence of established methods?
- **Significance.** Is the result of interest beyond a narrow
  technical concern? This is a soft criterion and reasonable
  reviewers disagree.
- **Exposition.** Are the proofs presented in a form that a
  competent reader in the area can follow? Are the motivations
  for the techniques explained?

### Scoring

Free-text. The reviewer's recommendation often depends on whether
they have been able to verify the proofs in detail or only spot-
check them; this is sometimes stated explicitly.

### Typical weights

Proof correctness is gate-like. Novelty determines the venue:
a correct but routine result is publishable somewhere; a correct
and surprising result is publishable in a higher-impact venue.

---

## Cross-domain dimensions

The following are common to most domains and most reviewer rubrics.

### Writing quality

- Is the prose clear and free of grammatical and lexical errors?
- Are technical terms defined on first use?
- Is the structure of each section coherent?
- Is the abstract a faithful summary of the work?

A manuscript that is unreadable will not be reviewed thoroughly.
Some reviewers refuse to review a manuscript with pervasive writing
problems and return it to the editor for revision before review.

### Structural coherence

- Does each section do what the section heading promises?
- Are the methods used in the results section actually described in
  the methods section?
- Do the conclusions follow from the results?
- Is the discussion in dialogue with the introduction?
- Are figures and tables called out in the text and labeled
  adequately?

### Citation accuracy

- Are the cited works actually relevant to the points they support?
- Are key antecedents cited?
- Are the citations of prior work characterized accurately?
- Is the citation list free of obvious errors (wrong year, wrong
  authors, wrong venue)?

The `critique` skill identifies citation engagement issues but does
not verify each citation's claim against the source; that is the
`research` skill's `research-verify` mode.

### Ethics and integrity

- Are conflicts of interest disclosed?
- Are funding sources reported?
- For studies involving human subjects, is ethics approval reported?
- Is there evidence of self-plagiarism, salami publication, or
  other integrity concerns?

The `critique` skill flags potential integrity concerns when they
are visible in the manuscript itself; it does not investigate them
or accuse the authors. Integrity concerns are referred to the
editor and the appropriate institutional channels in real review.

---

## Applying the rubric

When the `critique` skill invokes a reviewer perspective:

1. Identify the manuscript's primary domain.
2. Select the rubric for that domain as the primary rubric.
3. If the manuscript is interdisciplinary, select a secondary
   rubric and indicate that two rubrics are being applied.
4. Apply the cross-domain dimensions in all cases.
5. Where the manuscript does not meet a rubric dimension, name
   the dimension explicitly in the reviewer report.
6. Where the manuscript exceeds the rubric (does more than the
   dimension requires), name this too. Strengths matter.

A reviewer who scores a manuscript against the wrong rubric is not
useful to the author. The `critique` skill confirms the domain at
the scope-confirmation checkpoint and applies the corresponding
rubric thereafter.

---

## Weighting

Across rubrics, two general principles hold.

**Severity dominates count.** A single critical issue in a single
dimension can drive a rejection. Twenty minor issues across many
dimensions can sit comfortably with an "accept with minor revisions"
disposition. The `editorial-decider` agent follows this rule (see
`agents/editorial-decider.md`).

**Reproducibility is increasingly gate-like.** Across most
empirical fields, the question "could a competent reader reproduce
the headline result?" is becoming a primary criterion. A
manuscript that fails this test is typically asked to revise
toward reproducibility before any other dimension is considered.

The `critique` skill applies these principles when synthesizing
the editorial recommendation.
