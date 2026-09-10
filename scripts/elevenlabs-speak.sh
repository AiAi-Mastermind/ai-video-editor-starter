#!/usr/bin/env bash
# Usage: bash scripts/elevenlabs-speak.sh <text-file> <out.mp3>
# Private settings are parsed, never executed or printed.
set +x
set -euo pipefail
fail() { printf '%s\n' "$1"; exit 1; }
[ "$#" -eq 2 ] || fail 'Use this script with a text file and an output MP3 path.'
command -v node >/dev/null 2>&1 || fail 'Node is missing. Install Node.js, then run the setup command in SETUP.md Step 5.'
command -v curl >/dev/null 2>&1 || fail 'The download helper curl is missing.'
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
[ -r "$1" ] && [ -s "$1" ] || fail 'The speech text file is missing or empty.'
[ ! -e "$2" ] || fail 'That output file already exists. Choose a new MP3 file name.'
[ -d "$(dirname "$2")" ] || fail 'Create the output folder first.'
speech_key=''
speech_voice=''
[ -r "$project_dir/.env" ] || fail 'Private settings are missing. Follow SETUP.md Step 6.'
while IFS='=' read -r setting value || [ -n "${setting:-}" ]; do
  value="${value%$'\r'}"
  if [[ "$value" == \"*\" || "$value" == \'*\' ]]; then value="${value:1:${#value}-2}"; fi
  case "$setting" in
    ELEVENLABS_API_KEY) speech_key="$value" ;;
    ELEVENLABS_VOICE_ID) speech_voice="$value" ;;
  esac
done < "$project_dir/.env"
# Allow only token characters so curl configuration cannot be injected.
[[ "$speech_key" =~ ^[A-Za-z0-9_-]+$ ]] || fail 'Wrong or expired key. Paste the whole key again with no extra spaces'
[[ "$speech_voice" =~ ^[A-Za-z0-9_-]+$ ]] || fail 'Your voice ID is missing or not accepted. Check SETUP.md Step 6.'
umask 077
speech_body="$(mktemp)" || fail 'Could not prepare the speech request.'
speech_response="$(mktemp)" || { rm -f "$speech_body"; fail 'Could not prepare the speech request.'; }
trap 'rm -f "$speech_body" "$speech_response"' EXIT
if ! node - "$1" > "$speech_body" 2>/dev/null <<'JS'
const fs = require('fs');
const text = fs.readFileSync(process.argv[2], 'utf8');
if (!text.trim()) process.exit(1);
process.stdout.write(JSON.stringify({text, model_id:'eleven_multilingual_v2', voice_settings:{stability:0.45, similarity_boost:0.85, style:0.45, use_speaker_boost:true}}));
JS
then fail 'The speech text could not be read.'; fi
if ! speech_status="$(printf 'header = "xi-api-key: %s"\n' "$speech_key" | curl --silent --connect-timeout 15 --max-time 180 --config - --request POST --header 'Content-Type: application/json' --data-binary "@$speech_body" --output "$speech_response" --write-out '%{http_code}' "https://api.elevenlabs.io/v1/text-to-speech/$speech_voice?output_format=mp3_44100_128" 2>/dev/null)"; then
  fail 'ElevenLabs could not be reached. Try again when your connection is working.'
fi
if [ "$speech_status" = 200 ] && [ -s "$speech_response" ]; then
  cp "$speech_response" "$2" 2>/dev/null || fail 'The speech file could not be saved.'
  printf '%s\n' 'Speech saved.'
  exit 0
fi
if LC_ALL=C grep -q 'missing_permissions' "$speech_response"; then
  fail 'Your key is missing a permission. Make a new key with Text to Speech enabled, see SETUP.md Step 4.'
elif LC_ALL=C grep -q 'invalid_api_key' "$speech_response"; then
  fail 'Wrong or expired key. Paste the whole key again with no extra spaces'
elif LC_ALL=C grep -qiE 'quota|credit|insufficient' "$speech_response"; then
  fail 'Your ElevenLabs credits or quota are used up. Check your balance before trying again.'
else
  fail 'ElevenLabs did not accept the speech request. Check your voice and text, then try again.'
fi
