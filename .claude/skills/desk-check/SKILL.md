---
name: desk-check
description: Use when the member says "desk check", "check setup", "check my .env", "am I done with setup", "did I finish setup", "run SETUP.md", asks whether everything is connected, or starts assignment 0.
---

# Purpose

Confirm that the three video tools answer before any real video work begins.
Protect all private values while checking them.
Write a small dated report the member can understand.

# Inputs

Read these files silently:

- `AGENTS.md`.
- `brand/brand-kit.md`.
- `compliance/rules.md`.
- `.env.example`.
- `.env`, only through the setup script. Never display it.

Ask no question unless a connection needs the member to sign in.
The default is to stop when HeyGen, ElevenLabs, or the `hyperframes` command is missing.
Do not run the brand interview because this check is not video work.

# Steps

For new work, reserve a fresh draft folder. If it exists, add `-2`, then `-3` until creation succeeds. Use that chosen path in every command below. Revisions use the existing folder.

Decide connections from THIS chat only, never from another chat's README. ElevenLabs is CONNECTED when the setup script printed "ElevenLabs key works", regardless of chat tools; always use the speech script. HeyGen is CONNECTED when HeyGen tools are listed in this chat. HyperFrames is CONNECTED when `hyperframes --version` prints a version. Stop only for a tool the named assignment requires. Review and brand-kit work require no connection.

Before any stop, print all three status lines and put them at the start of the draft README. Reasons belong inside parentheses:

```text
HeyGen: NOT TESTED (reason)
ElevenLabs: NOT TESTED (reason)
HyperFrames: NOT TESTED (reason)
```

Use CONNECTED for the connection evidence defined above, NOT CONNECTED for a failed check or missing required connection, and NOT TESTED when a check could not run. A present private value alone is never evidence of connection. The HyperFrames instructions plugin is not tested here.

1. Run `bash scripts/check-setup.sh` (Windows: `scripts/check-setup.ps1`). If asked to check `.env`, say: "The setup script checked your private settings without showing their contents."
2. Reserve `output/drafts/<date>-desk-check/`, adding a suffix if needed. Decide every status from this chat only.
3. Check all three statuses before any stop, even if `.env` or a setting is missing. Name missing settings without showing their values. ElevenLabs counts as CONNECTED only when this run printed "ElevenLabs key works".
4. Use `bash scripts/read-id.sh HEYGEN_AVATAR_ID` only if needed to check the chosen avatar; do not put the ID in the report. The speech script reads its own voice ID.
5. Once the key works and the voice ID is present, write `test-speech.txt` in the draft folder with: "Hello. Your AI video editor is connected and ready to work. This is a short test of your cloned voice, so you can check that it sounds like you." Run `bash scripts/elevenlabs-speak.sh <draft>/test-speech.txt <draft>/voice-test.mp3` without a permission question. On Windows use `scripts/elevenlabs-speak.ps1` with the same two paths. This is a short speech test, about 8 to 10 seconds.
6. Measure `voice-test.mp3` with ffprobe. Pass at 6 seconds or longer. If shorter, say "The speech test measured [length] seconds, below 6 seconds; correct the test before full generation." Keep connection and speech-quality results separate. Record known or estimated ElevenLabs credits.
7. HeyGen is CONNECTED when its tools are listed in this chat. If present, list the member's avatars and check the selected one without printing IDs. Record any avatar mismatch separately. If absent, mark NOT CONNECTED (plugin not loaded in this chat). A HeyGen key in `.env` is not used; never read or use one. Do not generate an avatar video here.
8. Run `hyperframes --version`; a printed version means CONNECTED. If missing, mark NOT CONNECTED (hyperframes command missing) and point to SETUP.md Step 1. Do not run doctor here.
9. Whisper is optional. ffmpeg is needed here to measure speech and is required for assignment 3 and weekly work. Record a missing measurement helper as an untested speech check.
10. Print all three status lines before any stop. Stop only for a required missing tool or a failed required test. For missing HeyGen in Codex, end with exactly: "Connect HeyGen in Plugins, then START A NEW CHAT and paste the first prompt from START-HERE.md again. A plugin never shows up in the chat that was open when you connected it." In Claude Code, end with: "/mcp, finish the sign-in; if still missing, quit and reopen the folder, paste the prompt again". For a failed key check or missing helper, explain the matching SETUP.md step. Never suggest retrying a newly connected plugin in this chat.
11. Write the README even when incomplete. Begin with the three statuses, then the required What was made, Files, Review checklist, and Credits sections. List helpers, tests, and next steps. Record zero credits if no generation ran.
12. Name every failed check, what was measured, and whether the member can continue. Never use a bare "fail" or "quality gate" label. Never say "everything connected" when a check failed. End in one plain-English paragraph.

# Outputs

- `output/drafts/<date>-desk-check/README.md`, with all three statuses and next steps, even when a check stops early.
- `output/drafts/<date>-desk-check/test-speech.txt`, the plain test sentence.
- `output/drafts/<date>-desk-check/voice-test.mp3`, only when ElevenLabs answers and the test is generated.

Use the date as `YYYY-MM-DD`.
Do not put IDs or keys into either file.

# Review checklist

- [ ] The report begins with three clear status lines.
- [ ] No key, token, voice ID, or avatar ID is shown.
- [ ] The speech test used the exact sentence and measured at least 6 seconds.
- [ ] Every failed or untested check names the measurement and whether work can continue.
- [ ] HeyGen listed avatars and the chosen avatar was confirmed.
- [ ] HyperFrames version was checked.
- [ ] Missing setup steps point to `SETUP.md`.
- [ ] Credit use is stated if known.

# Never

- Never include client or customer identifying details.
- Never name an insurance carrier or contracted company.
- Never publish, upload, post, or send the test.
- Never write a key outside `.env` or print `.env`.
- Never clone another person's face or voice without written consent.
- Never add another tool, account, or paid service without asking.
- Never generate a full clip here. This is a short setup test only.
