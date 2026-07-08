#!/usr/bin/env bash

term_clear() {
    clear
}

term_print() {
    printf '%s\n' "$1"
}

term_blank() {
    printf '\n'
}

term_line() {
    printf '%*s\n' "${COLUMNS:-80}" '' | tr ' ' '='
}

term_title() {
    term_line
    color_title "$1"
    term_line
}

term_pause() {
    read -rp "Pressione ENTER para continuar..."
}
