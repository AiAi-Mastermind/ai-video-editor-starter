#!/usr/bin/env bash

# This check never prints private values and always exits successfully.
set +x
set +e

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
env_file="$project_dir/.env"

local_elevenlabs_api_key=""
local_elevenlabs_voice_id=""
local_heygen_avatar_id=""
local_heygen_api_key=""
local_default_output_sizes=""
local_test_clip_seconds=""

echo "Local required helpers"

if [ -f "$env_file" ]; then
  # Read only expected names from this folder's .env. Never execute its text.
  while IFS='=' read -r key_name key_value || [ -n "${key_name:-}" ]; do
    key_name="${key_name%$'\r'}"
    key_value="${key_value%$'\r'}"
    if [[ "$key_value" == \"*\" || "$key_value" == \'*\' ]]; then key_value="${key_value:1:${#key_value}-2}"; fi
    case "$key_name" in
      ELEVENLABS_API_KEY) local_elevenlabs_api_key="$key_value" ;;
      ELEVENLABS_VOICE_ID) local_elevenlabs_voice_id="$key_value" ;;
      HEYGEN_AVATAR_ID) local_heygen_avatar_id="$key_value" ;;
      HEYGEN_API_KEY) local_heygen_api_key="$key_value" ;;
      DEFAULT_OUTPUT_SIZES) local_default_output_sizes="$key_value" ;;
      TEST_CLIP_SECONDS) local_test_clip_seconds="$key_value" ;;
    esac
  done < "$env_file"
  echo "Environment file: FOUND"
else
  echo "Environment file: MISSING"
fi

check_command() {
  command_name="$1"
  display_name="$2"
  if command -v "$command_name" >/dev/null 2>&1; then
    echo "$display_name: FOUND"
  else
    echo "$display_name: MISSING"
  fi
}

check_value() {
  display_name="$1"
  value="$2"
  empty_status="$3"
  if [ -n "$value" ]; then
    echo "$display_name: PRESENT"
  else
    echo "$display_name: $empty_status"
  fi
}

check_command node "node"
check_command npm "npm"
check_command ffmpeg "ffmpeg"
check_command hyperframes "hyperframes"
check_command elevenlabs "elevenlabs command"
check_command codex "codex command (optional)"
check_command whisper "whisper (optional)"

check_value ELEVENLABS_API_KEY "$local_elevenlabs_api_key" MISSING
check_value ELEVENLABS_VOICE_ID "$local_elevenlabs_voice_id" MISSING
check_value HEYGEN_AVATAR_ID "$local_heygen_avatar_id" MISSING
check_value DEFAULT_OUTPUT_SIZES "$local_default_output_sizes" MISSING
check_value TEST_CLIP_SECONDS "$local_test_clip_seconds" MISSING

echo "HeyGen registration"

if [ -f "$project_dir/.mcp.json" ] && LC_ALL=C grep -q 'mcp.heygen.com' "$project_dir/.mcp.json" 2>/dev/null; then
  echo "HeyGen in this folder's settings: FOUND"
else
  echo "HeyGen in this folder's settings: MISSING"
fi

if command -v codex >/dev/null 2>&1; then
  if codex mcp get heygen >/dev/null 2>&1; then
    echo "HeyGen registered with Codex: FOUND (sign in once with: codex mcp login heygen)"
  else
    echo "HeyGen registered with Codex: MISSING (run: bash scripts/bootstrap.sh)"
  fi
else
  echo "HeyGen registered with Codex: NOT CHECKED (the codex command is not on this computer)"
fi

if [ -n "$local_heygen_api_key" ]; then
  echo "HEYGEN_API_KEY: PRESENT (this spends paid API credits, not your plan credits; leave it empty unless you meant to buy them)"
else
  echo "HEYGEN_API_KEY: EMPTY (correct for almost everyone)"
fi

# Set CHECK_SETUP_OFFLINE=1 for an installation check only, with no network calls.
if [ "${CHECK_SETUP_OFFLINE:-0}" = "1" ]; then
  echo "ElevenLabs key check: NOT TESTED (installation check only; offline)"
elif [ -n "$local_elevenlabs_api_key" ] && command -v curl >/dev/null 2>&1; then
  if [[ "$local_elevenlabs_api_key" =~ ^[A-Za-z0-9_-]+$ ]]; then
    response="$(printf 'header = "xi-api-key: %s"\n' "$local_elevenlabs_api_key" | curl -s --connect-timeout 15 --max-time 30 -w '\n%{http_code}' -K - https://api.elevenlabs.io/v1/voices 2>/dev/null)"
    curl_result=$?
    status_code="${response##*$'\n'}"
    response_body="${response%$'\n'*}"
    if [ "$curl_result" -ne 0 ]; then status_code=000; fi
    case "$status_code" in
      200) echo "ElevenLabs key works" ;;
      401|403)
        case "$response_body" in
          *missing_permissions*) echo "Your key is missing a permission. Make a new key with Voices set to Read, see SETUP.md Step 4" ;;
          *invalid_api_key*) echo "Wrong or expired key. Paste the whole key again with no extra spaces" ;;
          *) echo "ElevenLabs rejected the key" ;;
        esac ;;
      *) echo "ElevenLabs could not be reached" ;;
    esac
  else
    echo "Wrong or expired key. Paste the whole key again with no extra spaces"
  fi
else
  echo "ElevenLabs key check: SKIPPED"
fi

echo "If the line above says ElevenLabs key works, ElevenLabs is connected. No plugin is involved."
echo "HeyGen needs a one-time sign-in. It is not part of your key setup and it does not make this check fail."
echo "The HeyGen sign-in and the ElevenLabs speech test are checked by the desk-check skill."
exit 0
