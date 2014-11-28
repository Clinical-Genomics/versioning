#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "USAGE: $0 script"
    echo ""
    echo "	Will output the git tag of this script"
    exit 1
fi

source $(dirname $(readlink -n -m "$0"))/log.bash

echo $(getversion)
