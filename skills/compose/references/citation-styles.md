# Citation styles

This reference describes the citation styles the `compose` skill
supports: APA 7 (default), MLA 9, Vancouver, IEEE, and Chicago
author-date. For each style, the rules below cover in-text citation
patterns, reference list entry formats for common source types,
date formatting, author-list rules, DOI/URL handling, and common
special cases.

Each style is the property of its publisher; the rules summarized
here are descriptions, written from the skill author's understanding
of public reference standards. Users should consult the current
official manual when a venue requires strict compliance.

## 1. APA 7 — American Psychological Association, 7th edition (default)

Used widely in psychology, education, social sciences, and many
biomedical journals.

### In-text citation

- Parenthetical: `(Smith, 2020)` for one author, `(Smith & Jones,
  2020)` for two authors, `(Smith et al., 2020)` for three or more
  authors (this is a change from APA 6, which listed up to five
  authors on first citation).
- Narrative: `Smith (2020) argues that…`, `Smith and Jones (2020)
  argue that…`, `Smith et al. (2020) argue that…`
- Page numbers for quotations: `(Smith, 2020, p. 17)` or `(Smith,
  2020, pp. 17–18)`. For sources without page numbers, use
  paragraph numbers (`para. 4`) or section headings.
- Multiple works in one citation: alphabetical by first author,
  separated by semicolons: `(Brown, 2018; Smith, 2020)`.
- Same author, multiple years: `(Smith, 2018, 2020)`.
- Same author, same year: add lowercase letter suffix:
  `(Smith, 2020a, 2020b)`.

### Reference list entries

Format conventions:

- Authors listed by surname + initials, comma between author
  surname and initials, ampersand before final author.
- Up to 20 authors listed; 21+ uses ellipsis and final author.
- Year in parentheses after authors: `(2020).`
- Title in sentence case (only first word, proper nouns, and first
  word after a colon are capitalized).
- Journal title in title case, italicized.
- DOI as a URL: `https://doi.org/10.xxxx/yyyy`. No "doi:" prefix.

Examples by source type:

**Journal article.**
```
Smith, J. R. (2020). A study of stochastic spiking neural networks
for low-power inference. Journal of Neural Engineering, 17(3),
123–145. https://doi.org/10.1088/1741-2552/abcdef
```

**Book chapter.**
```
Brown, A. (2019). Event-based vision sensors. In C. Davis (Ed.),
Neuromorphic computing handbook (pp. 45–78). Springer.
```

**Conference paper.**
```
Lee, S., & Park, J. (2021). Gesture recognition with event
cameras. In Proceedings of the IEEE Conference on Computer Vision
and Pattern Recognition (pp. 1234–1245).
https://doi.org/10.1109/CVPR.2021.00123
```

**Dataset.**
```
Garcia, M. (2022). Event-based hand gesture dataset (Version 1.0)
[Data set]. Zenodo. https://doi.org/10.5281/zenodo.123456
```

**Preprint.**
```
Wong, K., & Chen, L. (2023). Self-supervised learning for
event-based vision (arXiv:2301.12345). arXiv.
https://doi.org/10.48550/arXiv.2301.12345
```

**Software.**
```
Müller, R. (2022). spynnaker (Version 6.0.0) [Computer software].
GitHub. https://github.com/SpiNNakerManchester/sPyNNaker
```

### Special cases

- Corporate authors: spell out, then in subsequent in-text citations
  abbreviate if widely known. Example: `(World Health Organization
  [WHO], 2020)` first, then `(WHO, 2020)`.
- No date: use `n.d.` in place of the year.
- In press: use `in press` in place of the year.
- Translated works: original year and translation year both given
  in the in-text citation as `(Original/Translation)`.

### Author-list rules

- 1 author: cite as `Smith (2020)` or `(Smith, 2020)`.
- 2 authors: cite both names every time.
- 3+ authors: `Smith et al.` from the first citation.
- 21+ authors in the reference list: list first 19, ellipsis, then
  final author.

---

## 2. MLA 9 — Modern Language Association, 9th edition

Used widely in humanities, especially literature, languages, and
related fields.

### In-text citation

- Parenthetical with author + page: `(Smith 17)` or `(Smith and
  Jones 17)` or `(Smith et al. 17)`.
- Narrative with page in parentheses: `Smith argues that … (17).`
- For sources without page numbers, use paragraph, section, or
  chapter as available, with a label: `(Smith, par. 3)`.
- Multiple works: separated by semicolons: `(Smith 17; Jones 42)`.
- Year is not included in the in-text citation (this is a key
  MLA-vs-APA difference).

### Works Cited list entries

MLA 9 uses the "core elements" approach: author, title of source,
title of container, other contributors, version, number, publisher,
publication date, location.

Format conventions:

- Authors: Last, First (full first name, not initial). Two authors:
  Last1, First1, and First2 Last2. Three+: first author and "et
  al."
- Titles in title case, italicized for full works, quoted for
  shorter works.
- Date: Day Month Year, with month abbreviated (e.g., 15 Mar. 2020).
- DOI: `https://doi.org/10.xxxx/yyyy` or just the doi (e.g.,
  `doi:10.xxxx/yyyy`).

Examples by source type:

**Journal article.**
```
Smith, John R. "A Study of Stochastic Spiking Neural Networks for
Low-Power Inference." Journal of Neural Engineering, vol. 17, no. 3,
2020, pp. 123–145. https://doi.org/10.1088/1741-2552/abcdef.
```

**Book chapter.**
```
Brown, Anne. "Event-Based Vision Sensors." Neuromorphic Computing
Handbook, edited by Carla Davis, Springer, 2019, pp. 45–78.
```

**Conference paper.**
```
Lee, Sarah, and Jin Park. "Gesture Recognition with Event Cameras."
Proceedings of the IEEE Conference on Computer Vision and Pattern
Recognition, IEEE, 2021, pp. 1234–1245.
```

### Special cases

- No author: start with title.
- No date: use `n.d.` or omit if a date is genuinely unknowable.
- Web sources: include URL and access date.

### Author-list rules

- 1 author: full name.
- 2 authors: both full names.
- 3+ authors: first author + "et al."

---

## 3. Vancouver — biomedical numerical style

Used widely in biomedical journals (NEJM, JAMA, BMJ, The Lancet
follow Vancouver-like styles with house variations). Vancouver-style
references are numbered in order of first appearance.

### In-text citation

- Numerical, in square brackets or as superscripts depending on
  venue: `[1]` or `¹`.
- Multiple citations: `[1,3,7]` or `[1–3,7]` (consecutive numbers
  use en-dash).
- Citations appear immediately after the cited claim, before
  punctuation: `…has been demonstrated [1,3].`

### Reference list entries

Numbered in order of first appearance in the text. Format
conventions:

- Authors: Last F (no comma, no period between initials), separated
  by commas. List first six authors; for more, add "et al." after
  the sixth.
- Title in sentence case, no italics.
- Journal name abbreviated per Index Medicus (when known).
- Year, volume, pages on one line; format depends on house style.

Examples:

**Journal article.**
```
1. Smith JR, Lee S, Park J. A study of stochastic spiking neural
networks for low-power inference. J Neural Eng. 2020;17(3):123-145.
doi:10.1088/1741-2552/abcdef
```

**Book chapter.**
```
2. Brown A. Event-based vision sensors. In: Davis C, editor.
Neuromorphic computing handbook. Cham: Springer; 2019. p. 45-78.
```

**Conference paper.**
```
3. Lee S, Park J. Gesture recognition with event cameras. In:
Proceedings of the IEEE Conference on Computer Vision and Pattern
Recognition; 2021 Jun 20-25; Nashville, TN. IEEE; 2021. p.
1234-1245.
```

### Author-list rules

- Up to 6 authors: list all.
- 7+ authors: list first 6, then "et al."

### Special cases

- Online-only journals: include the URL or DOI.
- Preprints: include the preprint server name.
- Personal communications: cited in text only, not in reference
  list.

---

## 4. IEEE — Institute of Electrical and Electronics Engineers

Used widely in engineering, computer science, and the IEEE family
of journals and conferences. Like Vancouver, IEEE is numerical.

### In-text citation

- Numerical, in square brackets: `[1]`.
- Citations can be referred to as objects: "as shown in [1]" or
  "see [1, p. 17]".
- Multiple citations: `[1], [3], [7]` (separate brackets) or
  `[1]–[3]` for consecutive.

### Reference list entries

Numbered in order of first appearance. Format conventions:

- Authors: F. Last (initial first, period, space, surname),
  separated by commas. Use "and" before the final author.
- Title in title case, in quotation marks for articles and chapters,
  italicized for books and journal names.
- Volume `vol. N`, issue `no. N`, pages `pp. NN-NN`, month and year.

Examples:

**Journal article.**
```
[1] J. R. Smith, S. Lee, and J. Park, "A study of stochastic
spiking neural networks for low-power inference," J. Neural Eng.,
vol. 17, no. 3, pp. 123-145, Mar. 2020.
```

**Conference paper.**
```
[2] S. Lee and J. Park, "Gesture recognition with event cameras,"
in Proc. IEEE Conf. Comput. Vis. Pattern Recognit., Nashville, TN,
USA, Jun. 2021, pp. 1234-1245.
```

**Book.**
```
[3] A. Brown, Event-Based Vision Sensors. Cham, Switzerland:
Springer, 2019.
```

**Software.**
```
[4] R. Müller. (2022). spynnaker (Version 6.0.0). [Online].
Available: https://github.com/SpiNNakerManchester/sPyNNaker
```

### Author-list rules

- Up to 6 authors: list all.
- 7+ authors: list first author, then "et al." (in text);
  reference list practice varies by IEEE venue.

### Special cases

- Standards: cite the standard number, title, and year.
- Patents: include patent number and date.
- Datasets: cite as software / online resources.

---

## 5. Chicago author-date — Chicago Manual of Style, 17th edition

Used widely in social sciences, history, and some humanities.
Chicago has two systems; the author-date system is the one
supported here. The notes-and-bibliography system (footnotes +
bibliography) is also Chicago but is a separate style.

### In-text citation

- Parenthetical: `(Smith 2020)` for one author, `(Smith and Jones
  2020)` for two, `(Smith, Lee, and Park 2020)` for three (list
  all three on first cite; subsequently `Smith et al. 2020`),
  `(Smith et al. 2020)` for four or more.
- Page numbers: `(Smith 2020, 17)` (comma but no `p.` prefix) or
  `(Smith 2020, 17-18)`.
- Narrative: `Smith (2020, 17) argues that…`
- Multiple works: separated by semicolons: `(Smith 2020; Jones
  2018)`.

### Reference list entries

Alphabetical by first author surname. Format conventions:

- First author: Last, First. Subsequent authors: First Last.
- Year directly after authors: `Smith, John R. 2020.`
- Title in title case (for books and journals) or sentence case
  (per house style); article titles in quotation marks; book and
  journal titles italicized.
- DOI as URL.

Examples:

**Journal article.**
```
Smith, John R. 2020. "A Study of Stochastic Spiking Neural Networks
for Low-Power Inference." Journal of Neural Engineering 17 (3):
123-145. https://doi.org/10.1088/1741-2552/abcdef.
```

**Book chapter.**
```
Brown, Anne. 2019. "Event-Based Vision Sensors." In Neuromorphic
Computing Handbook, edited by Carla Davis, 45-78. Cham: Springer.
```

**Book.**
```
Davis, Carla, ed. 2019. Neuromorphic Computing Handbook. Cham:
Springer.
```

### Author-list rules

- 1–3 authors: list all in first citation; et al. for 3 from
  subsequent in-text citations.
- 4+ authors: et al. from the first in-text citation; full list
  in the reference list.
- 11+ authors: list first 7 in reference list, then et al.

### Special cases

- No date: use `n.d.`
- Multiple works same author same year: suffix with a, b, c.

---

## 6. Date formatting

Per style:

| Style | In-text | Reference list |
|-------|--------|----------------|
| APA 7 | Year only | Year only (month and day for newspapers, blog posts) |
| MLA 9 | n/a (no year in-text) | Day Mon. Year |
| Vancouver | n/a (numerical) | Year;Vol(Issue):Pages |
| IEEE | n/a (numerical) | Mon. Year (abbreviated) |
| Chicago AD | Year only | Year only (full date for some sources) |

## 7. DOI and URL handling

Per style:

- APA 7: `https://doi.org/10.xxxx/yyyy` (no "doi:" prefix; URL form
  preferred).
- MLA 9: full DOI URL or `doi:10.xxxx/yyyy`; access date for web
  sources without a clear publication date.
- Vancouver: `doi:10.xxxx/yyyy` (most common variant; some venues
  prefer URL form).
- IEEE: usually omitted unless required; when included, as URL or
  DOI.
- Chicago AD: `https://doi.org/10.xxxx/yyyy`.

## 8. Et al. cutoff summary

| Style | First in-text citation | Subsequent in-text | Reference list |
|-------|------------------------|--------------------|----------------|
| APA 7 | et al. for 3+ | et al. for 3+ | up to 20 listed |
| MLA 9 | et al. for 3+ | et al. for 3+ | et al. for 3+ |
| Vancouver | n/a | n/a | up to 6 listed, then et al. |
| IEEE | et al. for 7+ | et al. for 7+ | up to 6 listed, then et al. (varies) |
| Chicago AD | list all for 1-3, et al. for 4+ | et al. for 3+ | up to 10 listed (then et al.) |

(Cutoffs vary slightly across editions and house styles. The
`citation-checker` agent applies the cutoff per the user's
specified style.)

## 9. Preprints

Preprints are increasingly cited. Each style has conventions:

- APA 7: include the preprint server, the arXiv ID (or equivalent),
  and the DOI when available.
- MLA 9: cite as a web source; include the server and URL.
- Vancouver: include "Preprint" label, server, date.
- IEEE: cite as online available, include URL.
- Chicago AD: cite the preprint with year, server, and URL.

When in doubt, the in-text citation makes clear that the cited
work is a preprint (sometimes through a parenthetical "preprint"
note).

## 10. Software citations

A growing area of citation practice. Each style supports software
citations as a source type. Recommended fields: author(s), year,
software name, version, type indicator ("Computer software" or
"[Software]"), publisher (often a code-hosting platform), URL or
DOI.

The Software Citation Principles published by the FORCE11 working
group provide cross-cutting guidance; specific style applications
follow the publisher's rules.

## 11. Closing note

This reference summarizes patterns. Specific journals layer house
styles on top of these systems. When the user names a venue, the
`format-converter` agent looks up the venue's house style if known;
otherwise the user supplies the venue's instructions or a CSL file.
