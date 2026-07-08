#!/usr/bin/env bash

cmd_info() {

term_title "$APP_NAME"

color_info "Versão    : $APP_VERSION"
color_info "Codename  : $APP_CODENAME"
color_info "Autor     : $AUTHOR"
color_info "Licença   : $LICENSE"

term_blank

color_info "$MOTTO"

term_blank

}
