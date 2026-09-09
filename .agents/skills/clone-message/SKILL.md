---
name: clone-message
description: Use when the member says "assignment 1," "clone message," or asks for an avatar message in their own face and voice.
---

# Purpose

Make a polished message of 45 to 60 seconds, or 30 to 45 seconds for a fast pace or social cut with the member's approved clone.
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

For repeated speech tests, keep each earlier file: use `test-voice-v2.mp3`, then `test-voice-v3.mp3`, and matching test text files. The speech helper refuses to overwrite an existing output.

For new work, reserve a fresh draft folder. If it exists, add `-2`, then `-3` until creation succeeds. Use that chosen path in every command below. Revisions use the existing folder.

Decide connections from THIS chat only, never from another chat's README. ElevenLabs is CONNECTED when the setup script printed "ElevenLabs key works", regardless of chat tools; always use the speech script. HeyGen is CONNECTED when HeyGen tools are listed in this chat. HyperFrames is CONNECTED when `hyperframes --version` prints a version. Stop only for a tool the named assignment requires. Review and brand-kit work require no connection.

1. Complete the READ and CHECK phases from `AGENTS.md`.
2. If the member requested the sample brief, use `brand/sample-brand-kit.md` and skip the interview. Otherwise, run the brand interview first when `[FILL]` remains.
3. Run `bash scripts/check-setup.sh`.
4. Use the connection definitions above. Run `hyperframes --version`. A working ElevenLabs key is enough even without an ElevenLabs chat tool.
5. Stop only for a required missing connection. For missing HeyGen in Codex, say exactly: "Connect HeyGen in Plugins, then START A NEW CHAT and paste the first prompt from START-HERE.md again. A plugin never shows up in the chat that was open when you connected it." In Claude Code say: "/mcp, finish the sign-in; if still missing, quit and reopen the folder, paste the prompt again". For other failures, explain the matching SETUP.md step.
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
16. Keep narration at 45 to 60 seconds, or 30 to 45 seconds for a fast pace or social cut, including all spoken sections. Never exceed 60 seconds without telling the member the credit estimate.
17. Fit the hook, useful idea, and closing into that total.
18. Estimate ElevenLabs and HeyGen credit use.
19. Tell the member before any generation over 60 seconds.
20. Write `test-speech.txt` for about 10 seconds, saying the business name exactly as spelled in the active brand kit. Run `bash scripts/elevenlabs-speak.sh <draft>/test-speech.txt <draft>/test-voice.mp3` without a permission question (Windows: `scripts/elevenlabs-speak.ps1` with the same paths).
21. The script uses the fixed voice settings in the project instructions. Read the Delivery section for the intended pace and pronunciation. Check the measured test length and how it sounds.
22. Ask the member to check identity, pronunciation, pace, and tone. Change only the requested delivery detail and regenerate only the test. Save accepted delivery notes back to the active brand kit. The fixed API settings take precedence over variable speed or style presets; do not add undocumented script arguments or change the script for a delivery request. For faster or slower delivery, adjust wording and pauses in the test and check it again.
23. After the test is acceptable, write plain spoken text to `narration.txt` and run `bash scripts/elevenlabs-speak.sh <draft>/narration.txt <draft>/narration.mp3` with the same settings, without a permission question. On Windows use `scripts/elevenlabs-speak.ps1`.
24. Read Background music from the active brand kit. For light or upbeat, only when the ElevenLabs chat tool is listed and offers music, generate one instrumental bed for the full video including the end card, save `music.mp3`, and include its cost in the estimate before generation. If the tool is absent, skip and write "no music, ElevenLabs tool not in this chat" in the README. For none, skip and note the brand preference. If music permission is missing, skip gracefully and record that reason. Use about -18 dB under speech and fade during the end card.
25. Before every HeyGen generation, including a 10-second test or regeneration, say which balance it uses and the estimate. Always use the signed-in connection and plan credits. Never use a HeyGen API key or the heygen command unless requested in this session. Generate a 10-second avatar test before the full avatar video. Request landscape 16:9, 1920 by 1080, never auto, using the avatar ID from `scripts/read-id.sh`. Inspect dimensions; if portrait comes back, regenerate with the explicit landscape request, announcing the estimate again. If it returns portrait again, stop and report the problem before spending more credits.
26. Use the generated narration as avatar audio. After the avatar test passes, generate the full avatar with the same landscape settings.
27. Only if HeyGen refuses uploaded audio, use text mode with the imported ElevenLabs voice, following the optional import section at the end of SETUP.md.
28. Record which method was used in the folder README.
29. Save the raw avatar result as `avatar-source.mp4`.
30. Author the composition as `index.html` in the draft folder, editing the file that `hyperframes init` created. Set the root `data-width="1920"` and `data-height="1080"`. Place `avatar-source.mp4` full frame with `object-fit: cover`, at one steady size from first frame to last.
31. Show the hook as large text for the first 3 seconds.
32. Add a lower third with the brand name.
33. Add captions from the narration transcript.
34. Follow the caption defaults in the brand kit.
35. Add a 4-second end card with the CTA.
36. Use local assets from `brand/assets/` and generated images saved in the draft folder. Never use remote asset URLs.
37. From inside the draft folder, run `hyperframes lint .`, then `hyperframes check .`.
38. Use only documented commands.
39. If a flag is uncertain, run `hyperframes <command> --help` first.
40. From inside the draft folder, render wide with `hyperframes render . --output clone-message-16x9.mp4`.
41. Set the root `data-width="1080"` and `data-height="1920"` in `index.html`. Use a cover crop with the face centered; re-lay the hook, captions, name label, and end card for vertical safe margins. Never place a portrait clip pillarboxed inside a 16:9 frame. Then run `hyperframes lint .` and `hyperframes check .` again, then render from inside the draft folder with `hyperframes render . --output clone-message-9x16.mp4`.
42. Watch or inspect both final files.
43. Write `README.md` using the required draft format.
44. List the script, test, narration, source, composition, and renders.
45. Record estimated and known credits.
46. Never move the work out of drafts.

# Revise

Use the named draft folder. Do not re-init. Keep narration and the avatar source unless the words or requested delivery change. Change only what the member requested. For new images, use Codex built-in image generation and save `image-01.png`, `image-02.png`, and so on in the draft folder. In Claude Code, ask the member to make the images in ChatGPT and drop them into the folder. Use subtle HyperFrames keyframe motion. Sound effects use the listed ElevenLabs chat tool and save as `sfx-<name>.mp3`; otherwise skip and note why. Music comes from a licensed member file or the listed ElevenLabs chat tool if it offers music. Reuse existing audio where possible. Estimate new credits before generation and keep the normal short-test rules for changed speech or avatars. Re-lint, check, and render with a `-v2` suffix, then `-v3`, preserving earlier renders. Inspect both sizes and update the README with changes, files, skipped extras, and credits.

# Outputs

Write these in `output/drafts/<date>-clone-message/`:

- `script.md`.
- `test-voice.mp3`.
- `narration.mp3`.
- `test-speech.txt` and `narration.txt`, plain spoken text only.
- `music.mp3`, only when generated or supplied.
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
- [ ] The picture fills the frame at one steady size, no black bars, no switch between sizes.
- [ ] A person watched both renders.
- [ ] Music spans the full video including the end card, or the README explains why it was skipped.
- [ ] Credit use is recorded.

# Never

- Never include customer identifying details in any file.
- Never name an insurance carrier or contracted company.
- Never publish, post, upload, or send a result.
- Never expose a key, token, or the contents of `.env`.
- Never clone anyone without the required written consent.
- Never add another tool, account, or paid service without asking. Running `scripts/elevenlabs-speak.sh` is the required speech route, not a new tool, and needs no permission question.
- Never make the full render before a 10-second test, and estimate credits before work over 60 seconds.
