# Setup

## Step 1, get the accounts

You need ChatGPT Pro 5x for Codex, HeyGen Creator, and ElevenLabs Creator. Claude Code is an equal alternative to Codex. Sign in to each account before continuing.

## Step 2, record your ElevenLabs professional voice

Record 30 to 60 minutes of clean audio. Use a quiet room and one microphone. Read naturally. In ElevenLabs, open Voices, choose Add, then choose Professional Voice Clone and follow the guide.

Only clone your own voice. A team member must first give written consent in `brand/consent.md`.

## Step 3, make your HeyGen clone

Record a 2-minute training video. Use a plain background, look at the lens, and read the consent line shown on screen. Follow HeyGen's lighting and framing guide.

Only clone your own face. A team member must first give written consent in `brand/consent.md`.

## Step 4, create the ElevenLabs API key

In ElevenLabs, open Settings, API Keys, then Create. Restrict the key to Text to Speech, Speech to Text, and Sound Effects. Copy `.env.example` to `.env`. Paste the key after `ELEVENLABS_API_KEY=` in `.env`.

Never paste the key into chat or another file.

## Step 5, import your voice into HeyGen

In HeyGen, open Settings, Voices, then Import third-party voice. Paste the ElevenLabs key. Choose Manage, then tick your professional voice.

## Step 6, find your IDs

In ElevenLabs, open My Voices. Copy the ID shown under your voice into `ELEVENLABS_VOICE_ID=` in `.env`.

In HeyGen, open Avatars and choose your clone. Copy the ID from the address bar or details panel into `HEYGEN_AVATAR_ID=` in `.env`.

## Step 7, connect your agent

### Codex app

Open Plugins, choose HeyGen, then Authorize. Open Plugins, choose HyperFrames, then Enable. Open Plugins, add a custom plugin, and paste `https://api.elevenlabs.io/v1/mcp`. Sign in with OAuth when asked. OAuth is the secure sign-in screen, so you do not paste a key into the agent.

The built-in HeyGen and HyperFrames plugins are the normal path in Codex. The project settings are a fallback for the Codex command line tool, which means the text command runner.

### Claude Code

This folder already contains `.mcp.json` with both remote connections. If Claude Code does not pick them up, run:

```sh
claude mcp add --transport http heygen https://mcp.heygen.com/mcp/v1/
claude mcp add --transport http elevenlabs https://api.elevenlabs.io/v1/mcp
```

Inside a Claude Code session, type `/mcp` and sign in. Install HyperFrames once with:

```sh
npm i -g hyperframes
```

## Step 8, run the desk check

Paste the first prompt from `START-HERE.md`. The agent will run `scripts/check-setup.sh` on Mac or read `.env.example` against `.env` on Windows. It will tell you what is connected without showing private values.

> **If something does not connect**
>
> - Not signed in: reopen the plugin or `/mcp`, then finish the sign-in screen.
> - Wrong plan: confirm that HeyGen and ElevenLabs show the Creator plan.
> - Key not restricted correctly: make a new ElevenLabs key with only Text to Speech, Speech to Text, and Sound Effects allowed.
