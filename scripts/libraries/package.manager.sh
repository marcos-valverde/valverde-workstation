#!/usr/bin/env bash

pkg_detect_manager() {

    if validator_command_exists apt; then
        printf '%s\n' "apt"
        return 0
    fi

    if validator_command_exists dnf; then
        printf '%s\n' "dnf"
        return 0
    fi

    if validator_command_exists pacman; then
        printf '%s\n' "pacman"
        return 0
    fi

    if validator_command_exists zypper; then
        printf '%s\n' "zypper"
        return 0
    fi

    return 1
}

pkg_run_as_root() {

    if validator_root; then
        "$@"
        return $?
    fi

    sudo "$@"
}

pkg_report_error() {

    if validator_command_exists color_error; then
        color_error "$1"
    fi

    return 1
}

pkg_require_manager() {

    local manager

    manager="$(pkg_detect_manager)" || {
        pkg_report_error "Nenhum gerenciador de pacotes suportado foi encontrado."
        return 1
    }

    printf '%s\n' "$manager"
}

pkg_update() {

    local manager

    manager="$(pkg_require_manager)" || return 1

    case "$manager" in
        apt)
            pkg_run_as_root apt update
            ;;
        dnf)
            # dnf retorna 100 quando existem atualizacoes disponiveis.
            pkg_run_as_root dnf check-update
            local status=$?
            [[ $status -eq 0 || $status -eq 100 ]]
            ;;
        pacman)
            pkg_run_as_root pacman -Sy
            ;;
        zypper)
            pkg_run_as_root zypper refresh
            ;;
        *)
            pkg_report_error "Gerenciador de pacotes nao suportado: $manager"
            ;;
    esac
}

pkg_install() {

    local manager

    if [[ $# -eq 0 ]]; then
        pkg_report_error "Informe ao menos um pacote para instalar."
        return 1
    fi

    manager="$(pkg_require_manager)" || return 1

    case "$manager" in
        apt)
            pkg_run_as_root apt install -y "$@"
            ;;
        dnf)
            pkg_run_as_root dnf install -y "$@"
            ;;
        pacman)
            pkg_run_as_root pacman -S --needed --noconfirm "$@"
            ;;
        zypper)
            pkg_run_as_root zypper install -y "$@"
            ;;
        *)
            pkg_report_error "Gerenciador de pacotes nao suportado: $manager"
            ;;
    esac
}
