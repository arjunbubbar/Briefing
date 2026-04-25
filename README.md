# Daily Finance Briefing

Scheduled Claude Code session that produces a daily finance briefing every weekday morning at 09:00 Europe/London and creates a Gmail draft.

## Files

- `.claude/commands/daily-briefing.md` — the `/daily-briefing` slash command.
- `.claude/hooks/session-start.sh` — SessionStart hook (sets TZ to Europe/London).
- `.claude/settings.json` — registers the hook and pre-allows tools.
- `.mcp.json` — Gmail MCP server stub (URL filled in via the web UI).

## Setup in Claude Code on the web

1. Link this repo at claude.ai/code.
2. Configure Gmail MCP (one-time OAuth).
3. Schedule `/daily-briefing` daily at 09:00 Europe/London.
