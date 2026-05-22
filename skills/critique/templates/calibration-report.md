# Calibration report — {{Manuscript title}}

**Manuscript.** {{Full title}}
**Known-outcome source.** {{e.g., published reviews at NeurIPS 2024 | published eLife reviews | user's own prior manual review}}
**Calibration run date.** {{YYYY-MM-DD}}
**Calibration set size.** {{1 manuscript | n manuscripts}}

---

## 1. Inputs

### 1.1 Gold-standard manuscript

{{One paragraph describing the manuscript used for calibration. State its domain, its primary methodology, and any features that make it especially well or especially poorly suited to the skill's competence range.}}

### 1.2 Known-outcome reviews

{{One paragraph describing the source of the known-outcome reviews. Are they real reviews from a venue? An expert manual review? The user's own prior review? How many reviewers? What disposition did the known-outcome reviews recommend?}}

Number of issues raised in the known-outcome reviews: {{N}}

### 1.3 Skill output (blinded)

{{One paragraph confirming that the skill's critique was produced without access to the known-outcome reviews. The sub-agents did not see the known reviews. The disposition recommendation was reached from the manuscript alone.}}

Number of issues raised by the skill: {{M}}

Skill's recommended disposition: {{accept | accept with minor revisions | major revisions required | reject and resubmit | reject}}

Known-outcome disposition: {{the corresponding disposition}}

---

## 2. Issue-by-issue comparison

### 2.1 True positives (issues correctly identified)

{{Issues raised in the known-outcome reviews that the skill's critique also raised. The match is at comparable severity and substance; exact wording need not match.}}

| # | Known-outcome issue | Skill issue | Match quality | Severity match |
|---|---------------------|--------------|----------------|------------------|
| 1 | {{Issue summary.}} | {{Skill's version of the issue.}} | {{strong | adequate | weak}} | {{exact | one-step-off | larger gap}} |
| 2 | {{...}} | {{...}} | {{...}} | {{...}} |

Count: {{TP}} true positives.

### 2.2 False negatives (issues missed by the skill)

{{Issues raised in the known-outcome reviews that the skill's critique did not raise.}}

| # | Known-outcome issue missed | Severity | Likely reason for the miss |
|---|------------------------------|----------|------------------------------|
| 1 | {{Issue summary.}} | {{severity}} | {{e.g., requires specialist knowledge outside the skill's competence; requires re-running an analysis; the relevant passage in the manuscript was misread}} |
| 2 | {{...}} | {{...}} | {{...}} |

Count: {{FN}} false negatives.

### 2.3 False positives (issues raised only by the skill)

{{Issues the skill raised that did not appear in the known-outcome reviews. Two interpretations exist: either the skill raised an issue that real reviewers did not (a possible false positive), or the skill caught something the real reviewers missed (a possible genuine issue). The calibration report does not adjudicate between these; it lists the issues and lets the user judge.}}

| # | Skill issue not in known-outcome | Skill's severity | Interpretation hypothesis |
|---|----------------------------------|------------------|---------------------------|
| 1 | {{Issue summary.}} | {{severity}} | {{plausible false positive | plausible genuine issue real reviewers missed | uncertain}} |
| 2 | {{...}} | {{...}} | {{...}} |

Count: {{FP}} skill-only issues (some of which may be genuine catches rather than false positives).

---

## 3. Rates

### 3.1 False-negative rate (FNR)

FNR = FN / (TP + FN) = {{value}}

{{The fraction of known-outcome issues that the skill missed. Lower is better.}}

### 3.2 False-positive rate (FPR)

FPR = FP / (FP + skill issues that matched) = FP / (FP + TP) = {{value}}

{{The fraction of skill-raised issues that did not correspond to known-outcome issues. Note that this is an upper bound on the false-positive rate; some of the skill-only issues may be genuine catches that the known-outcome reviewers missed. The FPR is therefore best read alongside the interpretation column in section 2.3.}}

### 3.3 Confidence interval

{{Bounded by the number of manuscripts in the calibration set. For n=1, the confidence interval on these rates is very wide and the rates themselves should be read as suggestive rather than as estimates.}}

Approximate 95% CI on FNR: {{interval}} ({{n=1: wide; n=5–10: narrower; n=20+: usable}})

Approximate 95% CI on FPR: {{interval}}

The intervals here are rough. A statistically principled estimate requires repeated calibration across multiple manuscripts of comparable type. The skill recommends pooling at least five and ideally ten or more calibration runs before drawing strong conclusions.

---

## 4. Domain coverage

{{One short paragraph describing the domain(s) in which the calibration was performed. A calibration on a single manuscript in domain A does not generalize to manuscripts in domain B. State explicitly which domains this calibration speaks to.}}

Domains covered by this calibration:
- {{Domain 1}}
- {{Domain 2 (if applicable)}}

Domains NOT covered by this calibration (the skill's accuracy is unknown here):
- {{Domain X}}
- {{Domain Y}}

---

## 5. Confidence statement for downstream users

{{A recommended trust level based on the rates above, the calibration set size, and the domain coverage. One of:
 - "Use as primary rehearsal": low FNR, low FPR, n large enough that the rates are credible. The skill's critique can be treated as a substantial substitute for a careful self-review.
 - "Use as supplementary rehearsal": moderate FNR or moderate FPR, or n small. The skill's critique surfaces useful issues but should be supplemented with a careful human re-read or external review.
 - "Use with significant caution": high FNR or high FPR, or the calibration was performed in a domain very different from the manuscript at hand. Use the skill's critique as a starting point only.
 - "Do not rely without independent review": the skill's accuracy on this domain is too low to ground submission decisions. Independent review is required.

The recommendation cites the rates and the calibration set size and is documented for the user's downstream reference.}}

**Recommended trust level.** {{level}}

**Rationale.** {{Two to four sentences citing the FNR, the FPR, the calibration set size, and the domain coverage.}}

---

## 6. Caveats and limitations

- A calibration on a single manuscript produces wide confidence intervals on the rates. The skill names this explicitly. A research group seeking robust calibration should run the calibration mode on five to ten manuscripts and pool the results.
- The skill does not automatically pool across calibration runs. Each run produces a per-run report; pooling is performed by the user (or by re-running the calibration on a multi-manuscript dataset).
- The match-quality and severity-match assessments in section 2 are judgement calls. Two different calibrators might score them slightly differently. The report names the judgement and explains it where the call is borderline.
- The calibration is run against a particular known-outcome source. If the known-outcome reviews were themselves wrong (a real reviewer missed an issue), the calibration inherits that error. The skill notes this explicitly when the known-outcome reviews appear, on inspection, to be incomplete.

---

<!-- Notes for the calibration run:
     - Per SKILL.md section 5.6, calibration runs the full pipeline
       on the manuscript blinded to the known-outcome reviews. The
       sub-agents do not see the known reviews. The comparison in
       this report is performed only after the skill's output is
       finalized.
     - Rough matching is allowed: an issue counts as "surfaced" if
       the skill raises a comparable point at comparable severity.
       Exact wording is not required.
     - The recommended trust level is the user-facing summary of the
       calibration. It is the headline result; the user reads it
       first and then drills into the per-issue tables. -->
