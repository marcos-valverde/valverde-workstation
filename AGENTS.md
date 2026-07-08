# Valverde Workstation

## Filosofia

Construída por desenvolvedores.
Pensada para quem constrói soluções.

## Arquitetura

Kernel

Libraries

Services

Commands

Providers

## Convenções

Prefixos obrigatórios

core_

cmd_

color_

log_

validator_

term_

pkg_

install_

doctor_

project_

## Regras

Nunca duplicar código.

Sempre reutilizar bibliotecas.

Sempre utilizar logger.

Sempre utilizar validator.

Nunca executar comandos Linux diretamente nos Commands.

Commands chamam Services.

Services chamam Libraries.

Libraries conversam com o Sistema Operacional.

## Objetivo

Código simples.

Código elegante.

Código reutilizável.

Código fácil de manter.