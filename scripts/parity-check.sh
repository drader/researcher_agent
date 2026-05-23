#!/usr/bin/env bash
# parity-check.sh — verify researcher_agent's report pages and registries
# stay in lockstep with the rest of the repo.
#
# Run from the repo root:
#     bash scripts/parity-check.sh
#
# Exit code 0 = clean. Non-zero = at least one drift detected.
# CLAUDE.md §"Documentation parity" describes when this should run.

set -u

# ── Color helpers (no-color if not a TTY) ───────────────────────────────
if [ -t 1 ]; then
  R=$'\033[31m'; G=$'\033[32m'; Y=$'\033[33m'; B=$'\033[1m'; N=$'\033[0m'
else
  R= G= Y= B= N=
fi

FAILED=0
SECTION=""

section() {
  SECTION="$1"
  echo
  echo "${B}── $1 ──${N}"
}

pass() { echo "  ${G}✓${N} $*"; }
warn() { echo "  ${Y}!${N} $*"; }
fail() { echo "  ${R}✗${N} $*"; FAILED=$((FAILED+1)); }

# ── 0. Sanity: are we at the repo root? ─────────────────────────────────
if [ ! -f "CLAUDE.md" ] || [ ! -f "MODE_REGISTRY.md" ]; then
  echo "${R}ERROR${N}: run from the repo root (CLAUDE.md not found here)."
  exit 2
fi

# ── 1. HTML tag balance + slide counts ──────────────────────────────────
section "1. HTML structure (tag balance + slide count)"

python3 - <<'PY' || FAILED=$((FAILED+1))
import re, sys
ok = True
for f in ['docs/index.html', 'docs/architecture.html']:
    try:
        s = open(f).read()
    except FileNotFoundError:
        print(f"  \033[31m✗\033[0m {f}: missing")
        ok = False; continue
    od = len(re.findall(r'<div\b', s))
    cd = len(re.findall(r'</div>', s))
    os_ = len(re.findall(r'<span\b', s))
    cs = len(re.findall(r'</span>', s))
    slides = len(re.findall(r'<div class="slide(?:\s+active)?"', s))
    active = len(re.findall(r'<div class="slide\s+active"', s))
    bad = []
    if od != cd: bad.append(f"div {od}/{cd}")
    if os_ != cs: bad.append(f"span {os_}/{cs}")
    if slides < 1: bad.append("no slides")
    if active != 1: bad.append(f"active={active} (expect 1)")
    if bad:
        print(f"  \033[31m✗\033[0m {f}: " + ", ".join(bad))
        ok = False
    else:
        print(f"  \033[32m✓\033[0m {f}: {slides} slides, div balanced, span balanced, 1 active")
sys.exit(0 if ok else 1)
PY

# ── 2. <img src=...> references resolve ─────────────────────────────────
section "2. Image references resolve to real files"

python3 - <<'PY' || FAILED=$((FAILED+1))
import re, os, sys
ok = True
for f in ['docs/index.html', 'docs/architecture.html']:
    if not os.path.exists(f): continue
    base = os.path.dirname(f)
    for src in re.findall(r'<img[^>]*src="([^"]+)"', open(f).read()):
        if src.startswith(('http://','https://','data:')):
            continue
        # img src is relative to the HTML file's directory
        full = os.path.normpath(os.path.join(base, src))
        if os.path.exists(full):
            print(f"  \033[32m✓\033[0m {f}  →  {src}")
        else:
            print(f"  \033[31m✗\033[0m {f}  →  {src}  (resolves to {full}, MISSING)")
            ok = False
sys.exit(0 if ok else 1)
PY

# ── 3. MODE_REGISTRY row counts match per-skill claims ──────────────────
section "3. MODE_REGISTRY.md: 24 modes total, 7+9+6+2 per skill"

python3 - <<'PY' || FAILED=$((FAILED+1))
import re, sys
s = open('MODE_REGISTRY.md').read()
sections = {
    'research':     7,
    'compose':      9,
    'critique':     6,
    'orchestrate':  2,
}
total_expected = sum(sections.values())
ok = True
# Match each section's row count under a header like "## research skill (7 modes)"
for skill, expected in sections.items():
    m = re.search(rf'## {skill} skill[^\n]*\n(.+?)(?=\n## |\Z)', s, re.S)
    if not m:
        print(f"  \033[31m✗\033[0m no section for {skill}")
        ok = False
        continue
    body = m.group(1)
    rows = [ln for ln in body.splitlines() if ln.startswith('| `')]
    if len(rows) == expected:
        print(f"  \033[32m✓\033[0m {skill}: {len(rows)} modes")
    else:
        print(f"  \033[31m✗\033[0m {skill}: {len(rows)} rows, expected {expected}")
        ok = False
all_rows = [ln for ln in s.splitlines() if ln.startswith('| `')]
if len(all_rows) == total_expected:
    print(f"  \033[32m✓\033[0m total: {len(all_rows)} modes")
else:
    print(f"  \033[31m✗\033[0m total: {len(all_rows)}, expected {total_expected}")
    ok = False
sys.exit(0 if ok else 1)
PY

# ── 4. AGENT_REGISTRY persona names == real persona files ───────────────
section "4. AGENT_REGISTRY.md vs skills/<skill>/agents/*.md"

python3 - <<'PY' || FAILED=$((FAILED+1))
import re, os, glob, sys
reg = open('AGENT_REGISTRY.md').read()
reg_names = set(re.findall(r'\| `([a-z][a-z-]+)`', reg))
disk_names = set(
    os.path.splitext(os.path.basename(p))[0]
    for p in glob.glob('skills/*/agents/*.md')
)
extra_in_reg  = reg_names - disk_names
extra_on_disk = disk_names - reg_names
if not extra_in_reg and not extra_on_disk:
    print(f"  \033[32m✓\033[0m {len(reg_names)} personas in registry == {len(disk_names)} on disk")
    sys.exit(0)
for n in sorted(extra_in_reg):
    print(f"  \033[31m✗\033[0m in AGENT_REGISTRY but no file: {n}")
for n in sorted(extra_on_disk):
    print(f"  \033[31m✗\033[0m file exists but not in AGENT_REGISTRY: {n}")
sys.exit(1)
PY

# ── 5. README counts match reality ──────────────────────────────────────
section "5. README.md counts vs reality"

python3 - <<'PY' || FAILED=$((FAILED+1))
import re, os, glob, sys
readme = open('README.md').read()
ok = True
checks = [
    (r'(\d+)\s+sub-agent personas',
     len(glob.glob('skills/*/agents/*.md')),
     'sub-agent personas'),
    (r'(\d+)\s+modes,',
     None,  # mode count from MODE_REGISTRY
     'modes'),
    (r'(\d+)\s+slash\s+commands',
     len(glob.glob('commands/*.md')),
     'slash commands'),
]
# Resolve modes count from MODE_REGISTRY
mode_count = len([ln for ln in open('MODE_REGISTRY.md').readlines() if ln.startswith('| `')])
for pat, expected, label in checks:
    m = re.search(pat, readme)
    if not m:
        print(f"  \033[33m!\033[0m no \"{label}\" mention in README")
        continue
    claimed = int(m.group(1))
    if label == 'modes':
        expected = mode_count
    if claimed == expected:
        print(f"  \033[32m✓\033[0m README claims {claimed} {label} (matches reality)")
    else:
        print(f"  \033[31m✗\033[0m README claims {claimed} {label}, reality = {expected}")
        ok = False
sys.exit(0 if ok else 1)
PY

# ── 6. commands/ count vs README + docs/index.html ──────────────────────
section "6. commands/*.md count consistency"

python3 - <<'PY' || FAILED=$((FAILED+1))
import re, glob, sys
disk = len(glob.glob('commands/*.md'))
# Collapse whitespace before regex so multi-line breaks don't matter
readme = re.sub(r'\s+', ' ', open('README.md').read())
index  = open('docs/index.html').read()
m_r = re.search(r'(\d+)\s+slash\s+commands', readme)
m_i = re.search(r'<span class="k">(\d+)</span>\s*slash\s*commands', index)
readme_claim = int(m_r.group(1)) if m_r else None
index_claim  = int(m_i.group(1)) if m_i else None
print(f"  on-disk:          {disk} files in commands/")
print(f"  README claim:     {readme_claim}")
print(f"  docs/index.html:  {index_claim}")
if readme_claim == disk == index_claim:
    print(f"  \033[32m✓\033[0m all three agree at {disk}")
    sys.exit(0)
print(f"  \033[31m✗\033[0m disagreement")
sys.exit(1)
PY

# ── 7. CHANGELOG.md latest version == docs/index.html / CITATION.cff ────
section "7. Version + release date sync"

python3 - <<'PY' || FAILED=$((FAILED+1))
import re, sys
ch = open('CHANGELOG.md').read()
m = re.search(r'^##\s*\[?v?(\d+\.\d+\.\d+)\]?[^\n]*?(\d{4}-\d{2}-\d{2})', ch, re.M)
if not m:
    print("  \033[31m✗\033[0m could not parse latest version/date from CHANGELOG.md")
    sys.exit(1)
ch_ver, ch_date = m.groups()
print(f"  CHANGELOG.md: v{ch_ver} ({ch_date})")

ok = True
# CITATION.cff
cit = open('CITATION.cff').read()
mv = re.search(r'^version:\s*"?([^"\n]+)"?', cit, re.M)
md = re.search(r'^date-released:\s*"?([^"\n]+)"?', cit, re.M)
if mv and mv.group(1) == ch_ver:
    print(f"  \033[32m✓\033[0m CITATION.cff version matches ({ch_ver})")
else:
    print(f"  \033[31m✗\033[0m CITATION.cff version = {mv.group(1) if mv else 'missing'}")
    ok = False
if md and md.group(1) == ch_date:
    print(f"  \033[32m✓\033[0m CITATION.cff date matches ({ch_date})")
else:
    print(f"  \033[31m✗\033[0m CITATION.cff date = {md.group(1) if md else 'missing'}")
    ok = False

# docs/index.html (slide 16 big-number + status text)
idx = open('docs/index.html').read()
if f'v{ch_ver}' in idx or f'>{ch_ver}<' in idx:
    print(f"  \033[32m✓\033[0m docs/index.html mentions v{ch_ver}")
else:
    print(f"  \033[31m✗\033[0m docs/index.html does not mention v{ch_ver}")
    ok = False
if ch_date in idx:
    print(f"  \033[32m✓\033[0m docs/index.html mentions {ch_date}")
else:
    print(f"  \033[31m✗\033[0m docs/index.html does not mention {ch_date}")
    ok = False

# README.md Status section
rd = open('README.md').read()
if f'v{ch_ver}' in rd and ch_date in rd:
    print(f"  \033[32m✓\033[0m README.md status mentions v{ch_ver} ({ch_date})")
else:
    print(f"  \033[31m✗\033[0m README.md status missing v{ch_ver} or {ch_date}")
    ok = False

sys.exit(0 if ok else 1)
PY

# ── Summary ─────────────────────────────────────────────────────────────
echo
echo "═══════════════════════════════════════════════════════════"
if [ "$FAILED" -eq 0 ]; then
  echo "  ${G}✓ All parity checks passed.${N}"
  echo "═══════════════════════════════════════════════════════════"
  exit 0
else
  echo "  ${R}✗ ${FAILED} parity check(s) FAILED.${N}"
  echo "  CLAUDE.md §'Documentation parity' explains how to fix."
  echo "═══════════════════════════════════════════════════════════"
  exit 1
fi
