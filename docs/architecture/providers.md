# Sistema de Providers

A Valverde Workstation registra comandos por providers.

O fluxo principal é:

1. `bin/valverde` inicia o kernel.
2. O kernel carrega bibliotecas reutilizáveis.
3. O kernel carrega `scripts/kernel/registry.sh`.
4. Providers em `scripts/providers/*.provider` registram comandos.
5. O router apenas despacha para o comando registrado.

O router não deve conhecer comandos diretamente.

Para registrar um comando:

```bash
core_register_command "doctor" "cmd_doctor" "Executa validações do ambiente."
```

Comandos devem delegar regra de negócio para services.
