---
name: desk-check
description: Use when the member says "desk check," "check setup," or runs assignment 0.
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
The default is to stop when HeyGen, ElevenLabs, or HyperFrames does not answer.
Do not run the brand interview because this check is not video work.

# Steps

Before any stop, including a missing `.env`, print these three lines with the actual status and reason, then write the same status at the start of `output/drafts/<date>-desk-check/README.md`:

```text
HeyGen: NOT TESTED (reason)
ElevenLabs: NOT TESTED (reason)
HyperFrames: NOT TESTED (reason)
```

Each line must use CONNECTED, NOT CONNECTED, or NOT TESTED and explain why. A successful tool answer is required for CONNECTED. A failed attempted check is NOT CONNECTED. A check that could not run is NOT TESTED. Never claim a connection from a value being present. This reporting rule applies to every early stop below.

1. Run `bash scripts/check-setup.sh` from the project folder. Read its report without displaying private values.
2. Start all three tool statuses as NOT TESTED with the reason "check has not run". Create `output/drafts/<date>-desk-check/` for the note.
3. If `.env` or a required value is missing, name only the missing setting, mark untested tools NOT TESTED with the missing-setup reason, print and save all three status lines, point to `SETUP.md`, and stop.
4. Get IDs only through `bash scripts/read-id.sh ELEVENLABS_VOICE_ID` and `bash scripts/read-id.sh HEYGEN_AVATAR_ID`. Never open or print `.env` itself. Use the returned IDs only in tool calls, never in the report.
5. Confirm the ElevenLabs signed-in connection answers. Use the selected voice for a 10-second speech test with this exact sentence: "Hello. Your AI video editor is connected and ready to work. This is a short test of your cloned voice, so you can check that it sounds like you."
6. Save the test as `output/drafts/<date>-desk-check/voice-test.mp3`. Verify the file is at least 8 seconds long using its duration, not a guess. If it is shorter, report that the voice test needs correction before full generation. Record known or estimated ElevenLabs credit use.
7. Confirm the HeyGen signed-in connection answers, ask it to list the member's avatars, and compare the selected avatar with the ID returned by the script. Do not print IDs. Do not generate an avatar video.
8. Run `hyperframes --version`. If missing, explain the installation step in `SETUP.md`; do not install it without the member's request.
9. Treat Whisper as optional and ffmpeg as required for assignment 3 and weekly work.
10. Print all three status lines before any stop. If a required tool is unavailable, explain its next setup step and stop before video work.
11. Write `output/drafts/<date>-desk-check/README.md` even when setup is incomplete. Begin with all three status lines, then include the required draft README sections: What was made, Files, Review checklist, and Credits. Below the statuses list node, npm, ffmpeg, optional Whisper, any test file made, and next steps. Record zero credits when no generation ran.
12. End in one plain-English paragraph.

# Outputs

- `output/drafts/<date>-desk-check/README.md`, with all three statuses and next steps, even when a check stops early.
- `output/drafts/<date>-desk-check/voice-test.mp3`, only when ElevenLabs answers and the test is generated.

Use the date as `YYYY-MM-DD`.
Do not put IDs or keys into either file.

# Review checklist

- [ ] The report begins with three clear status lines.
- [ ] No key, token, voice ID, or avatar ID is shown.
- [ ] The 10-second speech used the exact approved sentence and its file was verified to be at least 8 seconds long.
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
