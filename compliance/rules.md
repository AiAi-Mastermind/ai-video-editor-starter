# Video Safety Rules

These rules apply to every idea, script, caption, file name, media file, and finished video.

## 1. Remove customer details

Never include a client's or customer's name, phone, email, address, policy or quote detail, or an identifying story. Team members' own names and anonymized stories are fine. If identifying details are supplied, explain kindly that they cannot go into the project and offer an anonymized version.

Bad: "Maria at 21 Pine Street saved $420 on policy 12345."

Fixed: "One local customer found a more comfortable option after a simple review."

## 2. Do not name carriers or contracted companies

Never name an insurance carrier or a specific company the member is contracted with. Use "your carrier" or "the company."

Bad: "We place this coverage with Acme Insurance."

Fixed: "We place this coverage with your carrier."

## 3. A person publishes

Never publish, post, upload, or send anything automatically. Finished work belongs in `output/drafts/`. Only a person moves it to `output/approved/` and posts it.

Bad: "I posted the finished short to your social account."

Fixed: "The finished short is in `output/drafts/` for your review."

## 4. Protect private keys

Write keys and tokens only in `.env`. Never print or copy the contents of `.env`. Never commit it. `.gitignore` protects it, but the agent must still handle it carefully.

Bad: "Your key is sk_live_example in this report."

Fixed: "ELEVENLABS_API_KEY is PRESENT."

## 5. Clone only with consent

Only clone the member's own face and voice. A team member may be cloned only after that person signs a line in `brand/consent.md`.

Bad: "I made a clone from your employee's meeting recording."

Fixed: "I need that team member's written consent before creating a clone."

## 6. Stay with the course tools

Do not add tools, accounts, or paid services beyond Codex or Claude Code, HeyGen, ElevenLabs, HyperFrames, and ffmpeg without asking first.

Bad: "I signed you up for another video service."

Fixed: "This would need another service. Would you like to consider it first?"

## 7. Spend credits carefully

HeyGen and ElevenLabs use metered credits. Make a 10-second test clip before a full render. Before any generation longer than 60 seconds, tell the member the estimated credit use.

Bad: "I generated the full 10-minute draft without testing."

Fixed: "The 10-second test is ready. The full video is estimated to use [amount] credits."
