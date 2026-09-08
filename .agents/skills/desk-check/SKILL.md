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

1. Run `bash scripts/check-setup.sh` from the project folder.
2. Read the report without printing any private value.
3. If `.env` is missing, point the member to `SETUP.md` and stop.
4. If a required value is missing, name only the missing key.
5. Confirm the ElevenLabs signed-in connection is available.
6. Use the ElevenLabs connection for a 10-second speech test.
7. Use the voice ID referenced by `.env`.
8. Use this exact speech: "Your AI video editor is connected."
9. Save the test as `output/desk-check/<date>-voice-test.mp3`.
10. Make the speech file 10 seconds long so it satisfies the short-test safety rule.
11. Record the known or estimated ElevenLabs credit use.
12. Do not reveal the voice ID in the report.
13. Confirm the HeyGen signed-in connection is available.
14. Ask HeyGen to list the member's avatars.
15. Compare the list with the avatar ID referenced by `.env`.
16. Do not print the full avatar ID.
17. Do not generate an avatar video during this check.
18. Run `hyperframes --version`.
19. If that command is missing, use `SETUP.md` to explain installation.
20. Do not install it without the member's request.
21. Treat Whisper as optional.
22. Treat ffmpeg as required for assignments 3 and weekly work.
23. If HeyGen, ElevenLabs, or HyperFrames is disconnected, explain the next setup step.
24. Stop before video work when any required tool is unavailable.
25. Write `output/desk-check/<date>.md`.
26. Start the report with exactly three status lines.
27. Use `HeyGen: CONNECTED` or `HeyGen: NOT CONNECTED`.
28. Use `ElevenLabs: CONNECTED` or `ElevenLabs: NOT CONNECTED`.
29. Use `HyperFrames: CONNECTED` or `HyperFrames: NOT CONNECTED`.
30. Below those lines, list node, npm, ffmpeg, and optional Whisper.
31. Name the voice test file if it was created.
32. State the estimated or known credit use.
33. Never claim a connection based only on a value being present.
34. A successful tool answer is required for CONNECTED.
35. End in one plain-English paragraph.

# Outputs

- `output/desk-check/<date>.md`, with status and next steps.
- `output/desk-check/<date>-voice-test.mp3`, only when ElevenLabs answers.

Use the date as `YYYY-MM-DD`.
Do not put IDs or keys into either file.

# Review checklist

- [ ] The report begins with three clear status lines.
- [ ] No key, token, voice ID, or avatar ID is shown.
- [ ] The 10-second speech used the exact approved sentence.
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
