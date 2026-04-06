---
name: class-scheduler
description: Quick answers to "what class do I have now?", "when does my next class start?", and today's full class schedule
author: StudyClaw Team
version: 2.0.0
triggers:
 - "what class"
 - "next class"
 - "when does class start"
 - "what do I have today"
 - "schedule"
 - "period"
 - "room number"
 - "teacher"
 - "lunch"
---

# Class Scheduler

*Always know where you need to be — and when.*

## What it does

Answers any question about the student's class schedule. Tells them what class they have right now, what comes next, and what their full day looks like.

**Core capabilities:**
- **Current class** — What's happening right now + time remaining
- **Next class** — What's coming up + minutes until it starts
- **Today's schedule** — Full day breakdown with times, rooms, teachers
- **Week view** — All classes across the week

## How it works

### Current class (right now)

```
API: GET /api/schedule/now
→ Returns inClass, currentClass details, minutesRemaining
```

### Next class

```
API: GET /api/schedule/next
→ Returns next class with minutesUntil, or daysAway if tomorrow
```

### Today's full schedule

```
API: GET /api/schedule/today
→ Returns all classes for today, each with:
  - className, subject, roomNumber, teacherName
  - startTime, endTime
  - status: "in_progress" | "ended" | "upcoming"
  - minutesUntilStart (for upcoming)
  - minutesRemaining (for in_progress)
  + nextClass and currentClass shortcuts
```

### Week view

```
API: GET /api/schedule/week
→ Returns schedule by day (monday–sunday)
```

## Answer patterns

**"What class do I have right now?"**
```
→ GET /api/schedule/now
→ "You have [Class] in [Room] with [Teacher]. 
    [X] minutes left."
→ or "No class right now. Your next class is [Class] in [X] minutes."
```

**"What's my next class?"**
```
→ GET /api/schedule/next
→ "Next up: [Class] with [Teacher] in [Room]. 
    Starts at [time] — that's in [X] minutes."
```

**"What do I have today?"**
```
→ GET /api/schedule/today
→ List each class with time and room
→ Highlight what's happening right now
```

## Adding classes

```
API: POST /api/schedule/entries
{
  className: "AP Biology",
  subject: "Biology",
  roomNumber: "204",
  teacherName: "Mr. Johnson",
  startTime: "09:00",
  endTime: "09:50",
  period: "2nd",
  daysOfWeek: ["monday", "wednesday", "friday"],
  notes: "Lab days are Thursdays"
}
```

## Operating rules

- Always use the schedule API — never guess times or days
- Be specific: give room, teacher, time — not just the class name
- If no schedule is saved, say: "I don't have your schedule yet. Add your classes in Settings → Schedule."
- If it's lunch or a free period, say so directly
- Flag when a class is about to start (within 5 minutes)
- Be honest about partial data — if only some days are set, say so

## Preferred next actions

- "Want me to set a reminder before your next class?"
- "That's your last class of the day — nice work."
- "You have a gap between [Class A] and [Class B]. [X] minutes free."

## Quick reference

| Student asks | API to call |
|-------------|-------------|
| "What class now?" | GET /api/schedule/now |
| "What's next?" | GET /api/schedule/next |
| "My schedule today?" | GET /api/schedule/today |
| "Full week?" | GET /api/schedule/week |
| "Add a class" | POST /api/schedule/entries |