# Example response letter

> **Notice.** Illustrative only. The manuscript, reviewers, comments,
> and editorial details below are fictional, produced as a worked
> example for the `compose` skill. Do not cite or treat as a real
> submission.

---

## Response to reviewers — Microcontroller-based gesture recognition using event-based vision

**Manuscript ID.** TECS-2026-0418
**Manuscript title.** A microcontroller-based gesture recognition
pipeline using event-based vision
**Corresponding author.** J. Author, jauthor@example.edu
**Date of response.** 2026-05-18

---

## Cover letter to the editor

Dear Dr. Editor,

Thank you for handling our manuscript TECS-2026-0418 and for the
constructive comments from both reviewers. We are pleased that
the reviewers found the contribution worth pursuing and have
worked through their suggestions carefully in this revision.

The revision strengthens the manuscript along three principal
lines. First, we have added a per-participant adaptation
experiment requested by Reviewer 1 (new Section 4.4 and Figure 5),
which demonstrates that lightweight on-device adaptation
recovers most of the held-out generalization gap. Second, we have
revised the Methods section throughout to improve reproducibility
detail and have released the time-surface accumulator code as
supplementary material. Third, we have clarified the contribution
claims in the Introduction and Discussion to address Reviewer 2's
concern about scope.

One comment from Reviewer 1 (R1.3, see below) we have respectfully
declined to address as written, with our reasoning given in the
per-reviewer response. One comment from Reviewer 2 (R2.3) has
been partially addressed; we describe what was done and what was
deferred.

The manuscript has not been submitted elsewhere. We are happy to
address any remaining concerns.

Sincerely,
J. Author, on behalf of the authors

---

## Response to Reviewer 1

We thank Reviewer 1 for the detailed and methodologically focused
comments. The reviewer's concerns about generalization,
reproducibility, and the contribution's framing have substantially
improved this revision. We address each of the four comments
below.

| # | Reviewer 1 comment | Response | Manuscript location | Status |
|---|--------------------|----------|---------------------|--------|
| 1.1 | The held-out test generalization gap is concerning and the paper does not discuss it adequately. Have the authors considered any form of on-device adaptation? | We agree that the per-participant gap (97.3% within-participant vs. 91.2% on held-out) deserves more attention. We have added Section 4.4 reporting a prototype-update adaptation experiment in which a brief on-device calibration (10 trials per gesture from the held-out user) is used to update the final-layer prototypes. With adaptation, held-out accuracy rises from 91.2% to 95.7%, closing approximately 70% of the gap. New Figure 5 reports the adaptation accuracy as a function of calibration sample count. The Discussion (Section 5, paragraph 3) now situates this against Liu & Delbruck (2020). | Sec. 4.4, p. 14, paras. 1–3; Fig. 5, p. 15; Sec. 5, p. 17, para. 3 | addressed |
| 1.2 | The Methods section omits the post-training quantization details necessary to reproduce the on-device classifier. | The Methods section now includes a new subsection (3.2.3) describing the quantization procedure: input scale calibration on 256 validation surfaces, per-channel weight quantization to int8 with the TFLite Micro converter, and activation range capture across the calibration set. Hyperparameters are listed in Table 2. We have additionally released the converter configuration and a representative calibration dataset as supplementary material. | Sec. 3.2.3, p. 8, paras. 1–2; Table 2, p. 9; Supp. Mat. S2 | addressed |
| 1.3 | The paper should report accuracy against the frame-based baseline on the same hardware to make the comparison fair. | We respectfully decline this comparison as written. The frame-based baseline reported by Park & Lee (2019) was implemented on an STM32F4 microcontroller with a 752x480 frame sensor; replicating their pipeline on our STM32H7 with a different sensor would require porting a system we do not have access to and would not produce a directly comparable measurement (the sensor difference dominates the result). Instead, we have added a literature-based comparison table (Table 3) reporting accuracy, energy, and target-device class for our pipeline alongside published frame-based and event-based pipelines on microcontroller-class hardware. The discussion (Section 5, paragraph 2) acknowledges that a fully matched comparison would require a separate study. | Table 3, p. 16; Sec. 5, p. 17, para. 2 | respectfully disagree |
| 1.4 | The exact gesture vocabulary should be motivated; eight gestures is small and the choice seems arbitrary. | We have added a brief motivation in Section 3.1 (paragraph 2). The eight-gesture vocabulary follows the DVS Gesture benchmark established by Amir et al. (2017), which has become the de facto standard for event-based gesture work; adopting it allows direct comparison against subsequent literature using the same vocabulary. We have also noted in the Limitations that finer-grained vocabularies remain to be evaluated. | Sec. 3.1, p. 6, para. 2; Sec. 6, p. 18 | addressed |

---

## Response to Reviewer 2

We thank Reviewer 2 for the constructive engagement with the
contribution's framing and scope. The revision sharpens the
contribution statements as requested and adds the missing
references the reviewer identified.

| # | Reviewer 2 comment | Response | Manuscript location | Status |
|---|--------------------|----------|---------------------|--------|
| 2.1 | The Introduction overclaims by suggesting the pipeline is suitable for "ambient sensing" without evidence of out-of-room generalization. | We have softened the Introduction (paragraph 3) to claim suitability for "wearable applications where the device's operating environment is known to the application." Ambient sensing is now mentioned as a future direction in the Discussion (Section 5, paragraph 4) and is no longer claimed as a demonstrated application. | Sec. 1, p. 3, para. 3; Sec. 5, p. 18, para. 4 | addressed |
| 2.2 | The related work section misses Sironi et al. (2018) on time-surface representations, which is directly relevant to the pipeline's design choice. | We have added Sironi et al. (2018) and integrated it into Section 2 (paragraph 2), where it appears as the precursor to the time-surface accumulator used in this work. The choice of exponential decay (vs. HATS-style averaging) is now motivated by reference to that work. | Sec. 2, p. 5, para. 2 | addressed |
| 2.3 | The discussion of energy efficiency should include a comparison against the per-frame inference energy of a representative frame-based pipeline on the same target microcontroller. | We have partially addressed this. We added a literature-based energy comparison table (Table 3) reporting the per-inference energy figures published by Zhou et al. (2022) and Warden & Situnayake (2019) for representative frame-based pipelines on microcontroller-class hardware. A direct measurement on identical hardware was not feasible within the revision window, as it would require porting an additional pipeline. We have noted this limitation explicitly in Section 6 (Limitations) and indicated it as future work. | Table 3, p. 16; Sec. 6, p. 18, para. 1 | partially addressed |

---

## Closing remarks

The revision has been improved by the reviewers' careful reading,
and we are grateful for the engagement. We acknowledge that one
substantive comparison (R1.3 and the related part of R2.3) would
benefit from an additional study with matched hardware; that
study is beyond the scope of this revision but is now framed as
future work. We welcome any further questions.
