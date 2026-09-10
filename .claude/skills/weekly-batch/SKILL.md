---
name: weekly-batch
description: Use when the member says "weekly batch" or asks to run assignments 1, 2, and 3 from assignments/weekly-brief.md.
---

# Purpose

Run the three core video assignments as one careful weekly job.
Skip missing inputs without guessing.
Give the member one report for everything that needs review.

# Inputs

Read silently:

- `AGENTS.md`.
- `brand/brand-kit.md`.
- `compliance/rules.md`.
- `assignments/weekly-brief.md`.
- The three numbered assignment files.

Ask at most three questions for the whole batch.
Ask one question per message and include example answers.
"I do not know" means use the skill default.
Never invent a missing topic, clone brief, or recording.

# Steps

For new work, reserve a fresh draft folder. If it exists, add `-2`, then `-3` until creation succeeds. Use that chosen path in every command below. Revisions use the existing folder.

Decide connections from THIS chat only, never from another chat's README. ElevenLabs is CONNECTED when the setup script printed "ElevenLabs key works", regardless of chat tools; always use the speech script. HyperFrames is CONNECTED when `hyperframes --version` prints a version. HeyGen is CONNECTED when HeyGen tools are listed in this chat, and NOT SIGNED IN when they are not. A missing HeyGen sign-in is a normal first-run state, never a failure and never the member's fault. Stop only for a tool the named assignment requires. Review and brand-kit work require no connection. If a helper is missing entirely, give one command, `bash scripts/bootstrap.sh` (Windows: `scripts/bootstrap.ps1`), and never send the member to a Plugins sidebar.

1. Complete the READ phase from `AGENTS.md`.
2. If the member requested the sample brief, use `brand/sample-brand-kit.md` and skip the interview. Otherwise, run the brand interview if any `[FILL]` marker remains.
3. Run `bash scripts/check-setup.sh` once for the full batch.
4. Determine which assignments have inputs and include only those assignments.
5. Require exactly the tools each included assignment names in the CHECK table in `AGENTS.md`.
6. If a required tool is unavailable, use `SETUP.md` to explain the next connection step and stop that assignment. Do not stop for a tool that is optional for every included assignment.
7. Screen the whole weekly brief for customer details.
8. Screen it for carrier and contracted company names.
10. Offer anonymized wording when needed.
11. Create `output/drafts/<date>-weekly/`.
12. Make subfolders `clone-message/`, `faceless-explainer/`, and `shorts/` only as needed.
13. Check whether assignment 1 has a useful brief.
14. If it is missing, record "Assignment 1 skipped, brief missing."
15. If it is present, follow the `clone-message` skill.
16. Keep assignment 1 outputs in the weekly clone subfolder.
17. Check whether assignment 2 has a topic or page.
18. If it is missing, record "Assignment 2 skipped, topic missing."
19. If it is present, follow the `faceless-explainer` skill.
20. Keep assignment 2 outputs in the weekly explainer subfolder.
21. Check whether assignment 3 names one existing recording.
22. If it is missing, record "Assignment 3 skipped, recording missing."
23. If it is present, follow the `shorts-from-recording` skill.
24. Keep assignment 3 outputs in the weekly shorts subfolder.
25. Do not count a skipped item as a failure.
26. Before paid generation, add all expected clip lengths.
27. Estimate HeyGen and ElevenLabs credit use for the batch.
28. Tell the member before any generation over 60 seconds.
29. Make the required 10-second test for each new voice or avatar setup.
30. Reuse a passed test from this same session when settings are unchanged.
31. Never reuse a test after changing voice, avatar, pace, or language.
32. Generate work in assignment order, 1 then 2 then 3.
33. Stop one assignment if its tool fails, record why, then assess whether later work is safe.
34. Do not replace a failed core tool with another paid service.
35. Validate and inspect every HyperFrames composition.
36. Render the sizes required by each assignment.
37. Keep all results in `output/drafts/`.
38. Write `REPORT.md` at the weekly folder root.
39. Add a section called "What was made."
40. List every final file with a plain description.
41. Add a section called "What was skipped."
42. List missing inputs and tool failures.
43. Add a section called "What needs review."
44. Include all boxes from `checks/review-checklist.md`.
45. Add a section called "Credits."
46. Record estimated and known use for both paid tools.
47. Add links to each subfolder README.
48. End with the closing paragraph required by `AGENTS.md`.

# Outputs

Write within `output/drafts/<date>-weekly/`:

- `clone-message/` when assignment 1 has input.
- `faceless-explainer/` when assignment 2 has input.
- `shorts/` when assignment 3 has input.
- A `README.md` inside every created subfolder.
- `REPORT.md` for the complete batch.

# Review checklist

- [ ] Every included assignment followed its own skill.
- [ ] Missing inputs were skipped and named clearly.
- [ ] No customer details or restricted company names appear.
- [ ] Every paid full generation followed a short test.
- [ ] All requested sizes were rendered and inspected.
- [ ] Every final file remains in drafts.
- [ ] The report lists review needs and credits.

# Never

- Never include customer details or identifying stories.
- Never name a carrier or contracted company.
- Never publish, post, upload, send, or approve automatically.
- Never expose a key, token, or the contents of `.env`.
- Never clone another person without written consent.
- Never add another tool, account, or paid service without asking.
- Never run a long paid generation without a 10-second test and the required credit estimate.
