#!/bin/bash
# Admin: Recent signups
# Usage: ./admin/recent-signups.sh [limit]
LIMIT=${1:-10}
PGPASSWORD=postgres psql -h localhost -U postgres -d studyclaw << EOF
SELECT u.email, u.created_at::text, CASE WHEN ap.user_id IS NOT NULL THEN '✅' ELSE '❌' END AS onboarded
FROM users u
LEFT JOIN agent_profiles ap ON u.id = ap.user_id
ORDER BY u.created_at DESC
LIMIT $LIMIT;
EOF
