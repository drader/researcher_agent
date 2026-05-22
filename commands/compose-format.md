---
description: Cross-format conversion (Markdown / LaTeX / DOCX / PDF) via the compose skill in format mode.
model: sonnet
---

Invoke the `compose` skill in **format mode**.

Convert a manuscript between formats, including citation-style
conversion. Uses pandoc and adjacent tools.

Workflow:

1. Gather inputs:
   - Source manuscript (current format and path)
   - Target format (LaTeX, DOCX, PDF, EPUB, HTML, Markdown)
   - Target citation style (if different from source)
   - Venue-specific overrides (template, class file, journal style)
     if applicable

2. Verify the conversion is feasible. Common feasible directions:
   - Markdown → LaTeX (excellent, near-lossless)
   - Markdown → DOCX (good, formatting decisions handled by template)
   - LaTeX → DOCX (good for prose; math may need attention)
   - LaTeX → PDF (native XeLaTeX/LuaLaTeX usually beats pandoc)
   - DOCX → Markdown (good for prose; complex tables may need cleanup)
   - DOCX → LaTeX (variable; depends on Word formatting hygiene)

3. Identify potential conversion losses:
   - Math rendering (especially complex LaTeX in DOCX targets)
   - Custom LaTeX commands (likely lost in DOCX)
   - Table layouts (especially multi-column or merged cells)
   - Figure placement (relative position may shift)
   - Footnote semantics across formats

   Surface these to the user as a pre-conversion advisory.

4. Convert citations:
   - BibTeX ↔ CSL JSON
   - APA 7 ↔ MLA 9 ↔ Vancouver ↔ IEEE ↔ Chicago author-date
   - Citation Style Language (CSL) repository supplies most named
     styles

5. Execute the conversion. Provide the pandoc command run, in case
   the user wants to reproduce it.

6. Generate a delta report:
   - What converted cleanly
   - What required manual review (math, tables, figures, custom
     commands)
   - Where in the output file each manual-review item is located

7. Present the converted manuscript + the delta report. Offer to
   apply targeted fixes for specific delta items.

Mandatory checkpoint: pre-conversion advisory (step 3).

Refusals:
- Do not silently strip content that doesn't convert. If a custom
  LaTeX command is lost, the delta report names it.
- Do not claim a conversion was lossless when it was not.

Tooling: pandoc is the default. For LaTeX → PDF, native XeLaTeX or
LuaLaTeX may be preferred. For DOCX targets, a reference-doc template
is recommended for consistent styling.
