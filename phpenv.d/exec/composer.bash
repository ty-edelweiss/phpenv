#!/usr/bin/env bash

set -e
[ -n "$PHPENV_DEBUG" ] && set -x

STATUS=0
PHPENV_COMPSER_BIN_PATH=$(phpenv which composer 2>/dev/null) || STATUS="$?"

if [[ "${STATUS}" == "0" && -z "${COMPOSER_HOME}" ]];
then
    export COMPOSER_HOME="${PHPENV_COMPSER_BIN_PATH%/bin*}"
fi
