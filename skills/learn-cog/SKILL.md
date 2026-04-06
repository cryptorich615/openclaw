---
name: learn-cog
description: Deep teaching with multiple explanations, analogies, first-principles reasoning, and multi-angle concept mastery
author: StudyClaw Team
version: 2.0.0
triggers:
 - "explain deeper"
 - "why does this work"
 - "first principles"
 - "teach me properly"
 - "I don't get it"
 - "re-explain"
 - "multiple explanations"
 - "teach me like I'm 5"
 - "analogies"
 - "intuition"
---

# Learn Cog

*Understand it properly — the first time.*

## What it does

Teaches concepts deeply by approaching them from multiple angles simultaneously. Where the regular tutor gives one explanation, Learn Cog gives three: plain, rigorous, and intuitive.

**Teaching modes:**

| Mode | What it does |
|------|-------------|
| **Intuitive** | Analogy + visual explanation — "imagine it like..." |
| **Rigorous** | Formal definition + formula + edge cases |
| **Practical** | Worked example with step-by-step math |
| **Beginner** | Simple analogy, no jargon |
| **Advanced** | First principles, proofs, edge cases |

## The Learn Cog pattern

For every concept, teach it in exactly this order:

### 1. The One-Line Definition
Start with a single sentence anyone could understand.

### 2. The Analogy
Paint a picture. "It's like when you..." or "Imagine X is a..."

### 3. The Plain Explanation
Explain in simple words, no jargon. Then immediately follow with the real terminology.

### 4. The Formal Treatment
The real definition, formula, or algorithm. Show the notation.

### 5. The Worked Example
Take a real number, apply the concept step by step. Show every step.

### 6. The Intuition
Why does this exist? What problem does it solve? What would break if it weren't true?

### 7. Common Misconceptions
What do students usually get wrong? What's the most common mistake?

### 8. Connections
What does this build on? What does it lead to?

## Asking the right question

Detect the student's level from context:

```
Level 1 (Elementary) → "like I'm 10" → simple analogy + no jargon
Level 2 (High School) → "normal" → plain + analogy + basic formula
Level 3 (University) → "rigorous" → formal + proof + edge cases
Level 4 (Graduate) → "first principles" → full theory + original papers
```

## Wrong answer → Deep re-explanation

When a student gets something wrong:

```
API: POST /api/learn/wrong-answers/:id/explain
→ Pull the stored wrong answer + context

Then re-explain using ALL 3 modes:
1. Intuitive: "The mistake was thinking X. Think of it like Y..."
2. Rigorous: "Here's the formal rule — and here's why it applies..."
3. Practical: "Let's walk through the exact problem you missed step by step..."
```

## Example sessions

### Simple concept (derivative)
```
Student: "I don't get derivatives"

Agent:
> DEFINITION: A derivative measures how fast something changes at any exact moment.
> 
> ANALOGY: Imagine driving. Your speedometer doesn't tell you your average speed 
> across the whole trip — it tells you exactly how fast you're going right now. 
> That's a derivative — the rate of change at an instant.
>
> PLAIN: When you take the derivative of a function, you're finding another 
> function that tells you the slope (steepness) at any point.
>
> FORMAL: f'(x) = lim(h→0) [f(x+h) - f(x)] / h
>
> EXAMPLE: f(x) = x² → f'(x) = 2x
> At x=3: slope is 6. At x=5: slope is 10.
>
> MISCONCEPTION: Students think derivatives always get smaller. 
> Actually x² gets steeper as x increases — the derivative 2x keeps growing.
>
> CONNECTION: Integrals are the reverse of derivatives. 
> Derivatives are about rates of change. Integrals are about accumulation.
```

### Abstract concept (natural selection)
```
Student: "Explain natural selection like I'm 5"
Agent: 
> Imagine 100 rabbits living in a snowy field. Most are white, but 3 are brown.
> A fox comes hunting. He sees the brown rabbits easily — they stand out!
> Over time, the brown rabbits get eaten more often, while white rabbits survive 
> and have more white babies. Eventually, almost all the rabbits are white.
> That's natural selection — traits that help survival get passed down.
```

## When to use Learn Cog

- Student says "I don't get it" or "this doesn't make sense"
- Student keeps making the same mistake
- Concept is abstract or mathematical
- Student asks "why does this work" not just "what is this"
- Regular explanation didn't land

## Operating rules

- Never skip the analogy — it's often what makes it click
- Match the level: don't prove things to someone who needs an analogy
- Always show a worked example with real numbers
- Call out the misconception directly — students appreciate honesty
- If you don't know the level, ask: "Want the simple version or the rigorous one?"

## Preferred next actions

- "Want the rigorous version or the simple analogy first?"
- "I can explain this another way if that didn't click."
- "Let me break this down with a worked example..."
- "Want me to turn this into practice questions at three difficulty levels?"

## Teaching modes

When the student is confused, offer:
- "Simple analogy version" — intuitive first
- "Rigor first" — formal definition before analogy
- "Example first" — start with the worked problem, then explain why it works