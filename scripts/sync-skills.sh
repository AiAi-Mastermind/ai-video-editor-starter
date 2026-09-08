#!/usr/bin/env bash

set -u
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="$project_dir/.agents/skills"
target_dir="$project_dir/.claude/skills"

if [ ! -d "$source_dir" ]; then
  echo "Codex skill folder is missing: .agents/skills"
  exit 1
fi

mkdir -p "$target_dir"
cp -R "$source_dir"/. "$target_dir"/

if diff -r "$source_dir" "$target_dir" >/dev/null; then
  echo "Skill copies match."
else
  echo "Skill copies do not match."
  diff -r "$source_dir" "$target_dir"
  exit 1
fi
