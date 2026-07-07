doctor_php() {

if validator_command_exists php; then

    log_success "PHP encontrado."

else

    log_error "PHP não encontrado."

fi

}