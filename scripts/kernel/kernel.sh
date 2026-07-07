#!/usr/bin/env bash

#
# Configuração
#
source "$ROOT_DIR/scripts/core/config.sh"

#
# Utilidades
#
source "$ROOT_DIR/scripts/utils/colors.sh"
source "$ROOT_DIR/scripts/utils/logger.sh"
source "$ROOT_DIR/scripts/utils/terminal.sh"
source "$ROOT_DIR/scripts/utils/spinner.sh"

#
# Núcleo
#
source "$ROOT_DIR/scripts/core/banner.sh"
source "$ROOT_DIR/scripts/core/router.sh"

#
# Inicialização
#
core_show_banner
route "$@"