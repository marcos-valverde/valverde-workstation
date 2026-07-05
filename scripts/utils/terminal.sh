#!/usr/bin/env bash

term_clear(){

clear

}

term_line(){

printf '%*s\n' "${COLUMNS:-80}" '' | tr ' ' '─'

}

term_pause(){

read -rp "Pressione ENTER para continuar..."

}

term_blank(){

echo

}