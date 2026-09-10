#!/usr/bin/env bash
# Usage: bash scripts/bootstrap.sh
# Installs every helper this project needs and registers the HeyGen connection.
# Safe to run twice. Never prints the contents of .env.
set +x
set -u

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
env_file="$project_dir/.env"
example_file="$project_dir/.env.example"
todo_file="$project_dir/.setup-next-steps.txt"
next_steps=()

say() { printf '%s\n' "$1"; }
note() { next_steps+=("$1"); }

say "Setting up your AI video editor. This takes a few minutes."
say ""

# ---------------------------------------------------------------- 1, Node.js
say "1 of 6, Node.js"
if command -v node >/dev/null 2>&1; then
  node_major="$(node -p 'process.versions.node.split(".")[0]' 2>/dev/null || echo 0)"
  if [ "${node_major:-0}" -ge 22 ] 2>/dev/null; then
    say "   Node.js $(node --version) is installed. Good."
  else
    say "   Node.js $(node --version) is too old. This project needs 22 or newer."
    note "Install Node.js 22 or newer from https://nodejs.org/ then run this setup again."
  fi
else
  say "   Node.js is not installed."
  note "Install Node.js 22 or newer from https://nodejs.org/ then run this setup again."
fi

# ------------------------------------------------------------------ 2, ffmpeg
say "2 of 6, ffmpeg, the video helper"
if command -v ffmpeg >/dev/null 2>&1; then
  say "   ffmpeg is installed. Good."
elif command -v brew >/dev/null 2>&1; then
  say "   Installing ffmpeg with Homebrew. This can take a few minutes."
  if brew install ffmpeg >/dev/null 2>&1 && command -v ffmpeg >/dev/null 2>&1; then
    say "   ffmpeg is installed. Good."
  else
    say "   ffmpeg did not install on its own."
    note "Open Terminal and run: brew install ffmpeg"
  fi
else
  say "   ffmpeg is missing and Homebrew is not installed."
  note "Install Homebrew from https://brew.sh/ then open Terminal and run: brew install ffmpeg"
fi

# ------------------------------------------------------------- 3, HyperFrames
say "3 of 6, HyperFrames, the renderer"
if command -v npm >/dev/null 2>&1; then
  if ! command -v hyperframes >/dev/null 2>&1; then
    say "   Installing HyperFrames."
    npm install -g hyperframes >/dev/null 2>&1
  fi
  if command -v hyperframes >/dev/null 2>&1; then
    say "   HyperFrames $(hyperframes --version 2>/dev/null) is installed. Good."
    say "   Installing the HyperFrames instructions your agent reads."
    if hyperframes skills update >/dev/null 2>&1; then
      say "   HyperFrames instructions are installed. You do not need the HyperFrames plugin."
    else
      say "   The HyperFrames instructions did not install on their own."
      note "Open Terminal and run: hyperframes skills update"
    fi
  else
    say "   HyperFrames did not install."
    note "Open Terminal and run: npm install -g hyperframes"
  fi
else
  say "   Skipped because npm is missing. Install Node.js first."
fi

# -------------------------------------------------------- 4, ElevenLabs CLI
say "4 of 6, the ElevenLabs command"
if command -v npm >/dev/null 2>&1; then
  if ! command -v elevenlabs >/dev/null 2>&1; then
    say "   Installing the official ElevenLabs command."
    npm install -g @elevenlabs/cli >/dev/null 2>&1
  fi
  if command -v elevenlabs >/dev/null 2>&1; then
    say "   The elevenlabs command is installed. It reads your key from .env."
    say "   You do not need the ElevenLabs plugin."
  else
    say "   The ElevenLabs command did not install."
    note "Open Terminal and run: npm install -g @elevenlabs/cli"
  fi
else
  say "   Skipped because npm is missing. Install Node.js first."
fi

# ------------------------------------------------------ 5, private settings
say "5 of 6, your private settings file"
if [ -f "$env_file" ]; then
  say "   .env already exists. Leaving it exactly as it is."
elif [ -f "$example_file" ]; then
  umask 077
  if cp "$example_file" "$env_file" 2>/dev/null; then
    say "   Created .env from the template. Nobody has read it, including this script."
    note "Open .env yourself and paste in your ElevenLabs key, voice ID and avatar ID. SETUP.md Step 6 shows how."
  else
    say "   .env could not be created."
    note "Copy .env.example to .env by hand, then fill it in."
  fi
else
  say "   .env.example is missing, so nothing was copied."
fi

# ------------------------------------------------------- 6, HeyGen connection
say "6 of 6, your HeyGen connection"
heygen_url="https://mcp.heygen.com/mcp/v1/"
registered_anywhere=0
if command -v codex >/dev/null 2>&1; then
  if codex mcp get heygen >/dev/null 2>&1; then
    say "   Codex already knows about HeyGen."
    registered_anywhere=1
  else
    codex_home="${CODEX_HOME:-$HOME/.codex}"
    mkdir -p "$codex_home" 2>/dev/null
    codex_config="$codex_home/config.toml"
    if [ ! -f "$codex_config" ] || ! LC_ALL=C grep -q '^\[mcp_servers\.heygen\]' "$codex_config" 2>/dev/null; then
      {
        printf '\n[mcp_servers.heygen]\n'
        printf '# Your HeyGen video clone. Added by the AI Video Editor starter.\n'
        printf 'url = "%s"\n' "$heygen_url"
      } >> "$codex_config" 2>/dev/null
    fi
    if codex mcp get heygen >/dev/null 2>&1; then
      say "   Registered HeyGen with Codex. No plugin needed."
      registered_anywhere=1
    else
      say "   HeyGen could not be registered with Codex automatically."
      note "Open Terminal and run: codex mcp add heygen --url $heygen_url"
    fi
  fi
  note "Sign in to HeyGen once. Open Terminal and run: codex mcp login heygen"
fi

if command -v claude >/dev/null 2>&1; then
  say "   Claude Code reads HeyGen from this folder's .mcp.json. No plugin needed."
  registered_anywhere=1
  note "In Claude Code, type /mcp and finish the HeyGen sign-in once."
fi

if [ "$registered_anywhere" -eq 0 ]; then
  say "   No agent command was found on this computer."
  note "HeyGen is already registered in this folder's .mcp.json and .codex/config.toml. Open the folder in your agent and sign in there."
fi

# ------------------------------------------------------------------- summary
say ""
say "Setup finished."
if [ "${#next_steps[@]}" -eq 0 ]; then
  say "Nothing is left for you to do. Start a new chat and ask for the desk check."
  rm -f "$todo_file" 2>/dev/null
else
  say "What is left for you to do:"
  index=1
  : > "$todo_file"
  for step in "${next_steps[@]}"; do
    say "  $index. $step"
    printf '%d. %s\n' "$index" "$step" >> "$todo_file"
    index=$((index + 1))
  done
  say ""
  say "These are also saved in .setup-next-steps.txt"
fi
say ""
say "Then START A NEW CHAT and ask for the desk check."
exit 0
