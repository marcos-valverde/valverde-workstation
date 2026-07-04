#!/usr/bin/env bash

source "$ROOT_DIR/scripts/core/config.sh"
source "$ROOT_DIR/scripts/core/banner.sh"
source "$ROOT_DIR/scripts/core/router.sh"

show_banner

route "$@"