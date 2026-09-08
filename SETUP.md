# Setup

## Step 1, install the three free helpers

Do this whether you use Codex or Claude Code. You need Node.js 22 or newer, ffmpeg, and HyperFrames.

### Mac

Download Node.js 22 or newer from [nodejs.org](https://nodejs.org/) and run the installer. Success looks like: the installer says the installation completed successfully.

Open [brew.sh](https://brew.sh/) in your web browser and copy the Homebrew installation line shown there. Open the Terminal app on Mac, paste that line, and press Enter. Success looks like: Terminal says the installation was successful and shows the next steps.

Open the Terminal app on Mac, paste this line, and press Enter:

```sh
brew install ffmpeg
```

Success looks like: Terminal finishes without an error and shows that ffmpeg was installed.

Open the Terminal app on Mac, paste this line, and press Enter:

```sh
npm install -g hyperframes
```

Success looks like: Terminal finishes without an error and reports that a package was added or changed.

### Windows

Download Node.js 22 or newer from [nodejs.org](https://nodejs.org/) and run the installer. Success looks like: the installer says the installation completed successfully.

Open PowerShell on Windows, paste this line, and press Enter:

```powershell
winget install Gyan.FFmpeg
```

Success looks like: PowerShell says ffmpeg was successfully installed.

Open PowerShell on Windows, paste this line, and press Enter:

```powershell
npm install -g hyperframes
```

Success looks like: PowerShell finishes without an error and reports that a package was added or changed.

Run the desk check to confirm that all three helpers are ready.

## Step 2, get the accounts

You need ChatGPT Pro 5x for Codex, HeyGen Creator, and ElevenLabs Creator. Claude Code is an equal alternative to Codex. Sign in to each account before continuing.

## Step 3, record your ElevenLabs professional voice

Record 30 to 60 minutes of clean audio. Use a quiet room and one microphone. Read naturally. In ElevenLabs, open Voices, choose Add, then choose Professional Voice Clone and follow the guide.

Only clone your own voice. A team member must first give written consent in `brand/consent.md`.

## Step 4, make your HeyGen clone

Record a 2-minute training video. Use a plain background, look at the lens, and read the consent line shown on screen. Follow HeyGen's lighting and framing guide.

Only clone your own face. A team member must first give written consent in `brand/consent.md`.

## Step 5, create the ElevenLabs API key

In ElevenLabs, open Settings, API Keys, then Create. Restrict the key to Text to Speech, Speech to Text, and Sound Effects. Copy `.env.example` to `.env`. Paste the key after `ELEVENLABS_API_KEY=` in `.env`.

Never paste the key into chat or another file.

## Step 6, import your voice into HeyGen

In HeyGen, open Settings, Voices, then Import third-party voice. Paste the ElevenLabs key. Choose Manage, then tick your professional voice.

Importing your voice hands HeyGen the restricted key. The key was restricted to speech, transcription, and sound effects on purpose, so it does not grant broader access. You can revoke it at any time in ElevenLabs under API Keys and make a new one.

## Step 7, find your IDs

In ElevenLabs, open My Voices. Copy the ID shown under your voice into `ELEVENLABS_VOICE_ID=` in `.env`.

In HeyGen, open Avatars and choose your clone. Copy the ID from the address bar or details panel into `HEYGEN_AVATAR_ID=` in `.env`.

The API key is secret. The voice ID and avatar ID are not secrets, but keep them in `.env` instead of shared files.

## Step 8, connect your agent

### Codex app

Open Plugins, choose HeyGen, then Authorize. Open Plugins, choose HyperFrames, then Enable. Open Plugins, add a custom plugin, and paste `https://api.elevenlabs.io/v1/mcp`. Sign in with OAuth when asked. OAuth is the secure sign-in screen, so you do not paste a key into the agent.

The built-in HeyGen and HyperFrames plugins are the normal path in Codex. This folder also includes settings that help the Codex command runner find the same connections.

### Claude Code

A small settings file in this folder already tells Claude Code where HeyGen and ElevenLabs live. If Claude Code does not show HeyGen and ElevenLabs after you open the folder, paste these two lines into the Terminal app, one at a time.

Open the Terminal app on Mac, paste this first line, and press Enter:

```sh
claude mcp add --transport http heygen https://mcp.heygen.com/mcp/v1/
```

Success looks like: Terminal confirms that the HeyGen connection was added.

Open the Terminal app on Mac, paste this second line, and press Enter:

```sh
claude mcp add --transport http elevenlabs https://api.elevenlabs.io/v1/mcp
```

Success looks like: Terminal confirms that the ElevenLabs connection was added.

On Windows, open PowerShell, paste this first line, and press Enter:

```powershell
claude mcp add --transport http heygen https://mcp.heygen.com/mcp/v1/
```

Success looks like: PowerShell confirms that the HeyGen connection was added.

Open PowerShell on Windows, paste this second line, and press Enter:

```powershell
claude mcp add --transport http elevenlabs https://api.elevenlabs.io/v1/mcp
```

Success looks like: PowerShell confirms that the ElevenLabs connection was added.

Type `/mcp` inside Claude Code and press Enter to sign in. Success looks like: Claude Code shows HeyGen and ElevenLabs as connected.

## Step 9, run the desk check

Paste the first prompt from `START-HERE.md`. The agent will run `bash scripts/check-setup.sh` on Mac or `scripts/check-setup.ps1` in PowerShell on Windows. It will check the local helpers and test the live connections without showing private values.

> **If something does not connect**
>
> - Not signed in: reopen the plugin or type `/mcp` inside Claude Code, press Enter, and finish the sign-in screen.
> - Wrong plan: confirm that HeyGen and ElevenLabs show the Creator plan.
> - Key not restricted correctly: make a new ElevenLabs key with only Text to Speech, Speech to Text, and Sound Effects allowed.
