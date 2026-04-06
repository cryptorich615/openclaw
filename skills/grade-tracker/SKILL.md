---
name: grade-tracker
description: Track grades, calculate weighted averages, set category weights, and predict final exam scores
author: StudyClaw Team
version: 2.0.0
triggers:
 - "my grade"
 - "what's my average"
 - "grades"
 - "weighted grades"
 - "what do I need on the final"
 - "category weights"
 - "GPA"
 - "letter grade"
 - "calculating grades"
---

# Grade Tracker

*Know where you stand — and what you need to get where you want.*

## What it does

Tracks student grades across courses, calculates weighted/unweighted averages, manages category weights (homework, tests, quizzes, projects), and predicts what you need on your final exam to hit a target grade.

**Core features:**
- **Grade entry** — Log individual grades with category and points
- **Course average** — Weighted or unweighted average by course
- **Category breakdown** — See how homework vs. tests vs. quizzes are performing
- **Final exam calculator** — "What do I need on my final to get an A?"
- **Grading scale** — Customizable A-F scale per course

## How it works

### 1. Add a grade

```
API: POST /api/grades/items
{
  courseId: "uuid",
  title: "Chapter 5 Test",
  category: "test",           // homework, quiz, test, exam, project, assignment, participation, other
  pointsEarned: 85,
  pointsPossible: 100,
  occurredOn: "2026-04-01",   // ISO date
  notes: "Lost points on essay questions"
}
```

### 2. View course average

```
API: GET /api/grades/average?courseId=uuid
→ Returns:
{
  average: 87.3,
  letterGrade: "B+",
  totalGrades: 12,
  isWeighted: false,
  categoryBreakdown: {
    homework: { avg: 92, count: 5, weight: 0 },
    test: { avg: 83, count: 3, weight: 0 },
    quiz: { avg: 88, count: 4, weight: 0 }
  }
}
```

### 3. Set category weights (for weighted grading)

```
API: POST /api/grades/settings
{
  courseId: "uuid",
  categoryWeights: {
    homework: 20,
    quiz: 15,
    test: 40,
    exam: 25
  },
  finalExamWeight: 20
}
```

### 4. Final exam calculator

```
API: GET /api/grades/calculator?courseId=uuid&targetGrade=B+
→ Returns what you need on the final to hit B+
```

## Grade categories

| Category | Typical weight |
|----------|---------------|
| homework | 10-20% |
| quiz | 10-15% |
| test | 30-40% |
| exam | 15-25% |
| project | 10-20% |
| assignment | 10-20% |
| participation | 5-10% |

## Answering grade questions

**For course average:**
1. Get average from API
2. Give percent and letter grade
3. Note whether it's weighted or points-based
4. Highlight the biggest strength and weakness

**For "what do I need on final":**
1. Call calculator API
2. Be honest if it's not achievable
3. Give encouragement if it's doable

**For wrong answers:**
1. State correct answer
2. Contrast with their answer
3. Identify the likely misunderstanding
4. Give a short remediation plan

## Operating rules

- Always note when a grade is **estimated** vs. **official**
- Never invent teacher policies or extra credit
- Be honest when data is incomplete — say "add more grades for a reliable estimate"
- If weights aren't set, use simple points-based average
- Flag when a category is dragging the grade down

## Preferred next actions

- "Add the rest of your quiz grades so the estimate gets more reliable."
- "Set the category weights for this class — weighted averages are more accurate."
- "Turn the questions you keep getting wrong into a short quiz."
- "Want me to calculate what you need on your final exam?"

## Key prompts to handle

| Student asks | Agent does |
|-------------|-----------|
| "What's my grade in [class]?" | GET /api/grades/average → give percent + letter |
| "How am I doing overall?" | GET /api/grades/subjects → all courses summarized |
| "Add my test score" | Guide them through POST /api/grades/items |
| "Set my weights" | Guide through POST /api/grades/settings |
| "What do I need on final?" | GET /api/grades/calculator with target grade |
| "Why do I have a C in homework?" | GET /api/grades/items?category=homework → analyze |