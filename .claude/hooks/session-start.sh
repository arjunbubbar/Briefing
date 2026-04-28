#!/bin/bash
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

echo 'export TZ="Europe/London"' >> "$CLAUDE_ENV_FILE"

date -u +"SessionStart hook ran at %Y-%m-%dT%H:%M:%SZ"
