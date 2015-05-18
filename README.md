# VERSIONING

Helper scripts to enable automatic versioning of scripts.

We are using semantic versioning to give script/programs version numbers: http://semver.org/

## Usage

### Getting the script version number for logging

```bash
$ ./getscriptversion.sh yourscript
```

### Getting the script version number from within a script

e.g.

```bash
#!/bin/bash

source $(dirname $(readlink -n -m $0))/log.bash
VERSION=$(getversion)
log $0 "Current version: $VERSION"
```

