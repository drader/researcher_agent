# Pandoc format matrix

This reference describes how the `format` mode uses pandoc for
cross-format manuscript conversion. Pandoc is open-source (GPL) and
the de facto standard for converting between markup and word-
processor formats. The `format-converter` sub-agent assumes pandoc
is available on the user's system; if it is not, the agent produces
target-format content inline and supplies a command for the user to
run locally.

---

## 1. Supported formats

| Format | Input | Output | Typical use |
|--------|:-----:|:------:|-------------|
| Markdown (CommonMark, GFM, pandoc-md) | yes | yes | Canonical drafting format |
| LaTeX | yes | yes | arXiv submission, journal templates |
| DOCX (Word) | yes | yes | Collaboration with Word users |
| ODT (OpenDocument) | yes | yes | Open-source word processors |
| PDF | partial | yes | Archival, sharing |
| EPUB | yes | yes | Book-length work, e-readers |
| HTML | yes | yes | Web preview, supplementary material |
| RTF | yes | yes | Legacy editor compatibility |

PDF as input is limited to text extraction; the `format-converter`
agent does not treat PDF-in as a reliable conversion source.

---

## 2. Common conversion recipes

The recipes below assume pandoc 3.x. The framework records the exact
command used in the delta report so the user can reproduce or modify
the conversion.

### Markdown to LaTeX (for arXiv or journal templates)

```
pandoc paper.md \
  --from markdown \
  --to latex \
  --bibliography refs.bib \
  --citeproc \
  --csl apa.csl \
  --standalone \
  -o paper.tex
```

Notes:
- `--citeproc` resolves citations using the supplied CSL file.
- `--standalone` produces a complete `.tex` document with preamble;
  omit for a fragment.

### Markdown to DOCX (for journals that require Word)

```
pandoc paper.md \
  --from markdown \
  --to docx \
  --bibliography refs.bib \
  --citeproc \
  --csl apa.csl \
  --reference-doc=template.docx \
  -o paper.docx
```

Notes:
- `--reference-doc` uses a template DOCX for styling (margins,
  fonts, heading styles). The journal often supplies this template.

### LaTeX to DOCX (for sharing with non-LaTeX co-authors)

```
pandoc paper.tex \
  --from latex \
  --to docx \
  --bibliography refs.bib \
  --citeproc \
  --csl apa.csl \
  -o paper.docx
```

Notes:
- Custom LaTeX commands defined in the user's preamble will not be
  preserved. The delta report lists each loss.
- Complex tables, math, and tikz figures may not convert cleanly.

### Markdown to PDF (via XeLaTeX for Unicode support)

```
pandoc paper.md \
  --from markdown \
  --to pdf \
  --pdf-engine=xelatex \
  --bibliography refs.bib \
  --citeproc \
  --csl apa.csl \
  -o paper.pdf
```

Notes:
- For non-Latin scripts, `--pdf-engine=xelatex` or `lualatex` is
  required.
- For native LaTeX output preceding PDF rendering, generate `.tex`
  first and compile separately.

### DOCX to Markdown (for re-editing in plain text)

```
pandoc paper.docx \
  --from docx \
  --to markdown \
  --extract-media=./media \
  -o paper.md
```

Notes:
- `--extract-media` extracts embedded images to a directory.
- Tracked changes in the DOCX can be preserved with
  `--track-changes=accept|reject|all`.

### LaTeX to HTML (for web preview or supplementary material)

```
pandoc paper.tex \
  --from latex \
  --to html5 \
  --bibliography refs.bib \
  --citeproc \
  --csl apa.csl \
  --mathjax \
  --standalone \
  -o paper.html
```

Notes:
- `--mathjax` renders LaTeX math via MathJax in the browser.

### Markdown to EPUB (for thesis or book chapters)

```
pandoc chapter1.md chapter2.md chapter3.md \
  --from markdown \
  --to epub3 \
  --metadata title="Thesis title" \
  --metadata author="Author name" \
  --toc \
  -o thesis.epub
```

### Reference-list-only conversion (citation style switch)

When only the reference list needs restyling and the manuscript
otherwise stays in its source format, generate a styled list from
BibTeX:

```
pandoc \
  --from markdown \
  --to plain \
  --bibliography refs.bib \
  --citeproc \
  --csl new-style.csl \
  refs-template.md \
  -o refs-new-style.txt
```

where `refs-template.md` contains a `nocite` directive listing all
entries.

---

## 3. Citation-style files (CSL)

Pandoc reads CSL (Citation Style Language) files for citation
formatting. The CSL repository at https://github.com/citation-style-
language/styles maintains thousands of journal-specific styles.

Common CSL file names:

- `apa.csl` — APA 7
- `modern-language-association.csl` — MLA 9
- `vancouver.csl` — Vancouver
- `ieee.csl` — IEEE
- `chicago-author-date.csl` — Chicago author-date

For venue-specific styles, search the CSL repository by journal name.
Many journals publish their own CSL.

Format conversions between bibliography sources:

| From | To | Tool |
|------|----|----|
| BibTeX (`.bib`) | CSL JSON (`.json`) | `pandoc-citeproc --bib2json` or `citeproc-js` |
| CSL JSON | BibTeX | `pandoc-citeproc --bib2bib`, or via Zotero export |
| RIS | BibTeX | Zotero, JabRef, or `bibutils` (`ris2xml | xml2bib`) |
| EndNote XML | BibTeX | `bibutils` (`endx2xml | xml2bib`) |

The `format-converter` agent prefers BibTeX as the canonical
reference format because it is the most widely supported source for
pandoc citation processing.

---

## 4. Common pitfalls

### Math rendering

- Inline math uses single dollars (`$x = y$`) in pandoc Markdown.
- Display math uses double dollars (`$$ ... $$`) or LaTeX
  environments.
- DOCX output of complex math may use Office Math format; the
  rendering depends on Word's version.
- HTML output requires `--mathjax`, `--katex`, or `--webtex` to
  render math; without one of these, math appears as raw LaTeX
  source.

### Tables

- Markdown pipe tables (`| col1 | col2 |`) convert cleanly to most
  targets.
- LaTeX `tabular` environments with custom column types do not
  always survive conversion to DOCX. The delta report flags this.
- Multi-row, merged-cell tables require pandoc's `grid_tables`
  syntax in source Markdown; DOCX conversion handles them.

### Images

- Markdown image syntax (`![caption](path.png)`) converts cleanly.
- Embedded images in DOCX are extracted with `--extract-media`.
- For LaTeX output, images are referenced; pandoc does not embed
  them in the `.tex` file. The image files must accompany the `.tex`
  when shared.

### Custom LaTeX commands

- User-defined LaTeX commands (e.g., `\newcommand{\foo}{...}`) do
  not survive conversion to DOCX or HTML; they are lost or rendered
  as raw text.
- Where possible, the `format-converter` agent expands custom
  commands before conversion. When not possible, the loss is
  reported.

### Footnotes

- Markdown footnotes (`[^1]`) convert cleanly to LaTeX `\footnote`
  and DOCX footnotes.
- LaTeX `\footnotemark`/`\footnotetext` separations may not survive
  to other formats.
- Endnotes vs. footnotes: pandoc has flags to convert between them
  in DOCX output.

### Cross-references

- Markdown link references to section identifiers (`[Section 2]`)
  convert to LaTeX `\ref` only with the `--lua-filter` or specific
  pandoc extensions enabled.
- For complex cross-referencing (figures, tables, equations),
  `pandoc-crossref` is the standard filter; specify it with
  `--filter=pandoc-crossref`.

### Citations

- In-text citations in pandoc Markdown use `@key` (e.g.,
  `[@smith2020]`).
- Conversion preserves citation keys and resolves them per the CSL
  file at conversion time.
- If a citation key in the source has no entry in the bibliography,
  pandoc warns; the `citation-checker` agent runs before conversion
  to catch this.

---

## 5. When to use pandoc vs. alternatives

**Use pandoc when:**

- Converting between Markdown, DOCX, LaTeX, ODT, HTML, EPUB.
- A CSL-driven citation-style switch is needed.
- A consistent toolchain across formats is preferred.

**Use LaTeX directly (skip pandoc) when:**

- The user is producing a LaTeX-only deliverable for a venue
  requiring a specific class file (e.g., IEEEtran, elsarticle,
  acmart).
- The manuscript uses features not well supported by pandoc (custom
  packages, tikz figures, beamer for slides).
- The user wants `latexmk` or `xelatex` to drive compilation.

**Use Microsoft Word natively when:**

- The user is collaborating with co-authors who do not use Markdown
  or LaTeX, and tracked changes need to be preserved across edit
  cycles.
- A journal mandates submission of a Word document with embedded
  tracked changes from a specific revision cycle.

**Use a reference manager (Zotero, Mendeley) for BibTeX export when:**

- The user maintains a personal reference library and prefers to
  manage citations there.
- A CSL switch is desired and Zotero's export already supports it.

---

## 6. Integration with sub-agents

The `format-converter` agent invokes pandoc with the appropriate
flags and records the exact command in the delta report. Before
invoking pandoc, the agent:

1. Confirms the source file is in the expected source format.
2. Runs `citation-checker` against the source manuscript to surface
   orphaned citations, missing entries, or style inconsistencies
   that would propagate into the converted output.
3. Identifies any custom commands, exotic table structures, or
   embedded media that may not survive conversion.
4. Selects the CSL file matching the target style.

After conversion, the agent:

1. Inspects pandoc's stderr output for warnings (missing citations,
   unparseable tables, dropped commands).
2. Records every warning in the delta report.
3. Where appropriate, suggests a manual workaround for each loss.

The `citation-checker` agent runs against the source manuscript, not
the converted output, on the principle that conversion is mechanical
and any citation issue would have been present before conversion.

---

## 7. Closing note

Pandoc handles the great majority of conversions cleanly. Where it
does not, the delta report names the loss precisely. The framework
does not silently approximate or rewrite to mask a conversion
failure; reported losses are the user's signal to apply a manual fix
or to choose a different source-target pair.
