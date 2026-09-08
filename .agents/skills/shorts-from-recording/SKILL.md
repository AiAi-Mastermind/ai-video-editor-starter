---
name: shorts-from-recording
description: Use when the member says "assignment 3," "make shorts," or places a source file in input/recordings/.
---

# Purpose

Find the strongest complete moments in one recording.
Help the member choose three vertical shorts.
Cut, reframe, caption, and render each selected draft.

# Inputs

Read silently:

- `AGENTS.md`.
- `brand/brand-kit.md`.
- `compliance/rules.md`.
- `assignments/03-shorts-from-recording.md` or the member's words.
- One file in `input/recordings/`.

Ask at most three questions, one per message, with example answers.
Ask which file only when more than one recording is present.
Ask where the face is only when a center crop would be unsafe.
Default to the top three scored segments.
Default to a center crop for 9:16.
Default to no HeyGen opening clip.

# Steps

1. Complete the READ and CHECK phases in `AGENTS.md`.
2. Run the brand interview if any `[FILL]` marker remains.
3. Run `bash scripts/check-setup.sh`.
4. Stop and use `SETUP.md` if ElevenLabs is disconnected.
5. Confirm HyperFrames and ffmpeg answer.
6. List candidate files without opening ignored secrets.
7. Select one source recording.
8. Screen its title and transcript for customer details.
9. Never copy unsafe details into notes, captions, or file names.
10. Create `output/drafts/<date>-shorts-from-recording/`.
11. Transcribe with `hyperframes init --video <file> --non-interactive`.
12. If that path fails, use ElevenLabs speech to text.
13. Save the cleaned transcript as `transcript.md`.
14. Do not invent additional HyperFrames flags.
15. Run `hyperframes init --help` when command behavior is uncertain.
16. Divide the transcript into complete 20 to 60 second segments.
17. Score every segment from 1 to 5 for hook.
18. Score every segment from 1 to 5 for tension.
19. Score every segment from 1 to 5 for value.
20. Score every segment from 1 to 5 for completeness.
21. Add the four scores for a total out of 20.
22. Remove segments containing unsafe identifying details.
23. Write the top five to `selections.md` as a table.
24. Include start, end, first line, and total score.
25. Present that same five-row table to the member.
26. Ask the member to pick three.
27. If the answer is "I do not know," choose the top three.
28. Write exact ffmpeg cut commands after confirming timestamps.
29. Preserve the original recording.
30. Cut each selected segment with ffmpeg.
31. Name them `short-01-source.mp4` through `short-03-source.mp4`.
32. Reframe each to 9:16.
33. Use a center crop unless the member says where the face is.
34. Check that eyes, mouth, hands, and useful objects remain visible.
35. Build one HyperFrames composition for each selected short.
36. Add animated captions in the brand style.
37. Keep captions to 6 words per line.
38. Keep captions in the bottom third without covering the face.
39. Optionally offer a 3-second HeyGen clone opening that says the hook.
40. Default to no clone opening.
41. If approved, confirm the clone is the member's own or has written consent.
42. Estimate HeyGen and ElevenLabs credits before generation.
43. Generate a 10-second clone test before any full clone work.
44. Do not generate over 60 seconds without a credit estimate.
45. Validate and lint all compositions.
46. Run `hyperframes <command> --help` before any uncertain flag.
47. Render `short-01-9x16.mp4` through `short-03-9x16.mp4`.
48. Inspect caption timing, crop, audio, and clean endings.
49. Write the required folder `README.md`.
50. Record which transcript method was used.
51. Record known and estimated credits.
52. Keep every result in drafts.

# Outputs

Write these in `output/drafts/<date>-shorts-from-recording/`:

- `transcript.md`.
- `selections.md`.
- Three source cuts named `short-01-source.mp4` and so on.
- Three HyperFrames composition HTML files.
- Three final files named `short-01-9x16.mp4` and so on.
- Optional 3-second hook test and source files.
- `README.md`.

# Review checklist

- [ ] No customer details or restricted company names remain.
- [ ] Each short is 20 to 60 seconds and feels complete.
- [ ] Each opening earns attention quickly.
- [ ] The 9:16 crop keeps the speaker visible.
- [ ] Animated captions match the words and brand.
- [ ] Audio starts and ends cleanly.
- [ ] A person watched every final short.
- [ ] Credit use is recorded.

# Never

- Never include customer details in transcripts, notes, captions, or names.
- Never name a carrier or contracted company.
- Never publish, post, upload, or send a result.
- Never expose `.env`, keys, tokens, or IDs.
- Never clone another person without written consent.
- Never add another tool, account, or paid service without asking.
- Never generate a full paid clip before a 10-second test or without the required credit estimate.
