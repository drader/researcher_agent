# Setup

Multiple installation patterns are supported. Pick the one that
matches your workflow.

## Prerequisites

- Claude Code (CLI, VS Code extension, or JetBrains plugin)
- Git (for the canonical clone approach)
- macOS, Linux, or Windows (Windows: use WSL or Git Bash for the
  symlink commands)

## Option A — Symlinks from a canonical clone (recommended)

Best for: developers using the framework across multiple projects who
want to keep one source of truth.

```bash
# 1. Clone to a stable location
git clone https://github.com/drader/researcher_agent ~/researcher_agent

# 2. In each target project, symlink the skills and commands you want
cd /path/to/project
mkdir -p .claude/skills .claude/commands

# Phase 1: only the research skill is available
ln -s ~/researcher_agent/skills/research .claude/skills/research

# All research-related slash commands
for c in ~/researcher_agent/commands/research-*.md; do
  ln -s "$c" .claude/commands/$(basename "$c")
done
```

To update later: `cd ~/researcher_agent && git pull`. The symlinks
will automatically pick up the latest content.

## Option B — Symlinks at user level (for all projects)

Best for: solo users who want the framework available in every project
without per-project setup.

```bash
git clone https://github.com/drader/researcher_agent ~/researcher_agent

mkdir -p ~/.claude/skills ~/.claude/commands
ln -s ~/researcher_agent/skills/research ~/.claude/skills/research
for c in ~/researcher_agent/commands/research-*.md; do
  ln -s "$c" ~/.claude/commands/$(basename "$c")
done
```

User-level skills and commands are available to Claude Code in any
working directory. They are layered below project-local ones; a
project-local skill with the same name takes precedence.

## Option C — Copy (no symlinks)

Best for: environments where symlinks are problematic (some Windows
setups, certain cloud sandboxes).

```bash
git clone https://github.com/drader/researcher_agent /tmp/researcher_agent
cd /path/to/project
mkdir -p .claude/skills .claude/commands

cp -R /tmp/researcher_agent/skills/research .claude/skills/research
cp /tmp/researcher_agent/commands/research-*.md .claude/commands/
```

Trade-off: updates require manual re-copying. Easy to drift out of
sync with upstream.

## Option D — Claude Code plugin marketplace

Best for: when this repo is hosted as a Claude Code marketplace plugin
and you want automatic updates.

```text
/plugin marketplace add drader/researcher_agent
/plugin install researcher_agent
```

This requires the repo to be tagged as a Claude Code plugin (the
`.claude-plugin/plugin.json` manifest is in place; you would need to
publish to a marketplace or host it where Claude Code can resolve it).

## Verification

After install, verify discovery:

```bash
cd /path/to/project
ls -la .claude/skills/research/SKILL.md
ls .claude/commands/research-*.md
```

In a Claude Code session:

```
You: Type "/" — autocompletion should show /research-brief, /research-full,
     /research-socratic, /research-systematic, /research-verify,
     /research-annotate, /research-evaluate
```

If commands do not appear, restart Claude Code (skill discovery is
cached at session start).

## Uninstall

```bash
cd /path/to/project
rm .claude/skills/research
rm .claude/commands/research-*.md   # only removes the symlinks/copies
# the canonical clone at ~/researcher_agent is untouched
```

For user-level install: replace paths above with `~/.claude/skills/`
and `~/.claude/commands/`.

## Updating

```bash
cd ~/researcher_agent
git fetch --tags
git pull
# Symlinks pick up new content automatically.
# For copy-based install, repeat the copy step.
```

Check [CHANGELOG.md](../CHANGELOG.md) for what changed.

## Troubleshooting

**Commands do not appear in Claude Code autocomplete:**
- Verify the file exists at `.claude/commands/<name>.md` (or
  `~/.claude/commands/<name>.md` for user-level)
- Restart Claude Code; skills are discovered at session start
- Check that the file has valid YAML frontmatter (front-matter must
  start with `---` on line 1)

**Skill is loaded but mode triggers do not fire:**
- Open the skill's SKILL.md and check the trigger phrases
- Phrases are matched fairly literally; rephrase your request to use
  one of the listed trigger phrases verbatim
- Or invoke the corresponding slash command directly

**Symlink broken on shared/checked-out repo:**
- The canonical clone path is absolute; symlinks committed to a repo
  point to one specific machine's filesystem
- For shared repos, prefer Option C (copy) or document the install
  step in the project's README so collaborators can replicate it
