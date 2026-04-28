# Daily Finance Briefing

Scheduled Claude Code session that produces a daily finance briefing every weekday morning at 09:00 Europe/London. The briefing HTML is committed to `briefings/` and a GitHub Actions workflow emails it to arjunbubbar@gmail.com.

## How it works

1. **09:00 London, weekdays** — claude.ai/code runs `/daily-briefing`.
2. The skill researches the markets, writes `briefings/YYYY-MM-DD.html`, commits and pushes.
3. The push triggers `.github/workflows/email-briefing.yml`, which emails the file via Gmail SMTP.

## Files

- `.claude/commands/daily-briefing.md` — the `/daily-briefing` slash command.
- `.claude/hooks/session-start.sh` — SessionStart hook (sets TZ to Europe/London).
- `.claude/settings.json` — registers the hook and pre-allows tools.
- `.github/workflows/email-briefing.yml` — emails the latest briefing on push.
- `briefings/` — generated HTML briefings.

## One-time setup

1. **Generate a Gmail App Password** at https://myaccount.google.com/apppasswords (2FA must be on).
2. **Add repo secrets** (Settings → Secrets and variables → Actions):
   - `MAIL_USERNAME` — your Gmail address (the sender).
   - `MAIL_PASSWORD` — the 16-character App Password.
3. **Schedule `/daily-briefing`** at claude.ai/code: weekdays, 09:00 Europe/London.
