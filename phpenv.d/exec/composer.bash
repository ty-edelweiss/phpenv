#!/usr/bin/env bash

set -e
[ -n "$PHPENV_DEBUG" ] && set -x

if [[ "$PHPENV_VERSION" != "system" && "$PHPENV_COMMAND" = "composer" ]];
then
    STATUS=0
    PHPENV_COMPOSER_COMMAND_PATH=$(phpenv-which composer 2> /dev/null) || STATUS="$?"
    if [[ "$STATUS" = "0" && -n "$PHPENV_COMPOSER_COMMAND_PATH" && -z "$COMPOSER_HOME" ]];
    then
        export COMPOSER_HOME="$PHPENV_ROOT/versions/$PHPENV_VERSION/.composer"
    fi
fi
