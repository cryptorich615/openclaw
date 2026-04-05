#!/bin/bash
# Admin: Users who never completed onboarding
PGPASSWORD=postgres psql -h localhost -U postgres -d studyclaw << 'EOF'
SELECT u.id::text, u.email, u.created_at::text AS signup_date
FROM users u
LEFT JOIN agent_profiles ap ON u.id = ap.user_id
WHERE ap.user_id IS NULL
ORDER BY u.created_at ASC;
EOF
