# Setup

The rebuilt video course starts with the local project and its file pane. Follow that first lesson if you are new to folders or Codex. You do not need to complete another course first.

There are no plugins in this course. One command installs everything.

A cloned starter folder looks like this. File names are visible; private file contents are not.

<img src="docs/screenshots/starter-folder.png" alt="Starter folder showing assignments, brand files, scripts and START-HERE.md without opening any private file" width="202">

## The short version

1. Get the three accounts.
2. Prepare voice and avatar accounts only for the route you need. Allow time for processing; use the status shown in your account.
3. Make one ElevenLabs key.
4. Ask your agent to run the setup command.
5. Paste three values into `.env`.
6. Sign in to HeyGen once.
7. Run the desk check.

## Step 1, get the accounts

Use your existing ChatGPT account to sign in to Codex and check its usage limits. For generated videos, confirm your HeyGen avatar feature and ElevenLabs professional-clone slot. See the current account links in README.md. Editing an existing recording with its original sound does not require a cloned voice or avatar. Claude Code is an alternative agent.

You need Node.js as well. If it is not already on this computer, download version 22 or newer from [nodejs.org](https://nodejs.org/) and run the installer. Success looks like: the installer says the installation completed successfully. Everything else installs itself in Step 5.

## Step 2, record your ElevenLabs professional voice

Prepare at least 30 minutes of clean recordings of your own voice; more clean speech can improve the result. Use a quiet room and consistent microphone. In ElevenLabs, choose Voices, Create Voice, then Professional Voice Clone. If the option says No slots available, check whether your existing clone is the one you want. In the creation form, name your voice, choose its language, click Upload samples, and check the combined duration before Next. Complete the required voice verification yourself. Use the processing status in your account rather than a fixed time promise. [Official professional-cloning guide](https://elevenlabs.io/docs/eleven-creative/voices/voice-cloning/professional-voice-cloning).

How you know it is ready: ElevenLabs shows the voice under My Voices with no Processing label.

Professional voice cloning requires the voice owner to complete the provider’s verification. A team member should create and verify their own clone in their own account, then use the provider’s permitted private-sharing route. Written consent alone does not replace verification.

## Step 3, make your HeyGen clone

In HeyGen, open Avatars and choose New Avatar, then Clone a real person. Choose webcam, phone, or upload as offered in your account. The prep-party webcam flow used a short recording; do not assume every flow requires two minutes. Follow the duration, camera, consent, and verification instructions on your own screen. Keep your whole face visible and speak naturally. Review the recording, name the avatar, and submit it. Wait for the processing state to finish before previewing it.

How you know it is ready: HeyGen shows the avatar with no Processing label and lets you preview it.

Only clone your own face. A team member must first give written consent in `brand/consent.md`.

## Step 4, create the ElevenLabs API key

This is the only key you will paste anywhere.

In ElevenLabs, open Developers in the left sidebar, then API keys, then Create key. Keep Restrict Key on. Choose Access for the following endpoint rows:

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

Paste each value after its matching equals sign, one setting per line. Then press Command-S on Mac or Control-S on Windows and close the editor. Confirm the filename is `.env`, not `.env.txt` or `.env.example`. Do not paste these values into chat.

- [ ] `ELEVENLABS_API_KEY`, the private key from Step 4.
- [ ] `ELEVENLABS_VOICE_ID`. In ElevenLabs, open My Voices, find your own voice, open its three-dot menu, and choose Copy voice ID.
- [ ] `HEYGEN_AVATAR_ID`. In HeyGen, open Avatars, choose your clone, and copy the ID from the address bar or details panel.

Two settings are already filled in for you: `DEFAULT_OUTPUT_SIZES=16:9,9:16` for wide and vertical videos, and `TEST_CLIP_SECONDS=10` for the short first test.

**Leave `HEYGEN_API_KEY` empty.** This course uses the signed-in HeyGen connection from Step 7. An API key uses a separate billing route; do not switch routes when troubleshooting. Check the current balance and generation estimate in your own account.

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
> - Missing feature: confirm the exact avatar or professional-clone feature in your own account before changing plans.
> - Key not restricted correctly: under Developers, API keys, make a new key using the Step 4 checkbox list (Text to Speech, Speech to Text, Sound Effects, Music Generation optional) and set Voices to Read.

## Optional, import your voice into HeyGen (only if HeyGen refuses uploaded audio)

Skip this for normal use. Normal use uploads the script's narration and needs no import.

In HeyGen, open Settings, Voices, then Import third-party voice. Paste the restricted ElevenLabs key there, choose Manage, then choose your professional voice. Do not paste the key into chat. This gives HeyGen the key's permissions: Text to Speech, Speech to Text, Sound Effects, Music Generation if selected, and Voices set to Read. You can revoke it and make a new one in ElevenLabs under Developers, API keys.
