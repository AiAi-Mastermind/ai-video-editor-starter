---
name: setup-bootstrap
description: Use when the member says "set this up", "install everything", "bootstrap", "run setup", "I just cloned this", "get me started", "install the tools", "connect HeyGen", "connect ElevenLabs", "connect HyperFrames", or opens this folder for the first time. Runs the one setup script that installs every helper and registers the connections.
---

# Purpose

Install everything this project needs with one command, so the member never hunts for a
plugin in a sidebar. Report in plain English what is installed and what one or two things
are still theirs to do.

# Inputs

Read these files silently:

- `AGENTS.md`.
- `SETUP.md`, only if the member asks a question this skill does not answer.

Do not read `.env`. Do not run the brand interview. Do not make a video.

# Steps

1. Run the setup script and show the member its output as it is:

   ```sh
   bash scripts/bootstrap.sh
   ```

   On Windows run `scripts/bootstrap.ps1` from PowerShell.

   The script installs Node's helpers, ffmpeg, the `hyperframes` command and its
   instructions, and the official `elevenlabs` command. It creates `.env` from
   `.env.example` if it is missing, and registers HeyGen with Codex and with this
   folder's `.mcp.json`. It is safe to run twice. It never opens or prints `.env`.

2. Read the script's "What is left for you to do" list back to the member as a short
   numbered list in your own plain words. That list is the whole handoff. Do not add
   steps of your own and do not send them to the Plugins sidebar.

3. If `.env` was just created, tell the member to open it themselves and paste in three
   values: the ElevenLabs key, the voice ID, and the avatar ID. `SETUP.md` Step 4 shows
   where each one lives. Never offer to open, read, or fill in `.env` for them.

4. If the list includes a HeyGen sign-in, say it is a one-time browser sign-in and give
   the exact command:

   ```sh
   codex mcp login heygen
   ```

   In Claude Code the member types `/mcp` instead and finishes the sign-in there. Say
   plainly that HeyGen is the only tool that needs a sign-in, that it is not part of the
   key setup, and that everything else is already working without it.

5. If the script reports a missing helper it could not install, give the one command from
   its list and nothing more. Do not install anything the script did not try to install.

6. Do not run the desk check in this chat. Connections registered in this chat do not
   appear in it. End by telling the member to START A NEW CHAT and ask for the desk check.

# Outputs

- No draft folder and no files of your own. The script writes `.setup-next-steps.txt`
  itself; leave it alone.

# Review checklist

- [ ] The setup script was actually run, not described.
- [ ] The remaining steps were read back as a short numbered list.
- [ ] No key, token, voice ID, or avatar ID was shown.
- [ ] `.env` was never opened, read, or filled in by the agent.
- [ ] The HeyGen sign-in was given as one command, not as a plugin hunt.
- [ ] The member was told to start a new chat before the desk check.

# Never

- Never open, read, print, or edit `.env`. Creating it from the template is the script's job.
- Never tell the member to install a HeyGen, ElevenLabs, or HyperFrames plugin. This project
  does not use plugins.
- Never fill in `HEYGEN_API_KEY`. It spends a separate paid balance, about $1 per minute,
  while the member's plan credits sit unused. Leave it empty unless the member says in this
  session that they bought API credits on purpose.
- Never add another tool, account, or paid service.
- Never make a video here. This is setup only.
