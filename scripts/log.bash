#!/bin/bash

# Returns the version of the script
# Args
#    script (str, optional): name (and path to) script. When absent, takes the $0. Symlinks will be automatically resolved.
# Return (str): a semver of the scripts. When the script is not versioned, 0.0.0 is returned.
getversion() {
    if [[ -z $1 ]]; then
        SCRIPTNAME=$1
    else
        SCRIPTNAME=$0
    fi

    CWD=`pwd`
    cd $(dirname `readlink -n $SCRIPTNAME`)
    VERSION=`git describe 2> /dev/null`
    if [[ -z $VERSION ]]; then
        VERSION='0.0.0' # not versioned yet!
    fi
    cd $CWD
    echo $VERSION
}

# Echo's a timestamped message in the form of [timestamp] [module] message
# Args:
#   module (str): the name of the invoking module
#   message (str): the message to be printed
log() {
    NOW=$(date +"%Y%m%d%H%M%S")
    echo [${NOW}] [${1}] $2
}

# Echo's a timestamped message to STDERR in the form of [timestamp] [module] message
# Args:
#   module (str): the name of the invoking module
#   message (str): the message to be printed
error() {
    NOW=$(date +"%Y%m%d%H%M%S")
    >&2 echo [${NOW}] [${1}] $2
}
