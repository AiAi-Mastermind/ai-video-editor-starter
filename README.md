# AI Video Editor Starter

This starter turns one recording into a month of marketing videos with an AI assistant. It is made for business owners who do not write code. Open it in Codex or Claude Code, follow an assignment, and review the finished drafts.

## What you will need

Prices as of September 2026:

- ChatGPT Pro 5x, $100 per month, for the Codex app.
- HeyGen Creator, $29 per month or $24 per month when paid yearly, for your video clone.
- ElevenLabs Creator, $22 per month, with an $11 first month, for your professional voice clone.

Claude Code is a fully supported alternative agent. Its own plan cost is separate.

## Start in five steps

1. Click **Use this template** on GitHub.
2. Open the folder in Codex or Claude Code.
3. Copy `.env.example` to `.env`, then paste in your private keys and IDs.
4. Tell your agent, "Read AGENTS.md and run the desk check."
5. When setup passes, tell it, "Run assignment 1."

On Mac, make the checks runnable once with `chmod +x scripts/check-setup.sh scripts/sync-skills.sh`.

## Assignments

- Assignment 0, check that your tools and private values are ready.
- Assignment 1, make a clone message with your face, voice, captions, and end card.
- Assignment 2, make a faceless explainer from a topic or page.
- Assignment 3, turn one recording into three vertical shorts.
- Weekly batch, run all three video assignments from one Monday brief.

## Folder map

| Folder | What it holds |
| --- | --- |
| `assignments/` | Ready-to-run video briefs. |
| `brand/` | Your words, colors, style, assets, and consent records. |
| `compliance/` | Safety rules for every video. |
| `input/` | Your source recordings. |
| `output/drafts/` | Videos waiting for a person to review them. |
| `output/approved/` | Files a person has approved. |
| `output/posted/` | A record of files a person has posted. |
| `.agents/skills/` | Instructions Codex discovers by name. |
| `.claude/skills/` | The same instructions for Claude Code. |
| `scripts/` | Small setup and maintenance checks. |

## Where your videos go

New work always goes to `output/drafts/`. Only a person can move a file to `output/approved/`. A person posts it, then may record it in `output/posted/`.

## Course

AiAi Mastermind, **Creating Video Content with AI Agents**, "Hire the AI employee that turns one recording a week into a month of video content."

## Never

- Never include a client's or customer's identifying details in any project file.
- Never name an insurance carrier or a company you are contracted with. Say "your carrier" or "the company."
- Never publish, post, upload, or send automatically. Put finished files in `output/drafts/`.
- Never write a key or token anywhere except `.env`, print `.env`, or commit `.env`.
- Never clone another person's face or voice without their written consent in `brand/consent.md`.
- Never add tools, accounts, or paid services beyond the stated stack without asking first.
- Never waste metered credits. Make a 10-second test first and estimate credits before generating more than 60 seconds.
