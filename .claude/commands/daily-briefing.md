---
description: Produce the Daily Finance Briefing and commit it to the repo (GitHub Actions emails it)
allowed-tools: WebSearch, WebFetch, Bash, Write, Edit
---

Produce a Daily Finance Briefing for today. UK local times. The deliverable is a single HTML file in `briefings/`. Skip any chat-output prose — write directly to the file.

Use web search (max 6 searches). Only cite: FT, Reuters, Bloomberg, WSJ, CNBC, BBC Business, ONS, BLS, Bank of England, Federal Reserve, major asset managers.

All data must be from today's session or the most recent market close. State the timestamp ("as of [time] BST" or "[date] close") next to each price. If a search returns data older than 24h, run another search with "today" or today's date in the query. Reject stale snippets. Headlines must be from the last 24 hours.

If today is a weekend or UK bank holiday, use the most recent prior trading session and label the briefing accordingly.

Cover: FTSE 100/250, GBP/USD, UK 10Y gilt, Bank Rate, S&P 500, Nasdaq 100, US 10Y, DXY, Fed funds, Euro Stoxx 50, Nikkei 225, VIX, Brent, gold, copper, TTF gas, 4-5 headlines, macro prints today, one asset manager note, one stock deep dive.

HTML email body sections:

1. Title header with today's date (in skeleton — already written).
2. MARKET SNAPSHOT — HTML table: Asset | Level | Change | %. Bold headers, alternating row colors (#f5f5f5 / white). Flag >2% moves with ⚠. Include all 16 assets. Add a small "as of" timestamp under the table.
3. WHAT MOVED AND WHY — HTML table: Move | Catalyst | Source. 3-4 rows. All from last 24h.
4. GLOBAL HEADLINES — HTML table: Headline | Category | Source. 4-5 rows, last 24h only. Categories: Macro / Central Bank / Geopolitics / Corporate.
5. DATA & CENTRAL BANKS — HTML table: Indicator | Actual | Consensus | Prior. Only today's prints.
6. RATES & INFLATION PULSE — 2-3 lines of prose, current pricing.
7. ASSET MANAGEMENT INSIGHT — 1 bullet, firm + author named, published in last 24h.
8. STOCK DEEP DIVE (one US + one UK) — BULL CASE (~300 words): pick a stock in today's news. One-liner, HTML key-stats table (Price / Market Cap / Fwd P/E / Dividend Yield), 4 numbered bull points with sources, why now, 2 risks, 1-line bear.
9. GLOSSARY — 2-3 terms, plain English, rotate daily.
10. SOURCES — numbered list of URLs.

Use clean sans-serif (font-family: Arial, sans-serif). Tables: border-collapse: collapse; cellpadding 8px; thin borders (#ddd). Headers: background #222, white text.

## Delivery — chunked write (avoids stream-idle timeout)

Build the file incrementally. Each tool call must stay short.

**Step 1: Write the skeleton.** Use `Write` to create `briefings/YYYY-MM-DD.html` (UK date) with this exact content, replacing `{{DATE}}` with today's UK date in long form (e.g. "Tuesday, 28 April 2026"):

```html
<!DOCTYPE html>
<html>
<body style="font-family: Arial, sans-serif; color: #222; max-width: 820px; margin: 0 auto; padding: 16px;">
<h1 style="font-size: 22px; border-bottom: 3px solid #222; padding-bottom: 8px;">Daily Finance Briefing — {{DATE}}</h1>
<!-- BODY -->
<p style="font-size: 11px; color: #666; border-top:1px solid #ddd; padding-top:8px; margin-top:24px;">Informational only. Not financial advice.</p>
</body>
</html>
```

**Step 2-6: Inject sections via `Edit`.** Each Edit replaces the `<!-- BODY -->` marker with new content followed by the marker (so the marker stays at the bottom for the next Edit). The final Edit removes the marker.

- **Edit 1** — replace `<!-- BODY -->` with: section 2 (Market Snapshot) + `<!-- BODY -->`
- **Edit 2** — replace `<!-- BODY -->` with: sections 3-4 (What Moved + Headlines) + `<!-- BODY -->`
- **Edit 3** — replace `<!-- BODY -->` with: sections 5-7 (Data, Rates Pulse, Asset Manager) + `<!-- BODY -->`
- **Edit 4** — replace `<!-- BODY -->` with: section 8 (Stock Deep Dive) + `<!-- BODY -->`
- **Edit 5** — replace `<!-- BODY -->` with: sections 9-10 (Glossary + Sources). **Do NOT include the marker** — let it disappear.

**Step 7: Commit and push.** Run via `Bash`:

```
git add briefings/YYYY-MM-DD.html
git commit -m "briefing: YYYY-MM-DD"
git push origin HEAD
```

The `email-briefing` GitHub Actions workflow picks up the file and emails arjunbubbar@gmail.com. Do NOT attempt to send email yourself.
