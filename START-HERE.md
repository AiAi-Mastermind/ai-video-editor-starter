# Start Here

## Step 0, set up the folder

Just cloned this? Paste this into the chat:

```text
Read AGENTS.md, then run the setup for me.
```

One command installs ffmpeg, HyperFrames, the official `elevenlabs` command, and your `.env` file, and registers your HeyGen connection. There are no plugins to find and nothing to click. It is safe to run again at any time.

When it finishes it prints a short list of what is left for you. That list is normally two things: paste three values into `.env` yourself, and sign in to HeyGen once with `codex mcp login heygen` (in Claude Code, type `/mcp`). `SETUP.md` walks through the accounts, the voice clone, the avatar clone and the ElevenLabs key.

If you only need the private settings file, use this prompt as part of SETUP.md Step 6, then open the file yourself as that step explains:

```text
If .env does not exist, copy .env.example to .env without overwriting an existing file. Do not open or display private values. Tell me when .env exists.
```

## Step 1, check what is connected

START A NEW CHAT, then paste:

```text
Read AGENTS.md. Then run the desk check and tell me in plain English what is connected and what is not. Do not make any video yet.
```

A connection never shows up in the chat that was open when you made it, so the new chat matters.

You are ready when ElevenLabs and HyperFrames say CONNECTED. If HeyGen says NOT SIGNED IN, nothing is broken and you have not done anything wrong. Run `codex mcp login heygen`, start a new chat, and check again. Assignments 2 and 3 work without HeyGen in the meantime.

Keep the default Codex model and set reasoning to Medium. Medium is enough for every video assignment, including HyperFrames builds. Use Low or the cheapest model for the desk check, brand-kit interview, and draft reviews. Use High only after the same render fails twice.

## Step 2, choose a route

### Route A, try the sample

```text
Run assignment 1 with the sample brief.
```

### Route B, use your business

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
