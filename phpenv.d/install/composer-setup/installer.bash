#!/usr/bin/env bash

set -e
[ -n "$PHPENV_DEBUG" ] && set -x

COMPOSER_BIN=composer

EXPECTED_CHECKSUM="$(php -r "echo file_get_contents('https://composer.github.io/installer.sig');")"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ];
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
else
    php composer-setup.php --quiet --filename="$COMPOSER_BIN" --install-dir="$PREFIX/bin"
    rm composer-setup.php
fi
