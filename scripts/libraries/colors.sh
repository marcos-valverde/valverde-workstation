#!/usr/bin/env bash

COLOR_RESET="\033[0m"

COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[0;32m"
COLOR_YELLOW="\033[0;33m"
COLOR_BLUE="\033[0;34m"
COLOR_CYAN="\033[0;36m"

COLOR_BOLD="\033[1m"

color_title() {
    printf '%b\n' "${COLOR_BOLD}${COLOR_CYAN}$1${COLOR_RESET}"
}

color_info() {
    printf '%b\n' "${COLOR_BLUE}ℹ${COLOR_RESET} $1"
}

color_success() {
    printf '%b\n' "${COLOR_GREEN}✔${COLOR_RESET} $1"
}

color_warning() {
    printf '%b\n' "${COLOR_YELLOW}⚠${COLOR_RESET} $1"
}

color_error() {
    printf '%b\n' "${COLOR_RED}✖${COLOR_RESET} $1"
}

color_step() {
    printf '%b\n' "${COLOR_CYAN}➜${COLOR_RESET} $1"
}
