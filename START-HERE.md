# Start Here

Step 0. Have you finished SETUP.md? It installs the helpers, sets up your accounts, fills in your private settings, and connects HeyGen, ElevenLabs and HyperFrames. If not, do that first. When it is done, START A NEW CHAT in Codex or Claude Code, then paste this:

```text
Read AGENTS.md. Then run the desk check and tell me in plain English what is connected and what is not. Do not make any video yet.
```

Keep the default Codex model and set reasoning to Medium. Medium is enough for every video assignment, including HyperFrames builds. Use Low or the cheapest model for the desk check, brand-kit interview, and draft reviews. Use High only after the same render fails twice.

If you still need the private settings file, use this prompt as part of SETUP.md Step 6, then open the file yourself as that step explains:

```text
Copy .env.example to .env in this folder. Do not open it, read it, or show its contents. Tell me when it exists.
```

When all three tools are CONNECTED, choose a route.

## Route A, try the sample

```text
Run assignment 1 with the sample brief.
```

## Route B, use your business

```text
Fill in brand/brand-kit.md from <a file, a folder, or your website address>, ask me only about what is still missing, then run assignment 1.
```

Or paste: "Interview me for the brand kit."

One assignment per chat. Two chats can run at the same time; each assignment writes to its own `output/drafts/<date>-<assignment>/` folder. If that folder exists, the agent adds `-2`, then `-3`. The weekly batch is the exception that runs 1, 2 and 3 in one chat.

When you have a logo, drop it into `brand/assets/`. A logo is optional for the sample.

## Ask for a revision

Name the draft folder, then try one of these:

- "Keep the narration. Add two images and gentle movement."
- "Add light background music and keep the voice easy to hear."
- "Move the vertical captions away from my face and render a new version."

Earlier renders stay in the draft folder so you can compare them.
