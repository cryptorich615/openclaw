#!/bin/bash
# Admin: Reset a user's onboarding
# Usage: ./admin/reset-user.sh <user_id>
if [ -z "$1" ]; then echo "Usage: $0 <user_id>"; exit 1; fi
USER_ID=$1
PGPASSWORD=postgres psql -h localhost -U postgres -d studyclaw << EOF
BEGIN;
DELETE FROM user_model_credentials WHERE user_id = '$USER_ID';
DELETE FROM user_google_tokens WHERE user_id = '$USER_ID';
DELETE FROM agents WHERE user_id = '$USER_ID';
DELETE FROM agent_profiles WHERE user_id = '$USER_ID';
DELETE FROM student_profiles WHERE user_id = '$USER_ID';
SELECT 'User $USER_ID reset - must re-onboard' AS status;
COMMIT;
EOF
