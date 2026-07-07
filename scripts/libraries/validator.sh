#!/usr/bin/env bash

validator_command_exists() {
    command -v "$1" >/dev/null 2>&1
}

validator_file_exists() {
    [[ -f "$1" ]]
}

validator_directory_exists() {
    [[ -d "$1" ]]
}

validator_internet() {
    ping -c1 github.com >/dev/null 2>&1
}

validator_root() {
    [[ $EUID -eq 0 ]]
}