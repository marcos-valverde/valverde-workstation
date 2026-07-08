#!/usr/bin/env bash

source "$ROOT_DIR/configs/app.conf"
source "$ROOT_DIR/configs/paths.conf"

source "$ROOT_DIR/scripts/libraries/colors.sh"
source "$ROOT_DIR/scripts/libraries/terminal.sh"
source "$ROOT_DIR/scripts/libraries/logger.sh"
source "$ROOT_DIR/scripts/libraries/validator.sh"
source "$ROOT_DIR/scripts/libraries/package.manager.sh"
source "$ROOT_DIR/scripts/libraries/filesystem.sh"
source "$ROOT_DIR/scripts/libraries/spinner.sh"

source "$ROOT_DIR/scripts/doctor/banner.sh"
source "$ROOT_DIR/scripts/kernel/registry.sh"
source "$ROOT_DIR/scripts/kernel/router.sh"

core_load_providers
core_show_banner
core_route "$@"
