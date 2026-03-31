# Agent Continuity System

## Problem
When OpenClaw gateway restarts, all agent sessions are killed mid-task with no way to resume.

## Solution
Agents checkpoint their state to `active-task.md` periodically. On startup, they check this file and resume if there was active work.

---

## How It Works

### 1. Checkpoint During Work
Agent writes current task to `active-task.md` in their workspace:
```markdown
# Active Task - 2026-03-28

## Status: IN_PROGRESS
## Last Updated: 2026-03-28T00:50:00Z

## Task
Working on refactoring auth module in /src/auth

## Progress
- [x] Analyzed current auth flow
- [x] Identified duplicate code in login.ts
- [ ] Extracting shared logic to auth-utils.ts
- [ ] Testing new implementation

## Context
- File: src/auth/login.ts
- Lines: 45-120
- Next step: Extract validateToken function to auth-utils.ts
```

### 2. On Startup Resume
When agent starts, it checks:
1. Does `active-task.md` exist?
2. Is `Status: IN_PROGRESS`?
3. Was the task interrupted (not marked complete)?

If yes → Resume with the last documented task.

---

## Files

- `scripts/checkpoint.sh` - Manual checkpoint trigger
- `skills/agent-resume/` - Skill for auto-checkpoint + resume

---

## Usage

**For Agents:**
```
# At start of session
- Read active-task.md
- If IN_PROGRESS → resume task

# During work (every ~5 min or before significant changes)
- Update active-task.md with progress
```

**Manual Trigger:**
```bash
./scripts/checkpoint.sh "Task description" "Next step"
```

---

## Integration

This system should be built into the agent's startup sequence and workspace initialization.
Add to AGENTS.md as standard practice for all agents.
