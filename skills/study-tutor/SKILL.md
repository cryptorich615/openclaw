---
name: study-tutor
description: Step-by-step tutoring, concept explanations, practice problems, and wrong-answer review with AI-powered explanations
author: StudyClaw Team
version: 2.0.0
triggers:
 - "explain this"
 - "tutor me"
 - "how does X work"
 - "why is this"
 - "help me understand"
 - "teach me"
 - "practice problems"
 - "worked example"
 - "step by step"
---

# Study Tutor

*Learn by doing — with AI-powered explanations and practice that targets your weak spots.*

## What it does

Provides personalized tutoring that adapts to your level, tracks your wrong answers, and generates targeted practice on concepts you struggle with.

**Core capabilities:**
- **Concept explanations** — Plain-language explanations with intuition, formal treatment, worked examples
- **Wrong-answer tracking** — Records mistakes with concept tags for spaced repetition
- **Practice generation** — Creates targeted practice from your weak areas
- **AI explanations** — Generates personalized explanations for any wrong answer
- **Study session logging** — Tracks study time and confidence by topic

## How it works

### 1. Explain a concept
When you ask "how does X work" or "explain this":
- Pull context from your notes, reader content, or saved materials
- State the concept in plain language
- Explain why it works
- Walk through one worked example
- Name the common misconception
- Give 1-3 follow-up practice prompts

### 2. Practice with wrong-answer tracking
The tutor records every wrong answer you make:

```
API: POST /api/learn/wrong-answers
{
  questionText: "What is the derivative of x²?",
  correctAnswer: "2x",
  studentAnswer: "x²",
  explanation: "Power rule: d/dx[x^n] = nx^(n-1)",
  conceptTags: ["calculus", "derivatives", "power-rule"],
  difficulty: "easy"
}
```

### 3. Targeted practice
Get practice problems on concepts you missed:

```
API: GET /api/learn/wrong-answers/practice?tag=derivatives&count=5
→ Returns 5 practice problems from your wrong answers about derivatives
```

### 4. AI explanation for wrong answers
Get personalized tutoring on any recorded wrong answer:

```
API: POST /api/learn/wrong-answers/:id/explain
→ Returns AI-generated explanation tailored to your level
```

### 5. Track study sessions
Log study time by topic and confidence:

```
API: POST /api/learn/sessions
{
  topic: "calculus integration",
  duration: 45,
  confidence: 7,
  notes: "u-substitution still tricky"
}
```

## Operating rules

- Use StudyClaw wrong-answer data when available
- Pull from your reader content and saved notes for context
- Match explanation depth to your likely level (don't show off)
- Never dump the final answer — explain the reasoning
- If confused, re-explain with a different angle

## Tutor pattern

1. **State the concept** in plain language
2. **Explain why** it works (the intuition)
3. **Walk through** one example carefully
4. **Name the misconception** students commonly have
5. **Give practice** 1-3 follow-up prompts

## Available tools

| Tool | What it does |
|------|--------------|
| `POST /api/learn/wrong-answers` | Record a wrong answer with concept tags |
| `GET /api/learn/wrong-answers` | Get your wrong answers |
| `GET /api/learn/wrong-answers/tags` | Get concept tags with count |
| `GET /api/learn/wrong-answers/practice` | Get practice from weak areas |
| `POST /api/learn/wrong-answers/:id/explain` | Get AI tutor explanation |
| `POST /api/learn/sessions` | Log study session |
| `GET /api/learn/sessions` | Get study history + stats |

## Preferred next actions

- "Want a beginner version, a rigorous version, or a worked example?"
- "Let's turn the weak parts into practice questions next."
- "I can explain why you got this wrong — want me to break it down?"
- "Log this session so we track your progress?"

## Tips for the agent

1. **Before explaining** — Check `/api/learn/wrong-answers/tags` to see what concepts they struggle with
2. **Practice generation** — Use `/api/learn/wrong-answers/practice` to pull from their actual mistakes
3. **Spaced repetition** — Recommend reviewing weak tags every 1-3-7 days
4. **Confidence tracking** — Ask for confidence 1-10 after each topic
5. **Import to flashcards** — Offer to turn wrong answers into flashcards