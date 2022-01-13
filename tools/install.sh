#!/usr/bin/env bash

_setup_colors() {
  # Use colors, but only if connected to a terminal, and that terminal
  # supports them.
  if hash tput >/dev/null 2>&1; then
    local ncolors=$(tput colors 2>/dev/null || tput Co 2>/dev/null || echo -1)
  fi

  if [[ -t 1 && -n $ncolors && $ncolors -ge 8 ]]; then
    local RED=$(tput setaf 1 2>/dev/null || tput AF 1 2>/dev/null)
    local GREEN=$(tput setaf 2 2>/dev/null || tput AF 2 2>/dev/null)
    local YELLOW=$(tput setaf 3 2>/dev/null || tput AF 3 2>/dev/null)
    local BLUE=$(tput setaf 4 2>/dev/null || tput AF 4 2>/dev/null)
    local BOLD=$(tput bold 2>/dev/null || tput md 2>/dev/null)
    local NORMAL=$(tput sgr0 2>/dev/null || tput me 2>/dev/null)
  else
    local RED=""
    local GREEN=""
    local YELLOW=""
    local BLUE=""
    local BOLD=""
    local NORMAL=""
  fi
}

_install_log() {
  local log_level="${$2-I}"
  local line="[$log_level]: $1"
  echo $line
  echo $line >> "${DOTFILES_PATH}/.install.log"
}

_install_safe_copy_file() {
  local target_file="$1"
  local source_file="$2"

  printf "${BLUE}Looking for pre-existing ${target_file} file...${NORMAL}\n"
  if [[ -f ${target_file} || -h ${target_file} ]]; then
    local target_backup="${target_file}.orig-backup-$(date +%Y%m%d%H%M%S)"
    _install_log "${YELLOW}Found ${target_file}.${NORMAL} ${GREEN}Backing up to $target_backup${NORMAL}\n"
    mv "${target_file}" "$target_backup"
  fi

  _install_log "Copy $source_file to $target_file"
  cp "$source_file" "$target_file"
}

_install_main() {
  _setup_colors

  if [[ ! $DOTFILES_PATH ]]; then
    DOTFILES_PATH=~/.dotfiles
  fi

  if [[ -d $DOTFILES_PATH ]]; then
    printf "${YELLOW}You already have dotfiles installed.${NORMAL}\n"
    printf "You'll need to remove $DOTFILES_PATH if you want to re-install.\n"
    return 1
  fi

  printf "${BLUE}Cloning Dotfiles...${NORMAL}\n"
  hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    return 1
  }
  env git clone --depth=1 https://github.com/nxtstep/dotfiles.git "$DOTFILES_PATH" || {
    printf "Error: git clone of dotfiles repo failed\n"
    return 1
  }

  # Installing the config files
  local -a config_files=({"$DOTFILES_PATH"}/config/"*")
  for path in "${config_files[@]}"; do
    if [[ -f $path ]]; then
      _install_safe_copy_file "~/$(basename ${path})" "$path"
    fi
  done

  set +e

  source ~/.bashrc
}

_install_main
