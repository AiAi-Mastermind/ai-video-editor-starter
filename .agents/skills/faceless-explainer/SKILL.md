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

For repeated speech tests, keep each earlier file: use `test-voice-v2.mp3`, then `test-voice-v3.mp3`, and matching test text files. The speech helper refuses to overwrite an existing output.

For new work, reserve a fresh draft folder. If it exists, add `-2`, then `-3` until creation succeeds. Use that chosen path in every command below. Revisions use the existing folder.

Decide connections from THIS chat only, never from another chat's README. ElevenLabs is CONNECTED when the setup script printed "ElevenLabs key works", regardless of chat tools; always use the speech script. HeyGen is CONNECTED when HeyGen tools are listed in this chat. HyperFrames is CONNECTED when `hyperframes --version` prints a version. Stop only for a tool the named assignment requires. Review and brand-kit work require no connection.

1. Complete the READ and CHECK phases in `AGENTS.md`.
2. If the member requested the sample brief, use `brand/sample-brand-kit.md` and skip the interview. Otherwise, run the brand interview if any `[FILL]` marker remains.
3. Run `bash scripts/check-setup.sh`.
4. ElevenLabs is connected when this run printed "ElevenLabs key works". Run `hyperframes --version`. Stop only if the key check failed or HyperFrames is missing; explain the matching SETUP.md step. Never require an ElevenLabs chat tool for speech.
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
24. Write about 10 seconds of plain narration to `test-speech.txt`. Run `bash scripts/elevenlabs-speak.sh <draft>/test-speech.txt <draft>/test-voice.mp3` without a permission question.
25. On Windows use `scripts/elevenlabs-speak.ps1` with the same two paths; verify the saved test.
26. Check pronunciation, pace, and tone before continuing.
27. Write the full plain spoken narration to `narration.txt`. Run `bash scripts/elevenlabs-speak.sh <draft>/narration.txt <draft>/narration.mp3` without a permission question.
28. On Windows use `scripts/elevenlabs-speak.ps1` with the same paths. Read Background music from the active brand kit. For light or upbeat, only when the ElevenLabs chat tool is listed and offers music, generate one instrumental bed for the full video including the end card, save `music.mp3`, and include its cost in the estimate before generation. If the tool is absent, skip and write "no music, ElevenLabs tool not in this chat" in the README. For none, skip and note the brand preference. If music permission is missing, skip gracefully and record that reason. Use about -18 dB under speech and fade during the end card.
29. Ask once whether a light whoosh is wanted.
30. Default to no sound effect.
31. If wanted and the ElevenLabs chat tool is listed, make one original whoosh with it. Otherwise skip and note the missing tool in the README.
32. Save it as `whoosh.mp3`.
33. Author the composition as `index.html` in the draft folder, editing the file that `hyperframes init` created. Set its initial size to 16:9.
34. Make every scene a full-frame card.
35. Animate the headline into each scene.
36. Keep supporting text readable and still long enough to read.
37. Add captions from the narration transcript.
38. Follow the caption defaults in the brand kit.
39. Add a 4-second end card with brand name and CTA.
40. Use local assets from `brand/assets/` and generated images saved in the draft folder. Never use remote asset URLs.
41. From inside the draft folder, run `hyperframes lint .`, then `hyperframes check .`.
42. If a command flag is uncertain, run `hyperframes <command> --help` first.
43. From inside the draft folder, render wide with `hyperframes render . --output faceless-explainer-16x9.mp4`.
44. Set the vertical size in `index.html`, run `hyperframes lint .` and `hyperframes check .` again, then render from inside the draft folder with `hyperframes render . --output faceless-explainer-9x16.mp4`.
45. Inspect headline edges, captions, scene timing, and sound.
46. Write the required `README.md`.
47. Record known and estimated credits.
48. Keep every result in drafts.

# Revise

Use the named draft folder. Do not re-init. Keep narration and the avatar source unless the words or requested delivery change. Change only what the member requested. For new images, use Codex built-in image generation and save `image-01.png`, `image-02.png`, and so on in the draft folder. In Claude Code, ask the member to make the images in ChatGPT and drop them into the folder. Use subtle HyperFrames keyframe motion. Sound effects use the listed ElevenLabs chat tool and save as `sfx-<name>.mp3`; otherwise skip and note why. Music comes from a licensed member file or the listed ElevenLabs chat tool if it offers music. Reuse existing audio where possible. Estimate new credits before generation and keep the normal short-test rules for changed speech or avatars. Re-lint, check, and render with a `-v2` suffix, then `-v3`, preserving earlier renders. Inspect both sizes and update the README with changes, files, skipped extras, and credits.

# Outputs

Write these in `output/drafts/<date>-faceless-explainer/`:

- `source-notes.md`.
- `scenes.md`.
- `script.md`.
- `test-voice.mp3`.
- `narration.mp3`.
- `test-speech.txt` and `narration.txt`, plain spoken text only.
- `music.mp3`, only when generated or supplied.
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
- [ ] Music spans the full video including the end card, or the README explains why it was skipped.
- [ ] Credit use is recorded.

# Never

- Never include customer identifying details or name a carrier.
- Never publish, post, upload, or send a result.
- Never expose a key, token, or the contents of `.env`.
- Never clone a voice without written consent.
- Never add another tool, account, or paid service without asking. Running `scripts/elevenlabs-speak.sh` is the required speech route, not a new tool, and needs no permission question.
- Never make a full narration before the 10-second test.
- Never generate over 60 seconds without giving a credit estimate first.
