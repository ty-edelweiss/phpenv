#!/usr/bin/env bash

installer="${BASH_SOURCE[0]%.*}/installer.bash"

after_install '[ "${STATUS}" == "0" ] && source '${installer}
