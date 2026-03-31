#!/bin/bash
# Agent Checkpoint Script
# Usage: ./checkpoint.sh "Current task" "Next step"

TASK_FILE="./active-task.md"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

if [ -z "$1" ]; then
    echo "Usage: $0 <current_task> <next_step>"
    exit 1
fi

TASK="$1"
NEXT="$2"

cat > "$TASK_FILE" << EOF
# Active Task

## Status: IN_PROGRESS
## Last Updated: $TIMESTAMP

## Task
$TASK

## Next Step
$NEXT

## Checkpoints
EOF

echo "✅ Checkpoint saved to $TASK_FILE"
