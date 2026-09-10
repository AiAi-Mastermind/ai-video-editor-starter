# Setup

This assumes you can open a folder as a Codex project, start a new chat, and see the file pane. If not, watch the Codex setup lesson in the separate **Build Your First Agency App** course first. That prerequisite is separate from this video-editing course.

There are no plugins in this course. One command installs everything.

A cloned starter folder looks like this. File names are visible; private file contents are not.

<img src="docs/screenshots/starter-folder.png" alt="Starter folder showing assignments, brand files, scripts and START-HERE.md without opening any private file" width="202">

## The short version

1. Get the three accounts.
2. Submit your voice clone and your avatar clone the day before, because both take hours to process.
3. Make one ElevenLabs key.
4. Ask your agent to run the setup command.
5. Paste three values into `.env`.
6. Sign in to HeyGen once.
7. Run the desk check.

## Step 1, get the accounts

You need ChatGPT Pro 5x for Codex, HeyGen Creator, and ElevenLabs Creator. Claude Code is an equal alternative to Codex. Sign in to each account before continuing.

You need Node.js as well. If it is not already on this computer, download version 22 or newer from [nodejs.org](https://nodejs.org/) and run the installer. Success looks like: the installer says the installation completed successfully. Everything else installs itself in Step 5.

## Step 2, record your ElevenLabs professional voice

Record at least 5 minutes of clean audio; 30 minutes is much better. Creator includes one professional clone. Processing takes four to six hours and can take up to half a day, so submit it the day before build day. Use a quiet room and one microphone. Read naturally. In ElevenLabs, open Voices, choose Add, then choose Professional Voice Clone and follow the guide.

How you know it is ready: ElevenLabs shows the voice under My Voices with no Processing label.

Only clone your own voice. A team member must first give written consent in `brand/consent.md`.

## Step 3, make your HeyGen clone

Record a 2-minute training video. Use a plain background, keep your whole face in frame the entire time, look at the lens, and read the consent line shown on screen. HeyGen needs processing time, so do this the day before build day. Follow HeyGen's lighting and framing guide.

How you know it is ready: HeyGen shows the avatar with no Processing label and lets you preview it.

Only clone your own face. A team member must first give written consent in `brand/consent.md`.

## Step 4, create the ElevenLabs API key

This is the only key you will paste anywhere.

In ElevenLabs, open Developers in the left sidebar, then API keys, then Create key. Tick these checkboxes:

- [ ] Text to Speech
- [ ] Speech to Text
- [ ] Sound Effects
- [ ] Music Generation (optional)

In the **Voices row, choose Read**. This is required. Keep the key private for the next step. Never paste it into chat or another shared file.

<img src="docs/screenshots/elevenlabs-voices-read.png" alt="Recorded API permission controls: Voices offers No Access, Read and Write, with No Access still selected" width="480">

Find the Voices row and choose **Read**. This recording frame shows the control **before it is set**; No Access is not the completed setting.

## Step 5, run the setup command

Open the folder in Codex or Claude Code, start a chat, and paste this:

```text
Read AGENTS.md, then run the setup for me.
```

Your agent runs `scripts/bootstrap.sh` (on Windows, `scripts/bootstrap.ps1`). That one script:

- checks Node.js,
- installs ffmpeg, the video helper,
- installs HyperFrames and the instructions your agent reads,
- installs the official `elevenlabs` command,
- creates your private `.env` file from the template without reading it,
- and registers your HeyGen connection with Codex and with this folder.

You can also run it yourself. Open Terminal in this folder and paste:

```sh
bash scripts/bootstrap.sh
```

On Windows, open PowerShell in this folder and paste `scripts/bootstrap.ps1`.

Success looks like: the script prints six numbered steps and finishes with a short list titled "What is left for you to do". That list is normally the two things below. It is safe to run this script again at any time.

There is nothing to click. You do not need the HeyGen plugin, the ElevenLabs plugin, or the HyperFrames plugin. If you installed them for an earlier version of this course, you can leave them; they do no harm.

## Step 6, fill in your private settings

Setup created a file called `.env`. Open it yourself. Do not ask the agent to open it, and do not use the Codex file pane.

- Mac: open this folder in Finder. Press Command, Shift and period together to show hidden files. Right-click `.env`, choose Open With, then TextEdit.
- Windows: open this folder in File Explorer. Under View, turn on File name extensions and Hidden items. Right-click `.env`, choose Open with, then Notepad.

Paste in three values, then save the file. Do not paste these values into chat.

- [ ] `ELEVENLABS_API_KEY`, the private key from Step 4.
- [ ] `ELEVENLABS_VOICE_ID`. In ElevenLabs, open My Voices and copy the ID shown under your voice.
- [ ] `HEYGEN_AVATAR_ID`. In HeyGen, open Avatars, choose your clone, and copy the ID from the address bar or details panel.

Two settings are already filled in for you: `DEFAULT_OUTPUT_SIZES=16:9,9:16` for wide and vertical videos, and `TEST_CLIP_SECONDS=10` for the short first test.

**Leave `HEYGEN_API_KEY` empty.** You do not need it and filling it in costs you money. Your $29 HeyGen plan credits are spent by the signed-in connection from Step 7. A HeyGen API key spends a different, pay-as-you-go balance instead, roughly $1 per minute of video and sold in $5 blocks, and your plan credits would sit unused.

The API key is secret. The voice ID and avatar ID are not secrets, but keep them in `.env` instead of shared files.

`.env` is plain text. It is safe enough for this starter because git ignores it, the agent never prints it, and the key is restricted. Keep the master copy in a password manager such as 1Password and treat `.env` as a working copy. You can make a new key in ElevenLabs and replace it at any time.

Once the key is saved, both the included speech script and the official `elevenlabs` command read it from this folder on their own. You never type the key again.

## Step 7, sign in to HeyGen once

HeyGen is the only tool that asks you to sign in, and it only asks once. Setup already registered the connection; this just proves it is you.

**Codex.** Open Terminal and paste:

```sh
codex mcp login heygen
```

Your browser opens, you approve, and the terminal confirms it. Success looks like: HeyGen tools are listed the next time you start a new chat.

**Claude Code.** Type `/mcp` inside Claude Code and finish the sign-in there. If HeyGen is still missing, quit and reopen the folder.

That sign-in never appears in the chat that was already open. START A NEW CHAT afterwards.

You do not need a HeyGen API key, and you should not make one. If you made one for an earlier version of this course, revoke it in HeyGen.

## Step 8, run the desk check

START A NEW CHAT and paste:

```text
Read AGENTS.md. Then run the desk check and tell me in plain English what is connected and what is not. Do not make any video yet.
```

The agent runs `bash scripts/check-setup.sh` on Mac or `scripts/check-setup.ps1` on Windows. It checks the helpers and your live key without showing any private value, then makes a short speech test in your own voice.

Your setup is finished when ElevenLabs and HyperFrames both report CONNECTED. If HeyGen reports NOT SIGNED IN, nothing is broken and you have not done anything wrong: go back to Step 7, then start a new chat. Assignments 2 and 3 run without HeyGen in the meantime.

After changing `.env` or finishing a sign-in, START A NEW CHAT and paste that same prompt again.

> **If something does not connect**
>
> - A helper is missing: run the setup command from Step 5 again. It is safe to repeat.
> - HeyGen is not signed in: do Step 7, then START A NEW CHAT. A connection never shows up in the chat that was open when you signed in.
> - Wrong plan: confirm that HeyGen and ElevenLabs show the Creator plan.
> - Key not restricted correctly: under Developers, API keys, make a new key using the Step 4 checkbox list (Text to Speech, Speech to Text, Sound Effects, Music Generation optional) and set Voices to Read.

## Optional, import your voice into HeyGen (only if HeyGen refuses uploaded audio)

Skip this for normal use. Normal use uploads the script's narration and needs no import.

In HeyGen, open Settings, Voices, then Import third-party voice. Paste the restricted ElevenLabs key there, choose Manage, then choose your professional voice. Do not paste the key into chat. This gives HeyGen the key's permissions: Text to Speech, Speech to Text, Sound Effects, Music Generation if selected, and Voices set to Read. You can revoke it and make a new one in ElevenLabs under Developers, API keys.
