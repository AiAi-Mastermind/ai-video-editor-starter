#!/usr/bin/env bash

# This check never prints private values and always exits successfully.
set +e

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
env_file="$project_dir/.env"

local_elevenlabs_api_key=""
local_elevenlabs_voice_id=""
local_heygen_avatar_id=""
local_heygen_api_key=""
local_brand_name=""
local_default_output_sizes=""
local_test_clip_seconds=""

echo "Local required helpers"

if [ -f "$env_file" ]; then
  # Read only expected names from this folder's .env. Never execute its text.
  while IFS='=' read -r key_name key_value; do
    key_name="${key_name%$'\r'}"
    key_value="${key_value%$'\r'}"
    case "$key_name" in
      ELEVENLABS_API_KEY) local_elevenlabs_api_key="$key_value" ;;
      ELEVENLABS_VOICE_ID) local_elevenlabs_voice_id="$key_value" ;;
      HEYGEN_AVATAR_ID) local_heygen_avatar_id="$key_value" ;;
      HEYGEN_API_KEY) local_heygen_api_key="$key_value" ;;
      BRAND_NAME) local_brand_name="$key_value" ;;
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
check_command whisper "whisper (optional)"

check_value ELEVENLABS_API_KEY "$local_elevenlabs_api_key" MISSING
check_value ELEVENLABS_VOICE_ID "$local_elevenlabs_voice_id" MISSING
check_value HEYGEN_AVATAR_ID "$local_heygen_avatar_id" MISSING
check_value HEYGEN_API_KEY "$local_heygen_api_key" "OPTIONAL / NOT SET"
check_value BRAND_NAME "$local_brand_name" MISSING
check_value DEFAULT_OUTPUT_SIZES "$local_default_output_sizes" MISSING
check_value TEST_CLIP_SECONDS "$local_test_clip_seconds" MISSING

# Set CHECK_SETUP_OFFLINE=1 for an installation check only, with no network calls.
if [ "${CHECK_SETUP_OFFLINE:-0}" = "1" ]; then
  echo "ElevenLabs key check: NOT TESTED (installation check only; offline)"
elif [ -n "$local_elevenlabs_api_key" ] && command -v curl >/dev/null 2>&1; then
  status_code="$(printf 'header = "xi-api-key: %s"\n' "$local_elevenlabs_api_key" | curl -s -o /dev/null -w '%{http_code}' -K - https://api.elevenlabs.io/v1/voices 2>/dev/null)"
  case "$status_code" in
    200) echo "ElevenLabs key works" ;;
    401) echo "ElevenLabs key rejected (wrong or expired key)" ;;
    403) echo "ElevenLabs key is missing a permission (allow Voices read when you create the key)" ;;
    *) echo "ElevenLabs could not be reached" ;;
  esac
else
  echo "ElevenLabs key check: SKIPPED"
fi

echo "Connections to HeyGen and ElevenLabs are tested by the desk-check skill, not by this script."
exit 0
