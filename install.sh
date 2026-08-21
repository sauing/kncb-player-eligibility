#!/usr/bin/env sh
set -eu

skill_name="kncb-player-eligibility"
source_directory=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
codex_directory="${CODEX_HOME:-${HOME}/.codex}"
skills_directory="${codex_directory}/skills"
destination_directory="${skills_directory}/${skill_name}"
force="false"

if [ "${1:-}" = "--force" ]; then
  force="true"
fi

if [ -e "$destination_directory" ]; then
  if [ "$force" != "true" ]; then
    echo "The skill is already installed at '$destination_directory'." >&2
    echo "Run with --force only if you intend to replace it." >&2
    exit 1
  fi

  rm -rf -- "$destination_directory"
fi

mkdir -p -- "$skills_directory"
cp -R -- "$source_directory" "$destination_directory"

echo "Installed $skill_name at $destination_directory"
echo 'Start a new Codex task and invoke: $kncb-player-eligibility'

