doctor_php() {

    if validator_command_exists php; then

        log_success "PHP encontrado."
        return 0

    else

        log_error "PHP não encontrado."
        return 1

    fi

}
