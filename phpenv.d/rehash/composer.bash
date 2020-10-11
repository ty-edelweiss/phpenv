#!/usr/bin/env bash

set -e
[ -n "$PHPENV_DEBUG" ] && set -x

cd "$PHPENV_ROOT"
make_shims versions/*/.composer/vendor/bin/*

STATUS=0
SYSTEM_COMPOSER_COMMANDPATH=$(PHPENV_VERSION="system" phpenv-which composer 2> /dev/null) || STATUS="$?"
if [[ "$STATUS" = "0" && -n "$SYSTEM_COMPOSER_COMMAND_PATH" ]];
then
    SYSTEM_COMPOSER_BIN_ROOT=$("$SYSTEM_COMPOSER_COMMAND_PATH" global config bin-dir --absolute)
    if [[ -n "$SYSTEM_COMPOSER_BIN_ROOT" && -d "$SYSTEM_COMPOSER_BIN_ROOT" ]];
    then
        make_shims $SYSTEM_COMPOSER_BIN_ROOT/*
    fi
fi
