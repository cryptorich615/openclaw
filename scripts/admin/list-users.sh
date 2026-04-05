#!/bin/bash
# Admin: List all users
PGPASSWORD=postgres psql -h localhost -U postgres -d studyclaw << 'EOF'
SELECT 
  u.id::text,
  u.email,
  u.created_at::text AS signup_date,
  CASE WHEN ap.user_id IS NOT NULL THEN 'onboarded' ELSE 'pending' END AS status,
  COALESCE(ap.model_key, '—') AS model,
  COALESCE(ugt.google_email, '—') AS google_connected
FROM users u
LEFT JOIN agent_profiles ap ON u.id = ap.user_id
LEFT JOIN user_google_tokens ugt ON u.id = ugt.user_id
ORDER BY u.created_at DESC
LIMIT 50;
EOF
