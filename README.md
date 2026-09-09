# AI Video Editor Starter

This starter turns one recording into a month of marketing videos with an AI assistant. It is made for business owners who do not write code. Open it in Codex or Claude Code, follow an assignment, and review the finished drafts.

## What you will need

Prices as of September 2026:

- ChatGPT Pro 5x, $100 per month, for the Codex app.
- HeyGen Creator, $29 per month or $24 per month when paid yearly, for your video clone.
- ElevenLabs Creator, $22 per month, with an $11 first month, for your professional voice clone.

- HyperFrames, a separate free plugin installed from Codex Plugins, plus the free `hyperframes` command for rendering. It is not part of HeyGen.

Claude Code is a fully supported alternative agent. Its own plan cost is separate.

## Before you start

This assumes you can open a folder as a Codex project, start a new chat, find Plugins (bottom left of the sidebar), and see the file pane. If not, watch the Codex setup lesson in Build Your First Agency App first.

## Start in five steps

1. Copy this repository's link. In Codex choose Projects, +, Local, Next, name it, then Create new folder. In its first chat paste the link and "Clone this repo for me into this local folder". Success: the folder fills with files including START-HERE.md. In Claude Code, open a new local folder and paste the same link and prompt. **Use this template** on GitHub is an alternate; then clone your copy locally.
2. Follow `SETUP.md` to install the helpers, set up your accounts, and fill in your private settings.
3. START A NEW CHAT, then paste: "Read AGENTS.md. Then run the desk check and tell me in plain English what is connected and what is not. Do not make any video yet."
4. Paste: "Run assignment 1 with the sample brief."
5. To make the videos yours, paste: "Fill in brand/brand-kit.md from <a file, a folder, or your website address>, ask me only about what is still missing, then run assignment 1." Or paste: "Interview me for the brand kit."

The sample run needs no brand kit of your own. It uses `brand/sample-brand-kit.md`, so nothing needs filling in.

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

New work always goes to `output/drafts/`. The agent may COPY a draft to `output/approved/` only after the member types the word approved in that session. The draft stays in `output/drafts/`. A person posts it.

## Course

AiAi Mastermind, **Creating Video Content with AI Agents**, "Hire the AI employee that turns one recording a week into a month of video content."

## Never

- Never include a client's or customer's identifying details in any project file.
- Never name an insurance carrier or a company you are contracted with. Say "your carrier" or "the company."
- Never publish, post, upload, or send automatically. Put finished files in `output/drafts/`.
- Never write a key or token anywhere except `.env`, print `.env`, or commit `.env`.
- Never clone another person's face or voice without their written consent in `brand/consent.md`.
- Never add tools, accounts, or paid services beyond the stated tools without asking first.
- Never waste credits charged per use. Make a 10-second test first and estimate credits before generating more than 60 seconds.
