# VERSIONING

Helper scripts to enable automatic versioning of scripts.

We are using semantic versioning to give script/programs version numbers: http://semver.org/

## Usage

This is helpful for logging the right version of the script.

e.g.

```bash
#!/bin/bash

source scripts/log.bash

VERSION=$(get_version)
log "TEST" "VERSION $VERSION"
```
