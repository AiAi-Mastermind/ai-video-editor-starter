#!/usr/bin/env bash
# Print only one allowed ID. Never execute settings or reveal other values.
set +x
if [ "$#" -ne 1 ]; then
  printf '%s\n' 'That name is not allowed'
  exit 0
fi
case "$1" in
  ELEVENLABS_VOICE_ID|HEYGEN_AVATAR_ID) ;;
  *) printf '%s\n' 'That name is not allowed'; exit 0 ;;
esac
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)" || exit 0
id_file="$project_dir/.env"
[ -r "$id_file" ] || exit 0
# Match just the requested assignment. Do not source the file.
awk -v wanted="$1" '
  index($0, wanted "=") == 1 {
    value = substr($0, length(wanted) + 2)
    sub(/\r$/, "", value)
    if (length(value) >= 2) {
      first = substr(value, 1, 1)
      last = substr(value, length(value), 1)
      if ((first == "\"" && last == "\"") || (first == sprintf("%c", 39) && last == first))
        value = substr(value, 2, length(value) - 2)
    }
    print value
    exit
  }
' "$id_file"
exit 0
