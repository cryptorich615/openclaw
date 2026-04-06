---
name: study-revision-planner
description: Build lightweight catch-up and review plans without an exam — uses wrong answers and spaced repetition
author: StudyClaw Team
version: 2.0.0
triggers:
 - "catch-up plan"
 - "revision plan"
 - "study plan"
 - "review plan"
 - "what should I study"
 - "make a plan"
 - "weekly review"
 - "spaced review"
---

# Study Revision Planner

*Build a plan for today, this week, or this month — without an exam deadline.*

## What it does

Creates lightweight, flexible study plans for general review and catch-up — no exam required. Unlike the `exam` skill which builds day-by-day countdowns to a specific test date, this skill focuses on distributing weak topics across available time using spaced repetition logic.

**Use when:**
- No exam in sight but student wants to review
- Catching up on missed material
- Building a weekly study routine
- Spaced review of previously covered topics

## How it works

### Step 1 — Assess what needs review
Pull the student's weakest areas:
```
API: GET /api/learn/wrong-answers/tags
→ Returns concept tags ranked by mistake count
```

### Step 2 — Check recent study activity
```
API: GET /api/learn/sessions?days=14
→ Returns recent study sessions, total time
```

### Step 3 — Build a plan
Spread weak topics across the week using spaced repetition:
- Monday → Weakest topic (deep review)
- Wednesday → Medium topic (practice)
- Friday → Previous weak topics (spaced review)

### Step 4 — Offer to set reminders
```
API: POST /api/reminders (existing reminder system)
```

## Spaced repetition logic

Use the study-habits spacing pattern:
| Review | When |
|--------|------|
| 1st review | 24 hours after first study |
| 2nd review | 3 days later |
| 3rd review | 1 week later |
| 4th review | 2 weeks later |

Track each topic's last-reviewed date from `/api/learn/sessions`.

## Revision plan response pattern

1. **Name the gap** — "Your weakest areas are [tag1], [tag2], [tag3]"
2. **State the time available** — "You have [X] hours this week to study"
3. **Assign topics to time blocks** — "Monday: [tag1], Wednesday: [tag2]..."
4. **Apply spacing** — "Thursday: review [tag1] since it's been 3 days"
5. **End with today** — "Start with [weakest topic] today for 30 minutes"

## Revision plan types

**Quick catch-up (1-3 days)**
- Focus on 2-3 weakest tags
- 30-45 min per session
- Mix review + practice

**Weekly routine (1 week)**
- Spread across 3-4 days
- Monday: new topic review
- Wednesday: practice + weak tags
- Friday: full review of week's weak areas

**Monthly reset (4 weeks)**
- Full subject review
- 2 sessions per week
- End-of-month self-test

## Operating rules

- Use wrong-answer tags to prioritize — don't guess what needs review
- Make plans realistic — don't overschedule
- Mix active recall (flashcards, quiz) with passive review (reading)
- Always leave one day per week with no structured study (rest)
- For exam prep specifically, redirect to the `exam` skill instead

## Preferred next actions

- "Want me to set reminders for each study block this week?"
- "Let's turn these weak topics into flashcards."
- "I can build a practice quiz from your wrong-answer tags."
- "For a deeper plan tied to a specific exam date, use the /exam skill instead."

## Redirects

| Situation | Use instead |
|-----------|------------|
| Specific exam in N days | `exam` skill |
| Just need to know weak tags | `study-tutor` or `learn-cog` |
| Want to review one topic deeply | `study-tutor` |
| Need a grade forecast | `grade-tracker` |
| General accountability | `study-buddy` |

## Key prompts

| Student says | Agent does |
|-------------|-----------|
| "I missed two weeks of class" | Pull wrong-answer tags → build 2-week catch-up plan |
| "Help me plan my study week" | Check sessions + weak tags → distribute across week |
| "I keep failing [topic]" | Pull wrong answers on that tag → targeted remediation plan |
| "No exam, just want to review" | Build weekly spaced review plan |