# AI Video Editor Starter

This starter turns one recording into a month of marketing videos with an AI assistant. It is made for business owners who do not write code. Open it in Codex or Claude Code, follow an assignment, and review the finished drafts.

## What you will need

Start with the accounts you already have. Check the required feature and current usage allowance before buying an upgrade.

- A ChatGPT account with access to Codex. A $100 plan is not a prerequisite. [Current Codex access and limits](https://help.openai.com/en/articles/11369540-using-codex-with-your-chatgpt-plan).
- For an avatar: a HeyGen account that can create or use your own avatar. Check the feature in your account; existing avatars and plan allowances vary.
- For cloned narration: an ElevenLabs account with an available Professional Voice Clone slot, or your own existing verified clone. [Professional cloning requirements](https://elevenlabs.io/docs/eleven-creative/voices/voice-cloning/professional-voice-cloning).
- HyperFrames and ffmpeg for local editing. Setup installs them.
- Node.js 22 or newer. If it is missing, ask your agent to finish the installation steps it can and guide you through any action only you can complete.

You can practice editing an existing recording with its original sound before setting up voice or avatar accounts.

This starter uses HeyGen's signed-in OAuth connection. Leave `HEYGEN_API_KEY` empty. The API-key route has separate billing; check the [current HeyGen connection documentation](https://developers.heygen.com/mcp/overview) instead of relying on old per-minute prices.

Claude Code is a fully supported alternative agent. Its own plan cost is separate.

## Before you start

The rebuilt video course begins with opening the local project and finding its files. Follow its first lesson; another course is not required. If you get stuck, name the app and the step, then ask the agent for one action at a time.

There are no plugins in this course. One command installs every tool and registers every connection.

## Start in five steps

1. Copy this repository's link. In Codex choose Projects, +, Local, Next, name it, click the source-folders area, choose a location, then New Folder. Select the folder and finish with Create project. In its first chat paste the link and "Clone this repo for me into this local folder". Success: the folder fills with files including START-HERE.md. In Claude Code, open a new local folder and paste the same link and prompt. **Use this template** on GitHub is an alternate; then clone your copy locally.
2. In that same chat paste: "Read AGENTS.md, then run the setup for me." One command installs ffmpeg, HyperFrames, the official `elevenlabs` command and your `.env` file, and registers your HeyGen connection. Then do the two things it lists: paste three values into `.env` yourself, and sign in to HeyGen once with `codex mcp login heygen` (in Claude Code, `/mcp`). `SETUP.md` covers the accounts, the voice clone, the avatar clone and the ElevenLabs key.
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
| `scripts/` | The one setup command plus small maintenance checks. |

## Where your videos go

New work always goes to `output/drafts/`. The agent may COPY a draft to `output/approved/` only after the member types the word approved in that session. The draft stays in `output/drafts/`. A person posts it.

## Course

AiAi Mastermind, **Creating Video Content with AI Agents**, "Hire the AI employee that turns one recording a week into a month of video content."

## Never

- Never include a client's or customer's identifying details in any project file.
- Never name an insurance carrier or a company you are contracted with. Say "your carrier" or "the company."
- Never publish, post, upload, or send automatically. Put finished files in `output/drafts/`.
- Never write a key or token anywhere except `.env`, print `.env`, or commit `.env`.
- Never fill in `HEYGEN_API_KEY`. It spends paid API credits instead of the plan credits you already bought.
- Never clone another person's face or voice without their written consent in `brand/consent.md`.
- Never add tools, accounts, or paid services beyond the stated tools without asking first.
- Never waste credits charged per use. Make a 10-second test first and estimate credits before generating more than 60 seconds.
