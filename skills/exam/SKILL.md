---
name: exam
description: Exam preparation, study planning, countdown, and last-minute review for quizzes, tests, and finals
author: StudyClaw Team
version: 2.0.0
triggers:
 - "exam"
 - "test prep"
 - "finals"
 - "quiz coming up"
 - "study plan"
 - "countdown"
 - "cram"
 - "last minute review"
 - "before my test"
---

# Exam Prep

*Don't panic — let's build a plan that actually covers what you need.*

## What it does

Helps students prepare for exams by building personalized study plans that work backward from exam date, prioritizing weak areas, and creating reminders to keep them on track.

**Core capabilities:**
- **Exam plan creation** — Auto-generates a day-by-day study schedule from exam date
- **Priority topics** — Targets weak areas from wrong-answer history
- **Daily study blocks** — Each day has a focus (review, practice, cram) and topics
- **Reminders** — Auto-creates StudyClaw reminders for each study day
- **Countdown** — Know exactly how many days remain and what to do today

## How it works

### 1. Create an exam plan

```
API: POST /api/exam/plans
{
  title: "Biology Final",
  examDate: "2026-04-20",
  subject: "Biology",
  topics: ["cell division", "genetics", "evolution", "ecology", "human body"],
  daysOfReview: 14
}
→ Returns planId, daysRemaining, auto-generated daily schedule,
  priorityTags (from your wrong answers), and a personalized message
```

The schedule is auto-generated:
- First half of days → **deep review** (understand concepts)
- Second half → **practice** (apply what you learned)
- Last 3 days → **cram** (full review + practice questions)

### 2. Check the plan

```
API: GET /api/exam/plans/:id
→ Returns full plan with schedule, priority tags, and today's block

API: GET /api/exam/plans/:id/today
→ Returns today's study block: focus, topics, and weak areas to target
```

### 3. Set reminders

```
API: POST /api/exam/plans/:id/generate-reminders
→ Creates a StudyClaw reminder for each study day at 9am
```

### 4. Get nearest exam

```
API: GET /api/exam/next
→ Returns the closest upcoming exam with days remaining
```

## Exam response pattern

When a student mentions an exam:

1. **Acknowledge + countdown** — "Your Biology final is in 12 days."
2. **Identify weak areas** — pull from wrong-answer tags
3. **State the plan** — "Here's your day-by-day schedule..."
4. **Get commitment** — "Want me to set study reminders for each day?"
5. **Give today** — "Today: focus on [topic]. Here's why..."

## Daily exam workflow

**Each day, before or after study:**
1. Call `GET /api/exam/plans/:id/today`
2. Review today's topics + weak areas from wrong answers
3. Focus study on those topics
4. After studying → call `POST /api/learn/sessions` to log it
5. After quiz/practice → call `POST /api/learn/quiz-attempts` to track score

## Cram plan (3 days or less)

When `daysRemaining <= 3`:
- Day 1 → Review all topics, prioritize weakest 40%
- Day 2 → Practice questions on weakest areas
- Day 3 → Light review + rest

Tell the student: "This is a cram situation. Focus on your weakest areas first — that's where you'll gain the most points."

## Operating rules

- Always use real wrong-answer data to prioritize topics
- If no wrong-answer history exists, spread topics evenly
- Be honest about how much can realistically be covered
- Prioritize understanding over memorizing in early days
- Practice over rereading in later days
- Never let a student panic — give them a concrete plan instead

## Preferred next actions

- "I can build your exam plan right now — what topics do you need to cover?"
- "Want me to set daily study reminders for each day until the exam?"
- "Let's turn your weakest topics into a quiz right now."
- "Today you're supposed to focus on [topic]. Want me to pull your wrong answers for that?"

## Key prompts to handle

| Student says | Agent response |
|-------------|----------------|
| "I have an exam in X days" | Create plan, show countdown, offer reminders |
| "What should I study today?" | Check today's block from active plan |
| "I'm panicking" | Calm down, give countdown + concrete plan |
| "I don't know where to start" | Pull weakest tags, build plan |
| "I have 3 days left" | Switch to cram mode, prioritize weakest areas |