---
description: Produce the Daily Finance Briefing and commit it to the repo (GitHub Actions emails it)
allowed-tools: WebSearch, WebFetch, Bash, Write
---

Produce a Daily Finance Briefing for today. UK local times. ~800 words. Declarative prose.

Use web search (max 6 searches). Only cite: FT, Reuters, Bloomberg, WSJ, CNBC, BBC Business, ONS, BLS, Bank of England, Federal Reserve, major asset managers.

All data must be from today's session or the most recent market close. State the timestamp ("as of [time] BST" or "[date] close") next to each price. If a search returns data older than 24h, run another search with "today" or today's date in the query. Reject stale snippets. Headlines must be from the last 24 hours.

If today is a weekend or UK bank holiday, use the most recent prior trading session and label the briefing accordingly.

Cover: FTSE 100/250, GBP/USD, UK 10Y gilt, Bank Rate, S&P 500, Nasdaq 100, US 10Y, DXY, Fed funds, Euro Stoxx 50, Nikkei 225, VIX, Brent, gold, copper, TTF gas, 4-5 headlines, macro prints today, one asset manager note, one stock deep dive.

Body must be HTML with inline CSS. Structure:

1. Title header with today's date
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

Footer: "Informational only. Not financial advice."

## Delivery

After producing the HTML body:

1. Write the file to `briefings/YYYY-MM-DD.html` (UK date).
2. Stage, commit and push:
   ```
   git add briefings/YYYY-MM-DD.html
   git commit -m "briefing: YYYY-MM-DD"
   git push origin HEAD
   ```
3. The `email-briefing` GitHub Actions workflow will pick up the new file and email it to arjunbubbar@gmail.com automatically. Do NOT attempt to send email yourself.
