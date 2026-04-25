#!/bin/bash
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

echo 'export TZ="Europe/London"' >> "$CLAUDE_ENV_FILE"

if ! grep -q '"Gmail"' "$CLAUDE_PROJECT_DIR/.mcp.json" 2>/dev/null; then
  echo "WARN: Gmail MCP not found in .mcp.json — /daily-briefing will not be able to create drafts." >&2
fi

date -u +"SessionStart hook ran at %Y-%m-%dT%H:%M:%SZ"
