---
name: clone-message
description: Use when the member says "assignment 1," "clone message," or asks for an avatar message in their own face and voice.
---

# Purpose

Make a polished message of about 60 seconds with the member's approved clone.
Add a strong opening, captions, a brand lower third (name label near the bottom), and an end card.
Render both wide and vertical drafts for human review.

# Inputs

Read silently:

- `AGENTS.md`.
- `brand/brand-kit.md`.
- `compliance/rules.md`.
- `assignments/01-clone-message.md` or the member's brief.
- `brand/consent.md` if the requested person is a team member.

Get IDs only through `bash scripts/read-id.sh ELEVENLABS_VOICE_ID` and `bash scripts/read-id.sh HEYGEN_AVATAR_ID`. Use their output in tool calls only, never in reports. Never open or print `.env` itself.
Ask at most three questions, one per message.
Give two or three example answers.
If the member says "I do not know," use the sample brief or brand-kit default.
Do not begin if the brand kit has a `[FILL]` marker unless the member requested the sample brief.

# Steps

1. Complete the READ and CHECK phases from `AGENTS.md`.
2. If the member requested the sample brief, use `brand/sample-brand-kit.md` and skip the interview. Otherwise, run the brand interview first when `[FILL]` remains.
3. Run `bash scripts/check-setup.sh`.
4. Confirm HeyGen, ElevenLabs, and HyperFrames answer.
5. Stop and use `SETUP.md` if HeyGen, ElevenLabs, or HyperFrames is disconnected.
6. Do not make a partial video while a required connection is missing.
7. Keep all private values hidden.
8. Use the sample brief when the member requested it.
9. Confirm the requested clone is the member's own.
10. For a team member, confirm a matching signed line in `brand/consent.md`.
11. Screen the brief for customer details and restricted company names.
12. Offer anonymized wording when needed.
13. Scaffold the draft folder with `hyperframes init output/drafts/<date>-clone-message --non-interactive --example blank`.
14. Write `script.md` in the brand tone.
15. Put the hook first, one useful idea in the middle, and the call to action (CTA) last.
16. Keep the narration between 45 and 60 seconds in total, including all spoken sections.
17. Fit the hook, useful idea, and closing into that total.
18. Estimate ElevenLabs and HeyGen credit use.
19. Tell the member before any generation over 60 seconds.
20. Generate a 10-second ElevenLabs speech test with the voice ID returned by `bash scripts/read-id.sh ELEVENLABS_VOICE_ID`.
21. Save it as `test-voice.mp3`.
22. Ask the member to check identity, pronunciation, pace, and tone.
23. After the test is acceptable, generate the full narration.
24. Save it as `narration.mp3`.
25. Generate the avatar video with HeyGen and the avatar ID returned by `bash scripts/read-id.sh HEYGEN_AVATAR_ID`.
26. Prefer the generated audio as the avatar audio.
27. If audio upload is not available through HeyGen, use HeyGen text mode with the imported ElevenLabs voice.
28. Record which method was used in the folder README.
29. Save the raw avatar result as `avatar-source.mp4`.
30. Author the composition as `index.html` in the draft folder, editing the file that `hyperframes init` created. Set its initial size to 16:9.
31. Show the hook as large text for the first 3 seconds.
32. Add a lower third with the brand name.
33. Add captions from the narration transcript.
34. Follow the caption defaults in the brand kit.
35. Add a 4-second end card with the CTA.
36. Use only local assets from `brand/assets/`.
37. From inside the draft folder, run `hyperframes lint .`, then `hyperframes check .`.
38. Use only documented commands.
39. If a flag is uncertain, run `hyperframes <command> --help` first.
40. From inside the draft folder, render wide with `hyperframes render . --output clone-message-16x9.mp4`.
41. Set the vertical size in `index.html`, run `hyperframes lint .` and `hyperframes check .` again, then render from inside the draft folder with `hyperframes render . --output clone-message-9x16.mp4`.
42. Watch or inspect both final files.
43. Write `README.md` using the required draft format.
44. List the script, test, narration, source, composition, and renders.
45. Record estimated and known credits.
46. Never move the work out of drafts.

# Outputs

Write these in `output/drafts/<date>-clone-message/`:

- `script.md`.
- `test-voice.mp3`.
- `narration.mp3`.
- `avatar-source.mp4`.
- `index.html`.
- `clone-message-16x9.mp4`.
- `clone-message-9x16.mp4`.
- `README.md`.

# Review checklist

- [ ] The clone belongs to the member or has written consent.
- [ ] No customer details or restricted company names appear.
- [ ] The opening earns attention in 3 seconds.
- [ ] Voice, face, pronunciation, and timing feel natural.
- [ ] Lower third, captions, colors, and CTA match the brand kit.
- [ ] Captions use no more than 6 words per line.
- [ ] Wide and vertical framing look correct.
- [ ] A person watched both renders.
- [ ] Credit use is recorded.

# Never

- Never include customer identifying details in any file.
- Never name an insurance carrier or contracted company.
- Never publish, post, upload, or send a result.
- Never expose a key, token, or the contents of `.env`.
- Never clone anyone without the required written consent.
- Never add another tool, account, or paid service without asking.
- Never make the full render before a 10-second test, and estimate credits before work over 60 seconds.
