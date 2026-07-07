#!/usr/bin/env bash

source "$ROOT_DIR/scripts/commands/help.sh"
source "$ROOT_DIR/scripts/commands/version.sh"

route() {

COMMAND="${1:-help}"

case "$COMMAND" in

help)

cmd_help

;;

version)

cmd_version

;;

about)

cmd_about

;;

*)

echo
echo "Comando desconhecido: $COMMAND"
echo
cmd_help

;;

esac

}