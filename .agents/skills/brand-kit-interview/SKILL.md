---
name: brand-kit-interview
description: Use when the member says "interview me for the brand kit" or "get my brand kit from ..." or supplies a brand source, or before video-making skills when brand/brand-kit.md contains a [FILL] marker. Never trigger for desk-check, review-gate or sample runs.
---

# Purpose

Turn a short conversation into a complete, useful brand kit.
Keep the questions easy for a business owner to answer.
Remove every `[FILL]` marker before video work begins.

# Inputs

Read these files silently:

- `AGENTS.md`.
- `brand/brand-kit.md`.
- `compliance/rules.md`.
- `.env.example`, for reference names only.

Ask up to nine questions, one at a time.
Each message must contain only one question.
Give two or three example answers.
Accept "I do not know" as a complete answer and use the default.
Do not ask the same question twice.

# Steps

Decide connections from THIS chat only, never from another chat's README. ElevenLabs is CONNECTED when the setup script printed "ElevenLabs key works", regardless of chat tools; always use the speech script. HyperFrames is CONNECTED when `hyperframes --version` prints a version. HeyGen is CONNECTED when HeyGen tools are listed in this chat, and NOT SIGNED IN when they are not. A missing HeyGen sign-in is a normal first-run state, never a failure and never the member's fault. Stop only for a tool the named assignment requires. Review and brand-kit work require no connection. If a helper is missing entirely, give one command, `bash scripts/bootstrap.sh` (Windows: `scripts/bootstrap.ps1`), and never send the member to a Plugins sidebar.

1. Check the existing brand kit for completed answers.
2. Keep any clear answer already provided.
Before the questions below, use a supplied source first. If none was named, ask once: "Do you have a file, folder, or website I can use?" Examples: "my brand document", "my website address", or "I do not know" (continue with the interview). In a folder, read only brand, marketing, and about files. Skip customer files, quotes, policies, and `.env`. If a page cannot be fetched, ask for pasted text. Screen imported text for customer details and carrier or contracted company names before saving. Fill the fields it answers, show what was filled, then ask only about remaining `[FILL]` fields using the questions below. Count the source question within the nine-question limit.

3. Ask only if missing: "What is your business name?"
4. Examples: "Sunrise Family Bakery" or "Northside Home Care."
5. No default: every end card shows the business name. Explain this and wait for the name if it is still missing.
6. Ask: "What do you sell, in one sentence?"
7. Examples: "Custom cakes and breakfast boxes" or "Annual coverage reviews."
8. Default: "Helpful products and services for local customers."
9. Ask: "Who usually buys it?"
10. Examples: "Busy parents nearby" or "Small business owners."
11. Default: "People who need this result."
12. Ask: "What is the one action every video should invite?"
13. Examples: "Book a call" or "Order at the link."
14. Default: "Learn more at the link."
15. Ask: "What are two brand colors?"
16. Examples: "#F4A261 and #264653" or "I do not know."
17. Default: dark charcoal `#202124` and warm cream `#FFF7E8`.
18. Ask: "Which font feeling do you prefer?"
19. Examples: "Clean and modern," "friendly and rounded," or "I do not know."
20. Default: a simple default font.
21. Ask: "Which three words describe your tone?"
22. Examples: "warm, quick, funny" or "calm, clear, trusted."
23. Default: "warm, clear, practical."
24. Ask: "What must never appear in your videos?"
25. Examples: "stock photos of handshakes" or "jokes about price."
26. Default: "No extra exclusions beyond the safety rules."
27. If an answer includes customer identifying details, do not save them.
28. Say: "I cannot place customer details in this folder, but I can use an anonymized version."
29. Offer the anonymized wording.
30. Never save a carrier or contracted company name.
31. Replace it with "your carrier" or "the company."
32. Edit `brand/brand-kit.md` in one pass.
33. Replace every `[FILL]` marker.
34. Preserve the fixed video defaults.
35. Keep the voice ID field as `in .env`.
36. Keep the avatar ID field as `in .env`.
37. Never paste either ID into the brand kit.
38. Read the saved file once.
39. Confirm that no `[FILL]` marker remains.
40. Show the member a short summary and invite corrections.
41. Do not create a video in this skill.
42. No credits are used by this interview.
43. End in one plain-English paragraph.

# Outputs

- Updated `brand/brand-kit.md` with all nine answers.
- No video, audio, image, or remote generation.

The file keeps its fixed output, caption, hook, and end-card sections.

# Review checklist

- [ ] A supplied source was screened and used before asking only for missing fields.
- [ ] Every interview field has a useful answer.
- [ ] No `[FILL]` marker remains.
- [ ] Business name and offer are accurate.
- [ ] Audience and main call to action are clear.
- [ ] Two colors and a font preference are present.
- [ ] Tone has exactly three useful words.
- [ ] The exclusion answer is preserved.
- [ ] Voice and avatar references still say `in .env`.
- [ ] No private or restricted detail was saved.

# Never

- Never save client or customer identifying details.
- Never name an insurance carrier or contracted company.
- Never publish, post, upload, or send anything.
- Never write a key or token outside `.env`, or print `.env`.
- Never clone another person's face or voice without written consent.
- Never add another tool, account, or paid service without asking.
- Never spend HeyGen or ElevenLabs credits in this interview.
