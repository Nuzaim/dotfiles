#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_root="$repo_root/home"
manifest="$repo_root/links.txt"
target_home="${HOME:?HOME is not set}"
backup_root="$target_home/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

ensure_parent_dirs() {
  local relative_dir="$1"
  local current_source="$source_root"
  local current_target="$target_home"
  local part
  local target_relative

  [[ "$relative_dir" == "." ]] && return

  while [[ "$relative_dir" != "." ]]; do
    part="${relative_dir%%/*}"
    if [[ "$relative_dir" == "$part" ]]; then
      relative_dir="."
    else
      relative_dir="${relative_dir#*/}"
    fi

    current_source="$current_source/$part"
    current_target="$current_target/$part"
    target_relative="${current_target#"$target_home"/}"

    if [[ -L "$current_target" ]] && [[ "$(readlink -- "$current_target")" == "$current_source" ]]; then
      continue
    fi

    if [[ -L "$current_target" ]] || [[ -e "$current_target" && ! -d "$current_target" ]]; then
      mkdir -p -- "$backup_root/$(dirname -- "$target_relative")"
      mv -- "$current_target" "$backup_root/$target_relative"
      printf 'Backed up %s to %s\n' "$current_target" "$backup_root/$target_relative"
    fi

    mkdir -p -- "$current_target"
  done
}

link_path() {
  local source_path="$1"
  local relative_path="${source_path#"$source_root"/}"
  local target_path="$target_home/$relative_path"

  ensure_parent_dirs "$(dirname -- "$relative_path")"

  if [[ -L "$target_path" ]] && [[ "$(readlink -- "$target_path")" == "$source_path" ]]; then
    return
  fi

  if [[ -e "$target_path" || -L "$target_path" ]]; then
    mkdir -p -- "$backup_root/$(dirname -- "$relative_path")"
    mv -- "$target_path" "$backup_root/$relative_path"
    printf 'Backed up %s to %s\n' "$target_path" "$backup_root/$relative_path"
  fi

  ln -s -- "$source_path" "$target_path"
  printf 'Linked %s -> %s\n' "$target_path" "$source_path"
}

if [[ ! -f "$manifest" ]]; then
  printf 'Error: manifest not found: %s\n' "$manifest" >&2
  exit 1
fi

while IFS= read -r relative_path || [[ -n "$relative_path" ]]; do
  # Ignore blank lines and comments in the manifest.
  [[ -z "${relative_path//[[:space:]]/}" || "$relative_path" == \#* ]] && continue

  # Manifest entries are relative to home/ and may not escape it.
  case "$relative_path" in
    /*|.|..|../*|*/../*)
      printf 'Error: invalid manifest entry: %s\n' "$relative_path" >&2
      exit 1
      ;;
  esac

  source_path="$source_root/$relative_path"
  if [[ ! -e "$source_path" && ! -L "$source_path" ]]; then
    printf 'Error: manifest path does not exist: %s\n' "$source_path" >&2
    exit 1
  fi

  link_path "$source_path"
done < "$manifest"

printf 'Dotfiles installed from %s\n' "$source_root"
