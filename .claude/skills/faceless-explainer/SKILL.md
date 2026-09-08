---
name: faceless-explainer
description: Use when the member says "assignment 2," "faceless explainer," or asks to explain a URL or topic without an avatar.
---

# Purpose

Turn a page or topic into a clear 5 to 7 scene explainer.
Use the member's voice without showing an avatar.
Render wide and vertical drafts in the member's brand style.

# Inputs

Read silently:

- `AGENTS.md`.
- `brand/brand-kit.md`.
- `compliance/rules.md`.
- `assignments/02-faceless-explainer.md` or the member's words.

Input is one URL or one topic.
If page text cannot be fetched, ask the member to paste the useful text.
Ask at most three questions, one per message, with example answers.
Use the sample topic when the member says "I do not know."
Get the voice ID only through `bash scripts/read-id.sh ELEVENLABS_VOICE_ID`. Use its output in tool calls only, never in reports. Never open or print `.env` itself.

# Steps

1. Complete the READ and CHECK phases in `AGENTS.md`.
2. If the member requested the sample brief, use `brand/sample-brand-kit.md` and skip the interview. Otherwise, run the brand interview if any `[FILL]` marker remains.
3. Run `bash scripts/check-setup.sh`.
4. Stop and use `SETUP.md` if ElevenLabs or HyperFrames is disconnected.
5. Treat HeyGen as optional and do not stop when it is unavailable.
6. Read the supplied page text or topic notes.
7. If a page is unavailable, ask for pasted text and stop until it arrives.
8. Remove customer details and restricted company names.
9. Offer safe anonymous wording for anything removed.
10. Identify one promise, three useful points, and one call to action (CTA).
11. Scaffold the draft folder with `hyperframes init output/drafts/<date>-faceless-explainer --non-interactive --example blank`.
12. Write `scenes.md` with 5 to 7 scenes.
13. Make each scene 8 to 12 seconds long.
14. Give each scene one headline.
15. Give each scene no more than two supporting lines.
16. Add one plain visual note to each scene.
17. Use brand colors from `brand/brand-kit.md`.
18. Write `script.md` as natural narration.
19. Match the narration to the scene order.
20. Keep sentences short and easy to say.
21. Estimate the narration length and ElevenLabs credit use.
22. Estimate any optional sound-effect credit use.
23. Tell the member before generation if the total is over 60 seconds.
24. Generate a 10-second narration test with ElevenLabs.
25. Save it as `test-voice.mp3`.
26. Check pronunciation, pace, and tone before continuing.
27. Generate the full narration with the voice ID returned by `bash scripts/read-id.sh ELEVENLABS_VOICE_ID`.
28. Save it as `narration.mp3`.
29. Ask once whether a light whoosh is wanted.
30. Default to no sound effect.
31. If approved, make one original whoosh with ElevenLabs.
32. Save it as `whoosh.mp3`.
33. Author the composition as `index.html` in the draft folder, editing the file that `hyperframes init` created. Set its initial size to 16:9.
34. Make every scene a full-frame card.
35. Animate the headline into each scene.
36. Keep supporting text readable and still long enough to read.
37. Add captions from the narration transcript.
38. Follow the caption defaults in the brand kit.
39. Add a 4-second end card with brand name and CTA.
40. Use only local assets from `brand/assets/`.
41. From inside the draft folder, run `hyperframes lint .`, then `hyperframes check .`.
42. If a command flag is uncertain, run `hyperframes <command> --help` first.
43. From inside the draft folder, render wide with `hyperframes render . --output faceless-explainer-16x9.mp4`.
44. Set the vertical size in `index.html`, run `hyperframes lint .` and `hyperframes check .` again, then render from inside the draft folder with `hyperframes render . --output faceless-explainer-9x16.mp4`.
45. Inspect headline edges, captions, scene timing, and sound.
46. Write the required `README.md`.
47. Record known and estimated credits.
48. Keep every result in drafts.

# Outputs

Write these in `output/drafts/<date>-faceless-explainer/`:

- `source-notes.md`.
- `scenes.md`.
- `script.md`.
- `test-voice.mp3`.
- `narration.mp3`.
- `whoosh.mp3`, only when approved.
- `index.html`.
- `faceless-explainer-16x9.mp4`.
- `faceless-explainer-9x16.mp4`.
- `README.md`.

# Review checklist

- [ ] The source claim and wording are accurate.
- [ ] No customer details or restricted company names appear.
- [ ] There are 5 to 7 scenes of 8 to 12 seconds each.
- [ ] Headlines, captions, colors, and CTA are clear.
- [ ] Voice timing and optional sound feel natural.
- [ ] Wide and vertical renders have safe text margins.
- [ ] A person watched both final files.
- [ ] Credit use is recorded.

# Never

- Never include customer identifying details or name a carrier.
- Never publish, post, upload, or send a result.
- Never expose a key, token, or the contents of `.env`.
- Never clone a voice without written consent.
- Never add another tool, account, or paid service without asking.
- Never make a full narration before the 10-second test.
- Never generate over 60 seconds without giving a credit estimate first.
