# Setup

## Step 1, install the three free helpers (installation check only)

Do this whether you use Codex or Claude Code. You need Node.js 22 or newer, ffmpeg, and HyperFrames.

### Mac

Download Node.js 22 or newer from [nodejs.org](https://nodejs.org/) and run the installer. Success looks like: the installer says the installation completed successfully.

Open [brew.sh](https://brew.sh/) in your web browser and copy the Homebrew installation line shown there. Open the Terminal app on Mac, paste that line, and press Enter. When it finishes, Terminal shows two or three lines that begin with the words Next steps. Paste each of those lines and press Enter.

Then paste this line and press Enter:

```sh
brew --version
```

Success looks like: Terminal prints `Homebrew` followed by a version number.

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

This is an installation check only. Run `node --version`, `ffmpeg -version`, and `hyperframes --version`. Success looks like: each prints a version number, with Node.js at 22 or newer. The real desk check comes after the accounts and connections are ready.

## Step 2, get the accounts

You need ChatGPT Pro 5x for Codex, HeyGen Creator, and ElevenLabs Creator. Claude Code is an equal alternative to Codex. Sign in to each account before continuing.

## Step 3, record your ElevenLabs professional voice

Record 30 to 60 minutes of clean audio. Use a quiet room and one microphone. Read naturally. In ElevenLabs, open Voices, choose Add, then choose Professional Voice Clone and follow the guide.

How you know it is ready: ElevenLabs shows the voice under My Voices with no Processing label.

Only clone your own voice. A team member must first give written consent in `brand/consent.md`.

## Step 4, make your HeyGen clone

Record a 2-minute training video. Use a plain background, look at the lens, and read the consent line shown on screen. Follow HeyGen's lighting and framing guide.

How you know it is ready: HeyGen shows the avatar with no Processing label and lets you preview it.

Only clone your own face. A team member must first give written consent in `brand/consent.md`.

## Step 5, create the ElevenLabs API key

In ElevenLabs, open Settings, API Keys, then Create. Tick these permissions: Text to Speech, Speech to Text, Sound Effects, and Voices (read). Keep the key private for the next step.

Never paste the key into chat or another file.

## Step 6, Create your private settings file

### Mac

In the Codex app, in this folder, say: copy .env.example to .env and open it for me. Or in Finder press Command, Shift and period together to show hidden files, then duplicate .env.example and rename the copy to .env.

### Windows

In File Explorer, turn on file name extensions, copy `.env.example` in this folder, and name the copy `.env`. Open the copy in Notepad.

Fill in this checklist in your private `.env` file, then save it. Do not paste these values into chat.

- [ ] Required: `ELEVENLABS_API_KEY`, the private key from Step 5.
- [ ] Required: `ELEVENLABS_VOICE_ID`, your ready voice's ID. Step 8 shows where to find it.
- [ ] Required: `HEYGEN_AVATAR_ID`, your ready avatar's ID. Step 8 shows where to find it.
- [ ] Required: `BRAND_NAME`, your business name. The sample run may use `BRAND_NAME=Sunrise Family Bakery`.
- [ ] Optional: `HEYGEN_API_KEY`. Leave blank when signing in through the plugin.
- [ ] Preset: `DEFAULT_OUTPUT_SIZES=16:9,9:16`. Keep this for wide and vertical videos.
- [ ] Preset: `TEST_CLIP_SECONDS=10`. Keep this for the short first test.

## Step 7, import your voice into HeyGen

In HeyGen, open Settings, Voices, then Import third-party voice. Paste the ElevenLabs key. Choose Manage, then tick your professional voice.

Importing your voice hands HeyGen the restricted key. The key was restricted to Text to Speech, Speech to Text, Sound Effects, and Voices (read) on purpose, so it does not grant broader access. You can revoke it at any time in ElevenLabs under API Keys and make a new one.

## Step 8, find your IDs

In ElevenLabs, open My Voices. Copy the ID shown under your voice into `ELEVENLABS_VOICE_ID=` in `.env`.

In HeyGen, open Avatars and choose your clone. Copy the ID from the address bar or details panel into `HEYGEN_AVATAR_ID=` in `.env`.

The API key is secret. The voice ID and avatar ID are not secrets, but keep them in `.env` instead of shared files.

## Step 9, connect your agent

### Codex app

For HeyGen: open Plugins, find or add HeyGen, and click Authorize or Enable. Finish the sign in in the browser, come back to Codex, and start a NEW chat. Plugins load into new chats only. Success looks like: HeyGen appears in the chat's tool list. Ask "what tools do you have from HeyGen" and it lists them.

For HyperFrames: open Plugins, find or add HyperFrames, and click Authorize or Enable. Finish the sign in in the browser if prompted, come back to Codex, and start a NEW chat. Plugins load into new chats only. Success looks like: HyperFrames appears in the chat's tool list. Ask "what tools do you have from HyperFrames" and it lists them.

For ElevenLabs: open Plugins, choose Add custom, paste `https://api.elevenlabs.io/v1/mcp`, choose OAuth, click Save, then Authorize. Finish the sign in in the browser, come back to Codex, and start a NEW chat. Plugins load into new chats only. Success looks like: ElevenLabs appears in the chat's tool list. Ask "what tools do you have from ElevenLabs" and it lists them. OAuth is the secure sign-in screen, so you do not paste a key into the agent.

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

## Step 10, run the desk check

Paste the first prompt from `START-HERE.md`. The agent will run `bash scripts/check-setup.sh` on Mac or `scripts/check-setup.ps1` in PowerShell on Windows. It will check the local helpers and test the live connections without showing private values.

> **If something does not connect**
>
> - Not signed in: reopen the plugin or type `/mcp` inside Claude Code, press Enter, and finish the sign-in screen.
> - Wrong plan: confirm that HeyGen and ElevenLabs show the Creator plan.
> - Key not restricted correctly: make a new ElevenLabs key with Text to Speech, Speech to Text, Sound Effects, and Voices (read) allowed.
