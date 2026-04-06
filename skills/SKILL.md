# Google Workspace

Use StudyClaw's connected Google integration for Gmail, Calendar, Drive, Docs, Sheets, and Slides.

## IMPORTANT — Email Sending vs Chat Messaging

**If the student asks to SEND an email:**
- Use `sendGmailMessage(to, subject, body)` for new emails
- Use `replyToGmailMessage(threadId, to, subject, body)` for replies
- Use `createGmailDraft(to, subject, body)` to save a draft
- Use `sendGmailDraft(draftId)` to send a saved draft
- Do NOT use the message/chat tool — that routes to Telegram, not email

**If the student asks to send a CHAT message:**
- Use the message tool (routes to Telegram/Discord/etc.)

**Never confuse the two.**

## What to help with

When the student asks about:
- Google Calendar events, scheduling, or creating events
- recent Google Drive files
- Google Docs, Sheets, or Slides
- Email, Gmail, reading, sending, searching, or drafting emails
- Creating calendar events for study sessions

## Rules

- Treat StudyClaw's Google connection as the source of truth.
- Do not ask the student to authenticate a separate `gog` CLI account.
- If Google is not connected or needs reconnect, tell the student to reconnect Google from the Calendar page.
- If Docs, Sheets, or Slides access is missing, tell the student to reconnect Google so StudyClaw can request the extra workspace permissions.
- Use the student's own Google Workspace context only within their account.
- Prefer direct, practical help: list recent files, identify the right file type, create a study doc when supported, and explain the limitation when a workspace action is not yet available.

## Available Capabilities

**Email (Gmail):**
- `listRecentGmailMessages(maxResults)` — read recent emails
- `searchGmailMessages(query, maxResults)` — search emails with Gmail query syntax (e.g. `from:example.com newer_than:7d subject:homework`)
- `sendGmailMessage(to, subject, body)` — send a new email
- `replyToGmailMessage(threadId, to, subject, body)` — reply to an existing email thread
- `createGmailDraft(to, subject, body)` — create a draft
- `listGmailDrafts()` — list drafts
- `sendGmailDraft(draftId)` — send a draft

**Calendar:**
- `listUpcomingCalendarEvents(maxResults)` — read upcoming events
- `createCalendarEvent(summary, start, end, description?, colorId?)` — create an event
  - colorId: 1-11 (use `gog calendar colors` for reference)

**Drive:**
- `listRecentDriveFiles(pageSize)` — read recent Drive files

**Docs:**
- `createGoogleDoc(title, bodyText)` — create a new Google Doc
- `exportDocs(docId, format)` — export a doc (format: txt, html, pdf)

**Sheets:**
- `readSheets(spreadsheetId, range)` — read cells (e.g. "Sheet1!A1:D10")
- `updateSheets(spreadsheetId, range, values)` — update cells
- `appendSheets(spreadsheetId, range, values)` — append rows

**Email search examples:**
- `"homework"` — emails containing homework
- `"from:teacher@school.edu newer_than:7d"` — recent emails from teacher
- `"in:inbox subject:assignment"` — inbox emails about assignments
- `"has:attachment from:example.com"` — emails with attachments

**Confirm before sending emails or creating calendar events.**

Do not claim you can access a file unless StudyClaw has surfaced that file or capability in context.
