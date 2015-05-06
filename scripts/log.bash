#!/bin/bash

# Returns the version of the script
# Args
#    script (str, optional): name (and path to) script. When absent, takes the $0. Symlinks will be automatically resolved.
# Return (str): a semver of the scripts. When the script is not versioned, 0.0.0 is returned.
getversion() {
    if [[ -z $1 ]]; then
        SCRIPTNAME=$(basename "$0")
    else
        SCRIPTNAME=$1
    fi

    CWD=`pwd`
    cd $(dirname $(readlink -n -m $SCRIPTNAME))
    VERSION=$((git describe --tags | tail -1) 2> /dev/null)
    if [[ -z $VERSION ]]; then
        VERSION='0.0.0' # not versioned yet!
    fi
    cd $CWD
    echo $VERSION
}

# Echo's a timestamped message in the form of [timestamp] [module] message
# Args:
#   module (str, optional): the name of the invoking module. If missing, `basename $0` is taken.
#   message (str): the message to be printed
log() {
    NOW=$(timestamp)
    MODULE=$(getmodulename "$1" "$2")
    MSG=$(getmessage "$1" "$2")

    echo [${NOW}] [${MODULE}] ${MSG}
}

# Echo's a timestamped message to STDERR in the form of [timestamp] [module] message
# Args:
#   module (str, optional): the name of the invoking module. If missing, `basename $0` is taken.
#   message (str): the message to be printed
error() {
    NOW=$(timestamp)
    MODULE=$(getmodulename "$1" "$2")
    MSG=$(getmessage "$1" "$2")

    >&2 echo [${NOW}] [${MODULE}] ${MSG}
}

# Echo's the module name based on the input parameters of 'log()' or 'error()'
getmodulename() {
    if [[ -z $2 ]]; then
        MODULE=$(basename "$0")
    else
        MODULE=$1
    fi

    echo $MODULE
}

# Echo's the message based on the input parameters of 'log()' or 'error()'
getmessage() {
    if [[ -z $2 ]]; then
        MSG=$1
    else
        MSG=$2
    fi

    echo $MSG
}

# Echo's a formatted timestamp
timestamp() {
    echo $(date +"%Y%m%d%H%M%S")
}

