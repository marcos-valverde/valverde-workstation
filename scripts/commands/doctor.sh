#!/usr/bin/env bash

source "$ROOT_DIR/scripts/services/doctor.service.sh"
source "$ROOT_DIR/scripts/doctor/php.sh"

cmd_doctor() {

    local status

    term_title "Doctor"
    doctor_run
    status=$?
    term_blank
    return "$status"

}
