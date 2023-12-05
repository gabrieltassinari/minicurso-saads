#/bin/bash

LOCAL=$HOME/.minicurso-php

composer() {

	mkdir -p $LOCAL

	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"

	mv composer.phar $LOCAL

	echo "export PATH=\$PATH:$LOCAL" >> $HOME/.bashrc

	sudo sed -Ei 's/;extension=pdo_pgsql/extension=pdo_pgsql/g;s/;extension=pgsql/extension=pgsql/g' /etc/php/8.1/apache2/php.ini /etc/php/8.1/cli/php.ini
}

composer
