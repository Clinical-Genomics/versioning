#!/bin/bash

source log.bash
VERSION=$(getversion)
log "TEST" "Print version: $VERSION"

log "Print without module name"
log "TEST" "Print with module name"

error "Error without module name"
error "TEST" "Error with module name"
