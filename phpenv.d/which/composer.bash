#!/usr/bin/env bash

set -e
[ -n "$PHPENV_DEBUG" ] && set -x

if [ "$PHPENV_VERSION" != "system" ];
then
    PHPENV_COMPOSER_BIN_ROOT="$PHPENV_ROOT/versions/$PHPENV_VERSION/.composer/vendor/bin"
elif [ "$PHPENV_COMMAND" != "composer" ];
then
    STATUS=0
    SYSTEM_COMPOSER_COMMAND_PATH=$(phpenv-which composer 2> /dev/null) || STATUS="$?"
    if [[ "$STATUS" = "0" && -n "$SYSTEM_COMPOSER_COMMAND_PATH" ]];
    then
        PHPENV_COMPOSER_BIN_ROOT=$("$SYSTEM_COMPOSER_COMMAND_PATH" -q global config bin-dir --absolute)
    fi
fi

if [[ -n "$PHPENV_COMPOSER_BIN_ROOT" && -x "$PHPENV_COMPOSER_BIN_ROOT/$PHPENV_COMMAND" ]];
then
    PHPENV_COMMAND_PATH="$PHPENV_COMPOSER_BIN_ROOT/$PHPENV_COMMAND"
fi
