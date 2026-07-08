#!/usr/bin/env bash

cmd_help() {

    local command
    local description

    term_title "Comandos disponíveis"

    while IFS= read -r command; do
        description="$(core_command_description "$command")"
        color_info "valverde $command - $description"
    done < <(core_registered_commands)

    term_blank

}
