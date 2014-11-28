#!/bin/bash

source $(dirname $(readlink -n -m $0))/log.bash
VERSION=$(getversion)
log "TEST" "Print version: $VERSION"

log "Print without module name"
log "TEST" "Print with module name"

error "Error without module name"
error "TEST" "Error with module name"
