#!/usr/bin/env bash

# This check never prints private values and always exits successfully.
set +e

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
env_file="$project_dir/.env"

if [ -f "$env_file" ]; then
  # Read only expected names. Never run text from the file as a command.
  while IFS='=' read -r key_name key_value; do
    key_name="${key_name%$'\r'}"
    key_value="${key_value%$'\r'}"
    case "$key_name" in
      ELEVENLABS_API_KEY|ELEVENLABS_VOICE_ID|HEYGEN_AVATAR_ID|HEYGEN_API_KEY|BRAND_NAME|DEFAULT_OUTPUT_SIZES|TEST_CLIP_SECONDS)
        printf -v "$key_name" '%s' "$key_value"
        export "$key_name"
        ;;
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

check_key() {
  key_name="$1"
  key_value="${!key_name-}"
  if [ -n "$key_value" ]; then
    echo "$key_name: PRESENT"
  else
    echo "$key_name: MISSING"
  fi
}

check_command node "node"
check_command npm "npm"
check_command ffmpeg "ffmpeg"
check_command hyperframes "hyperframes"
check_command whisper "whisper (optional)"

check_key ELEVENLABS_API_KEY
check_key ELEVENLABS_VOICE_ID
check_key HEYGEN_AVATAR_ID
check_key HEYGEN_API_KEY
check_key BRAND_NAME
check_key DEFAULT_OUTPUT_SIZES
check_key TEST_CLIP_SECONDS

if [ -n "${ELEVENLABS_API_KEY-}" ] && command -v curl >/dev/null 2>&1; then
  status_code="$(curl -sS -o /dev/null -w '%{http_code}' \
    -H "xi-api-key: ${ELEVENLABS_API_KEY}" \
    https://api.elevenlabs.io/v1/user 2>/dev/null)"
  if [ "$status_code" = "200" ]; then
    echo "ElevenLabs key works"
  else
    echo "ElevenLabs key rejected"
  fi
else
  echo "ElevenLabs key check: SKIPPED"
fi

exit 0
