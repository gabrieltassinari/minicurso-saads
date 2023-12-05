#/bin/bash
#
# Script para criar arquivos para os desafios do minicurso
#

MINICURSO=$HOME/lab5/minicurso
BACKUP=$HOME/.bkp

setup() {
	mkdir -p $MINICURSO $BACKUP

	cp minicurso-cola $MINICURSO
	cp minicurso-cola $BACKUP

	rm -rf minicurso-terminal .bash_history
}

setup
