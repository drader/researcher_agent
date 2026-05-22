# Methodology critique — {{Manuscript title}}

**Manuscript.** {{Full title}}
**Domain.** {{e.g., empirical social science | clinical trial | systems / engineering | mixed-methods | theoretical | machine learning evaluation}}
**Methodology under review.** {{Brief, one-line description of the study's methodology, e.g., "between-subjects randomized experiment with a behavioral outcome"}}
**Date.** {{YYYY-MM-DD}}

---

## 1. Study design assessment

{{Two to four paragraphs. Address:
 - Is the design appropriate for the research question? Could a different design have answered the question better, and if so what would be the trade-offs?
 - Is the design described in enough detail that a competent reader could understand what was done?
 - Where the design includes pre-specified protocols, registration, or guideline adherence (CONSORT, STROBE, PRISMA, CARE, ARRIVE, etc.), does the manuscript meet those standards?
 - What aspects of the design are well chosen, and which are weakest?}}

---

## 2. Statistical analysis review

{{Two to four paragraphs. Address:
 - Were the analytical methods appropriate to the data type and the research question?
 - Were assumptions of the chosen methods checked and reported?
 - Were the analyses pre-specified or exploratory? If exploratory analyses are reported, are they declared as such?
 - Is multiple comparison handled appropriately?
 - Is the reporting of results complete (effect sizes, uncertainty intervals, not only p-values)?
 - For Bayesian analyses: are the priors justified? for ML evaluations: are confidence intervals or significance reported on the benchmark comparisons?

If the manuscript's methodology is non-statistical (theoretical, qualitative, formal proof), substitute the corresponding analytical review: validity of formal arguments, coding-frame justification, reliability assessments, proof verification, etc.}}

---

## 3. Validity threats

### 3.1 Internal validity

{{Threats to the causal or inferential claim within the study itself. Confounders not addressed; selection effects in the sample; measurement error that systematically biases the result; experimenter effects; demand characteristics; differential attrition. Name the threat, locate the manuscript passage where it should have been addressed, and state whether the manuscript addresses it adequately, inadequately, or not at all.}}

- {{Threat, located, assessed.}}
- {{Threat, located, assessed.}}

### 3.2 External validity

{{Threats to the claim's generalization beyond the study. Sample drawn from a non-representative population. Setting that does not resemble the target setting. Time period that may not apply now. Treatment conditions that are unlikely outside the lab. Name the threats, locate where the manuscript over-claims if it does.}}

- {{Threat, located, assessed.}}
- {{Threat, located, assessed.}}

### 3.3 Construct validity

{{Whether the measures and operationalizations capture the intended constructs. Outcome measures that proxy poorly for the conceptual outcome. Treatments that do not implement the conceptual manipulation. Single-item measures of multidimensional constructs.}}

- {{Threat, located, assessed.}}
- {{Threat, located, assessed.}}

### 3.4 Statistical validity (or analytical validity for non-statistical work)

{{Threats from the analysis itself. Underpowered tests of subgroup effects. Tests that violate assumptions in ways that matter for the conclusion. Multiple comparisons not corrected. P-hacking patterns visible in the analysis flow.}}

- {{Threat, located, assessed.}}
- {{Threat, located, assessed.}}

---

## 4. Comparison and baseline critique

{{Two to four paragraphs. For empirical work with a control or comparison: is the comparison appropriate? For systems and ML work: are the baselines well chosen, well implemented, and fairly tuned? For theoretical work: is the new contribution positioned correctly against the prior result it strengthens or generalizes?

Specific items to address:
 - Are alternative explanations of the result that the comparison should rule out actually ruled out?
 - Are the baselines the strongest available, or has the manuscript selected weaker baselines that make the contribution look larger?
 - Were the baselines given the same tuning effort, data, and evaluation conditions as the proposed approach?
 - Is the absence of an obvious comparison or ablation a problem?}}

---

## 5. Replicability assessment

{{Two to four paragraphs. Could a competent reader reproduce the headline result from what the manuscript describes?

Specific items:
 - Is the data available, and if not, is the unavailability justified?
 - Is the analysis code available?
 - Are the procedures described in enough detail to enable a re-implementation?
 - Are the random seeds, hyperparameters, software versions, and hardware specifications reported where relevant?
 - For interview-based or ethnographic work: is the protocol described and the analytical procedure documented?

If replication is impossible from the description, state this and locate the gaps.}}

---

## 6. Severity-ranked issue list

{{All the issues raised above, gathered into a single ranked list. Order: critical → major → minor → suggestion. Each entry includes a short label, a one-line description, a location in the manuscript, and the severity tag.}}

### Critical
1. **{{Label.}}** {{Description.}} ({{location}})

### Major
1. **{{Label.}}** {{Description.}} ({{location}})
2. **{{Label.}}** {{Description.}} ({{location}})
3. **{{Label.}}** {{Description.}} ({{location}})

### Minor
1. **{{Label.}}** {{Description.}} ({{location}})
2. **{{Label.}}** {{Description.}} ({{location}})

### Suggestions
1. **{{Label.}}** {{Description.}} ({{location}})

---

## 7. Recommended disposition

{{One to three sentences. Based on the severity-ranked list above, what is the recommended disposition? This is a methodology-critique-only recommendation; the user may combine it with other dimensions (clarity, literature, significance) in deciding whether the manuscript is submission-ready.}}

**Methodology-only disposition.** {{methodology is adequate | methodology requires minor revision | methodology requires major revision | methodology is insufficient for the claims made}}

---

<!-- Notes for the methodology-critic and the user:
     - This template is the deliverable of `critique-methodology` mode.
       It is also a sub-component of the full `critique-full` output
       (where it feeds Reviewer 1 and the editorial synthesis).
     - The validity-threats section (4 subsections) is the spine of
       the critique. Each subsection should have at least one item
       even when the threat is well-controlled, in which case the
       item names the control and notes its adequacy.
     - The severity-ranked list in section 6 is the input to the
       revision roadmap when this template is used standalone.
     - The methodology-critic does not re-run analyses (see SKILL.md
       section 13). When an analytical error is suspected that
       requires re-computation, the issue is flagged and the user is
       referred to a statistician or to re-running the analysis. -->
