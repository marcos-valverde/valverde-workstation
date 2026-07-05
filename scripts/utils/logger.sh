#!/usr/bin/env bash

LOG_DIR="$HOME/.valverde/logs"

mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/workstation.log"

log(){

local LEVEL="$1"

shift

echo "$(date '+%Y-%m-%d %H:%M:%S') [$LEVEL] $*" >> "$LOG_FILE"

}



log_info(){

log INFO "$@"

}

log_warn(){

log WARNING "$@"

}

log_error(){

log ERROR "$@"

}

log_success(){

log SUCCESS "$@"

}