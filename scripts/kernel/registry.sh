#!/usr/bin/env bash

CORE_COMMANDS=()
CORE_COMMAND_HANDLERS=()
CORE_COMMAND_DESCRIPTIONS=()

core_command_index() {

    local command
    local index

    command="$1"

    for index in "${!CORE_COMMANDS[@]}"; do
        if [[ "${CORE_COMMANDS[$index]}" == "$command" ]]; then
            printf '%s\n' "$index"
            return 0
        fi
    done

    return 1
}

core_command_exists() {

    core_command_index "$1" >/dev/null 2>&1
}

core_register_command() {

    local command
    local handler
    local description

    command="$1"
    handler="$2"
    description="$3"

    if core_command_exists "$command"; then
        log_warning "Comando ja registrado: $command"
        return 0
    fi

    CORE_COMMANDS+=("$command")
    CORE_COMMAND_HANDLERS+=("$handler")
    CORE_COMMAND_DESCRIPTIONS+=("$description")
}

core_command_handler() {

    local index

    index="$(core_command_index "$1")" || return 1

    printf '%s\n' "${CORE_COMMAND_HANDLERS[$index]}"
}

core_command_description() {

    local index

    index="$(core_command_index "$1")" || return 1

    printf '%s\n' "${CORE_COMMAND_DESCRIPTIONS[$index]}"
}

core_registered_commands() {

    local command

    for command in "${CORE_COMMANDS[@]}"; do
        printf '%s\n' "$command"
    done
}

core_dispatch_command() {

    local command
    local handler

    command="${1:-help}"
    handler="$(core_command_handler "$command")"

    if [[ -z "$handler" ]]; then
        term_blank
        log_error "Comando desconhecido: $command"
        term_blank
        core_dispatch_command help
        return 1
    fi

    "$handler" "${@:2}"
}

core_load_provider() {

    local provider

    provider="$1"

    if validator_file_exists "$provider"; then
        source "$provider"
    fi
}

core_load_providers() {

    local provider

    for provider in "$ROOT_DIR"/scripts/providers/*.provider; do
        core_load_provider "$provider"
    done
}
