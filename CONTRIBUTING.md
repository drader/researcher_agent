# Contributing

Thank you for your interest in `researcher_agent`. This document
records the basic ground rules for contribution.

## License

By contributing, you agree that your contributions are licensed under
the project's CC BY-NC 4.0 license. Note that this license restricts
commercial reuse; please ensure you are comfortable with this before
contributing.

If your contribution is intended for commercial use, please contact
the maintainer about a separate license arrangement.

## Originality requirement

All contributed text — prompts, agent personas, templates, examples,
documentation — must be your original work, written from scratch. Do
not paste or paraphrase text from other research-skills tools, even
if they are open source. The methodology references the project uses
(PRISMA 2020, Socratic method, APA 7, IMRaD) are public-domain
scholarly practices; references to them are fine.

If you adapt an idea or method from another work, attribute it via
the `references/` mechanism (a methodology source) rather than by
copying prose.

## What kinds of contributions are welcome

- New skills (Phase 2/3/4 work)
- New modes within existing skills
- New sub-agent personas
- Methodology reference documents
- Output templates
- Improved prompts for existing modes (clearer instructions, better
  edge case handling)
- Bug reports with reproductions
- Documentation improvements

## What is out of scope

- Commercial-use enablement features (paid tier, SaaS integration, etc.)
- Removal of the human-in-the-loop checkpoint discipline
- Features that help conceal AI use (the framework's design is the
  opposite: support transparent disclosure)
- Tightly coupled integrations with proprietary closed-source tools
- Reproductions of features from other commercial tools

## Pull request process

1. Open an issue first describing the proposed change. This avoids
   wasted work on contributions that may not fit the project direction.
2. Fork the repository.
3. Create a feature branch (`feature/<short-description>`).
4. Make changes. Keep them focused; one PR per logical change.
5. Update [MODE_REGISTRY.md](MODE_REGISTRY.md) and [CHANGELOG.md](CHANGELOG.md)
   if your change touches modes, skills, or commands.
6. **Sync the HTML report pages.** If your change alters anything
   reflected in [docs/index.html](docs/index.html) or [docs/architecture.html](docs/architecture.html)
   (skill or mode counts, command names, version, layout, principles,
   diagrams), update those files in the same PR. When a PR contains
   multiple commits, the final commit before pushing must be the HTML
   sync. See [CLAUDE.md](CLAUDE.md) for the full rule and parity check.
7. Open a pull request. In the description, explain the motivation
   and link to the originating issue.

## Style guide

- Markdown: GitHub-flavored. Use `## H2` for major sections, `### H3`
  for subsections. Avoid heading-level skipping.
- File names: kebab-case (`source-verifier.md`)
- Frontmatter keys: snake_case (per YAML convention)
- Code blocks: language-tagged (`bash`, `python`, `yaml`, etc.)
- Line length: ~80 columns for prose, no hard limit for tables/code
- Avoid bullet-point overload; use prose where it reads better

## Code of conduct

Be considerate, accept feedback gracefully, focus on the technical
merits of contributions. Personal attacks or harassment will result
in PRs/issues being closed and contribution access being revoked.

## Reporting security issues

See [SECURITY.md](SECURITY.md) for the full policy, including scope,
the private reporting channel (GitHub Security Advisories), and what
to expect after a report. **Please do not open a public Issue for a
security report.**

## Questions

For questions about the project direction, license, or specific
design decisions, open a GitHub Discussion or contact the maintainer.
