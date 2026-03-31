# TOOLS.md - Admin Toolkit & Workspace Reference

**Your cheat sheet for StudyClaw/OpenClaw operations.**  
Updated: `YYYY-MM-DD`

## 🔧 Terminal Command Aliases (Mental Map)

**Safe inspection (green light):**
```
git s    # git status --short
git l    # git log --oneline -10
gt       # git status + diff summary  
fd .     # fuzzy find files (ripgrep + fzf)
t        # tree -L 2 (workspace structure)
ps aux | grep node  # dev processes
```

**Project health checks:**
```
npm t    # npm test (or yarn test)
npm run lint
npm run build -- --watch=false
docker ps -a  # if dockerized
```

**Propose-first automation:**
```
# File triage
find . -name "*.todo" -o -name "TODO" -o -name "FIXME"

# Unused deps  
npm ls --depth=0 | grep unused

# Commit prep
git add . && git diff --cached --stat
```

## 📁 Workspace Structure (Auto-scan output)

```
Last scanned: YYYY-MM-DD HH:MM

StudyClaw/
├── src/           # Main app logic
├── tests/         # Test suites  
├── docs/          # API/project docs
├── scripts/       # Automation (backup this!)
├── .env.example   # Template for env
├── package.json   # Core deps entrypoint
└── TODO.md        # Active task list

OpenClaw/ (if exists)
├── backend/
├── frontend/
└── shared/
```

## 🛠️ Key Scripts & Entry Points

```
scripts/
├── dev.sh         # Full dev environment (docker-compose up + hot reload)
├── deploy.sh      # Staging deploy (ask before prod)
├── backup.sh      # Workspace snapshot to ../backups/
├── triage.sh      # TODO scanner + blocker summary

Run: `./scripts/NAME.sh --help`
```

## 🔑 Environment Notes

```
Primary branch: main (not master)
Default linter: eslint + prettier
Test coverage target: >85%
DB: PostgreSQL (local: localhost:5432/studyclaw)
API port: 3001
Frontend: 3000
```

## ⚙️ Common Workflows

**1. Daily health check:**
```
gt && npm t && npm run lint && echo "✅ Workspace healthy"
```

**2. New feature start:**
```
git checkout -b feature/NAME
npm run dev
# Edit → test → commit → PR
```

**3. Blocker triage:**
```
./scripts/triage.sh
# Review TODO.md + console output
```

**4. Before commits:**
```
git diff --cached | grep -i todo  # Catch accidental TODOs
npm run build  # Fail-fast
```

## 📊 Quick Stats Commands

```
# Open issues/PRs
gh issue list --limit 10  # if GitHub CLI available

# Dependency health
npm outdated | head -10

# Log tail (if running)
tail -f logs/app.log
```

## 🚨 Emergency Recovery

```
# Lost work?
git reflog | head -20

# Corrupted node_modules?  
rm -rf node_modules && npm ci

# Docker nuke (ask first)
docker-compose down -v && docker system prune -f
```

---

**Pro tip:** When you create new scripts/tools, add them here immediately.  
**Last updated by:** Admin agent  
**Scan reminder:** Run workspace scan every session start
```
