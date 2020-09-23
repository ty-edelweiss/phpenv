#!/usr/bin/env bash

function composer_setup_hook() {
  local INSTALLER="${BASH_SOURCE[0]%.*}/installer.bash"
  cat <<SH
if [ "${STATUS}" == "0" ];
then
    source ${INSTALLER}
fi
SH
}

after_install "$(composer_setup_hook)"
