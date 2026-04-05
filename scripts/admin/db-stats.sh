#!/bin/bash
# Admin: Database statistics - row counts
PGPASSWORD=postgres psql -h localhost -U postgres -d studyclaw << 'EOF'
SELECT 'users' AS tbl, COUNT(*) AS rows FROM users
UNION ALL SELECT 'agents', COUNT(*) FROM agents
UNION ALL SELECT 'student_profiles', COUNT(*) FROM student_profiles
UNION ALL SELECT 'user_model_credentials', COUNT(*) FROM user_model_credentials
UNION ALL SELECT 'user_google_tokens', COUNT(*) FROM user_google_tokens
UNION ALL SELECT 'reminders', COUNT(*) FROM reminders
UNION ALL SELECT 'quizzes', COUNT(*) FROM quizzes
UNION ALL SELECT 'flashcards', COUNT(*) FROM flashcards
UNION ALL SELECT 'chat_threads', COUNT(*) FROM chat_threads
UNION ALL SELECT 'chat_messages', COUNT(*) FROM chat_messages
UNION ALL SELECT 'study_events', COUNT(*) FROM study_events
UNION ALL SELECT 'subjects', COUNT(*) FROM subjects
ORDER BY rows DESC;
EOF
