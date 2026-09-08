#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v git >/dev/null 2>&1; then
  printf 'Error: git is required but was not found.\n' >&2
  exit 1
fi

if ! command -v bash >/dev/null 2>&1; then
  printf 'Error: bash is required but was not found.\n' >&2
  exit 1
fi

if ! command -v nvim >/dev/null 2>&1; then
  printf 'Warning: nvim was not found; installing its configuration anyway.\n' >&2
fi

exec "$repo_root/install.sh"
