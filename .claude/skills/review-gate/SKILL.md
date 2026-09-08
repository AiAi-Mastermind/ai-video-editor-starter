---
name: review-gate
description: Use when the member says "review this draft," names a draft folder, or types "approved" after reviewing it.
---

# Purpose

Give a named draft one final safety and quality review.
Show the member a clear human checklist.
Copy files to approved only after the exact human decision in this session.

# Inputs

Read silently:

- `AGENTS.md`.
- `brand/brand-kit.md`.
- `compliance/rules.md`.
- `checks/review-checklist.md`.
- The named folder inside `output/drafts/`.
- Its `README.md`, script, transcript, and composition files.

Ask which draft folder only when none is named.
Give two or three recent folder names as examples.
Do not ask more than three questions.
"I do not know" means review the newest draft folder.

# Steps

1. Use no setup or connection tools. Confirm the target is inside `output/drafts/`.
2. Never review a broad path or unrelated folder.
3. Read the folder README and listed files.
4. Re-check every script and visible caption for client names.
5. Re-check for phone numbers, email addresses, and addresses.
6. Re-check for policy details, quote details, and identifying stories.
7. Re-check for insurance carrier names.
8. Re-check for contracted company names.
9. If any unsafe detail appears, mark the draft blocked.
10. Explain the issue without repeating the sensitive detail.
11. Offer an anonymized correction.
12. Confirm any clone belongs to the member.
13. For a team member, verify a signed line in `brand/consent.md`.
14. Inspect the final media without changing it.
15. Check that caption words match the audio.
16. Check that caption timing is readable.
17. Check that captions use no more than 6 words per line.
18. Check that captions stay in the bottom third.
19. Check each requested aspect ratio.
20. Confirm wide work is 16:9.
21. Confirm vertical work is 9:16.
22. Check safe margins so words are not clipped.
23. Compare colors with `brand/brand-kit.md`.
24. Check the brand name and any logo.
25. Check the opening hook appears for about 3 seconds.
26. Check that the call to action (CTA) is present and accurate.
27. Check that the end card lasts about 4 seconds.
28. Check for clean audio starts and endings.
29. Check for unexpected silence, clipping, or overlap.
30. Print all 12 boxes from `checks/review-checklist.md`.
31. Mark only checks supported by direct inspection.
32. Leave human judgment boxes empty.
33. Tell the member exactly what still needs watching.
34. Do not treat "looks good" as approval.
35. Do not treat approval from an earlier session as approval here.
36. Wait for the member to type "approved" in this session.
37. Only then may the reviewed draft be copied to `output/approved/`.
38. Preserve the draft folder README with the approved copy.
39. Use a dated folder with the same assignment name.
40. Do not overwrite an existing approved folder.
41. Never move anything to `output/posted/`.
42. Never open a social platform or upload destination.
43. Record approval date and the member's typed approval in the copied README.
44. Do not spend HeyGen or ElevenLabs credits during review.
45. If a fix is requested, return the work to its owning skill.
46. A new paid generation still needs the normal short test and estimate rules.
47. Re-run this full gate after any changed final render.
48. End with the required plain-English closing paragraph.

# Outputs

Before approval, print and keep the review checklist only.
If helpful, save `review.md` in the named draft folder.
After the member types "approved" in this session, copy the reviewed files to `output/approved/<date>-<assignment>/` and leave the original draft intact.
Never create a posted copy.

The agent may COPY a draft to `output/approved/` only after the member types the word approved in that session. The draft stays in `output/drafts/`. A person posts it.

# Review checklist

- [ ] The named folder is inside drafts.
- [ ] Compliance, consent, captions, ratios, colors, and CTA were checked.
- [ ] Problems are listed without repeating private details.
- [ ] Human judgment boxes remain for the member.
- [ ] Approval happened only after the member typed "approved" here.
- [ ] No file was posted, uploaded, or sent.

# Never

- Never repeat or preserve customer identifying details.
- Never allow a carrier or contracted company name.
- Never publish, post, upload, or send anything.
- Never expose a key, token, or the contents of `.env`.
- Never approve a clone without the required consent.
- Never add another tool, account, or paid service without asking.
- Never spend credits during review, and require a new test before any changed full generation.
