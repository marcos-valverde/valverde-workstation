#!/usr/bin/env bash

LOG_FILE="$HOME/.valverde/logs/workstation.log"

log_write() {

    mkdir -p "$(dirname "$LOG_FILE")"

    printf "[%s] %s\n" \
        "$(date '+%Y-%m-%d %H:%M:%S')" \
        "$1" >> "$LOG_FILE"

}

log_info(){

color_info "$1"

log_write "INFO: $1"

}

log_success(){

color_success "$1"

log_write "SUCCESS: $1"

}

log_warning(){

color_warning "$1"

log_write "WARNING: $1"

}

log_error(){

color_error "$1"

log_write "ERROR: $1"

}