---
name: study-library
description: Find textbooks, books by subject/title/author/ISBN, reading lists, and book-based research via Open Library
author: StudyClaw Team
version: 2.0.0
triggers:
 - "find a book"
 - "textbook"
 - "search books"
 - "book by ISBN"
 - "open library"
 - "read online"
 - "borrow book"
 - "textbook alternative"
 - "easier version"
 - "compare editions"
---

# Study Library

*Find the right book for the job — not just any book.*

## What it does

Uses Open Library to search for textbooks, books by subject, title, author, or ISBN. Gives students practical recommendations with cover images, edition info, and clear guidance on whether the book is readable online or needs to be found elsewhere.

**Core tools:**
- `openlibrary_search_books` — keyword, title, author, subject, ISBN search
- `openlibrary_get_subject_books` — subject-area browse (biology, algebra, history...)
- `openlibrary_get_book_details` — full metadata for a selected book
- `openlibrary_get_cover_url` — cover image URL for display
- `openlibrary_search_inside_book` — search inside a specific book

## Primary workflow

1. **Search** → start with `openlibrary_search_books` for title/author/keyword
2. **Browse** → use `openlibrary_get_subject_books` for class subjects
3. **Select** → use `openlibrary_get_book_details` on the best match
4. **Display** → use `openlibrary_get_cover_url` for cover image
5. **Decide** → recommend or offer alternatives

## Search patterns

**By title:**
```
User: "Find me a textbook for AP Biology"
→ openlibrary_search_books with q="AP Biology"
→ openlibrary_get_subject_books for "biology"
```

**By author:**
```
User: "Books by Richard Feynman"
→ openlibrary_search_books with author="Richard Feynman"
```

**By ISBN:**
```
User: "What's this book: 9780134093413"
→ openlibrary_search_books with isbn="9780134093413"
```

**By subject:**
```
User: "Show me economics textbooks"
→ openlibrary_get_subject_books for "economics"
```

## Response format

For each book recommendation:
```
Title: [title] by [author]
Edition: [edition] ([year])
Why it's useful: [one line on what student gets from it]
Read online: [Yes/Partial/No — be honest about access]
Cover: [image URL if available]
```

Give **1 best match + 2-3 alternatives** (easier/harder, free/cheaper).

## Handling access limitations

OpenLibrary access varies by book:
- **Full preview / borrow** → say "Available to read online" (use `openlibrary_search_inside_book` if identifiers are available)
- **Snippet only** → say "Limited preview — consider finding the full text through your library or bookstore"
- **No preview** → say "No preview available — here's where to find it: [options]"
- **503 error (API down)** → use web search to find the book, then give honest guidance

Never claim a book is fully readable online if it isn't. Say "I can't confirm full access — here are other ways to get it."

## Common requests

**Easier alternative:**
```
User: "This textbook is too hard"
→ Search for the subject + "beginner" or "introduction"
→ Give 2-3 lower-level alternatives
```

**Compare editions:**
```
User: "Is the 7th edition worth upgrading from the 5th?"
→ Get details on both via openlibrary_get_book_details
→ Compare publication years and content scope
→ Recommend upgrade only if the changes are significant
```

**Find a free version:**
```
User: "Is there a free version?"
→ Search for the book
→ If no free access, suggest: library, older edition (cheaper), or alternative free textbook
```

## When Open Library fails

If Open Library returns a 503 or empty results:
1. Try the search again once
2. If still failing, use web search to find the book title/author
3. Give the student what you found via web search
4. Note: "Open Library is having issues — I found this via web search"

## Preferred next actions

- "Want me to compare this with an easier textbook?"
- "I can search inside this book for a specific topic."
- "Let's turn the key chapters into flashcards."
- "This book has limited preview — here are your options to access the full text."

## Tips

1. Always check the edition year — older editions are often much cheaper and nearly identical
2. If a book isn't available, always suggest the library + older edition combo
3. For dense textbooks, suggest a "companion" or "workbook" as an easier alternative
4. When searching by subject, try broader terms first (e.g. "biology" before "AP Biology")