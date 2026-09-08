---
name: clone-message
description: Use when the member says "assignment 1," "clone message," or asks for an avatar message in their own face and voice.
---

# Purpose

Make a polished message of about 60 seconds with the member's approved clone.
Add a strong opening, captions, a brand lower third, and an end card.
Render both wide and vertical drafts for human review.

# Inputs

Read silently:

- `AGENTS.md`.
- `brand/brand-kit.md`.
- `compliance/rules.md`.
- `assignments/01-clone-message.md` or the member's brief.
- `brand/consent.md` if the requested person is a team member.

Use the voice ID and avatar ID from `.env` without displaying them.
Ask at most three questions, one per message.
Give two or three example answers.
If the member says "I do not know," use the sample brief or brand-kit default.
Do not begin if the brand kit has a `[FILL]` marker.

# Steps

1. Complete the READ and CHECK phases from `AGENTS.md`.
2. Run the brand interview first when `[FILL]` remains.
3. Run `bash scripts/check-setup.sh`.
4. Confirm HeyGen, ElevenLabs, and HyperFrames answer.
5. Stop and use `SETUP.md` if HeyGen or ElevenLabs is disconnected.
6. Do not make a partial video while a required connection is missing.
7. Keep all private values hidden.
8. Use the sample brief when the member requested it.
21. Confirm the requested clone is the member's own.
22. For a team member, confirm a matching signed line in `brand/consent.md`.
23. Screen the brief for customer details and restricted company names.
24. Offer anonymized wording when needed.
25. Make `output/drafts/<date>-clone-message/`.
26. Write `script.md` in the brand tone.
27. Put the hook first, one useful idea in the middle, and the CTA last.
28. Keep each spoken section between 45 and 60 seconds.
29. Keep the total close to 60 seconds unless the member asked otherwise.
30. Estimate ElevenLabs and HeyGen credit use.
31. Tell the member before any generation over 60 seconds.
32. Generate a 10-second ElevenLabs speech test with the voice ID from `.env`.
33. Save it as `test-voice.mp3`.
34. Ask the member to check identity, pronunciation, pace, and tone.
35. After the test is acceptable, generate the full narration.
36. Save it as `narration.mp3`.
37. Generate the avatar video with HeyGen and the avatar ID from `.env`.
38. Prefer the generated audio as the avatar audio.
39. If audio upload is not available through HeyGen, use HeyGen text mode with the imported ElevenLabs voice.
40. Record which method was used in the folder README.
41. Save the raw avatar result as `avatar-source.mp4`.
42. Create `composition.html` with HyperFrames.
43. Show the hook as large text for the first 3 seconds.
44. Add a lower third with the brand name.
45. Add captions from the narration transcript.
46. Follow the caption defaults in the brand kit.
47. Add a 4-second end card with the CTA.
48. Use only local assets from `brand/assets/`.
49. Validate and lint the composition.
50. Use only documented commands.
51. If a flag is uncertain, run `hyperframes <command> --help` first.
52. Render wide with `hyperframes render composition.html --output clone-message-16x9.mp4` from the draft folder.
53. Render vertical with `hyperframes render composition.html --output clone-message-9x16.mp4` after setting the intended output size in the composition.
54. Watch or inspect both final files.
55. Write `README.md` using the required draft format.
56. List the script, test, narration, source, composition, and renders.
57. Record estimated and known credits.
58. Never move the work out of drafts.

# Outputs

Write these in `output/drafts/<date>-clone-message/`:

- `script.md`.
- `test-voice.mp3`.
- `narration.mp3`.
- `avatar-source.mp4`.
- `composition.html`.
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
- Never expose a key, token, `.env`, voice ID, or avatar ID.
- Never clone anyone without the required written consent.
- Never add another tool, account, or paid service without asking.
- Never make the full render before a 10-second test, and estimate credits before work over 60 seconds.
