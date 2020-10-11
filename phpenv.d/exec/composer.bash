#!/usr/bin/env bash

set -e
[ -n "$PHPENV_DEBUG" ] && set -x

STATUS=0
PHPENV_COMPOSER_BIN_PATH=$(phpenv which composer 2>/dev/null) || STATUS="$?"

if [[ "${STATUS}" == "0" && -z "${COMPOSER_HOME}" ]];
then
    PHPENV_VERSION_ROOT="${PHPENV_COMPOSER_BIN_PATH%/bin*}"
    REAL_COMPOSER_HOME="${PHPENV_VERSION_ROOT}/.composer"
    export COMPOSER_HOME="${REAL_COMPOSER_HOME}"
fi
