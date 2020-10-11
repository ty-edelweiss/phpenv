#!/usr/bin/env bash

INSTALLER="${BASH_SOURCE[0]%.*}/installer.bash"

after_install '[ "$STATUS" = "0" ] && source '$INSTALLER
