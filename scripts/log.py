#!/usr/bin/env python
# encoding: utf-8

from __future__ import print_function
import sys

def getversion(script=None):
    """Returns the version of this script
    Returns (str): a semver number 
    """
    import os
    from subprocess import check_output
    script_path = os.path.realpath(sys.argv[0])
    version = check_output(['git', 'describe', script_path])
    if len(version) == 0:
        return '0.0.0'
    return version

def log(module, msg):
    """Print in stadard formatted way to STDOUT

    Args:
        module (str): name of the invoking script
        msg (str): the message to be logged

    Returns: None

    """
    import datetime
    timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print('%s [%s] %s' % (timestamp, module, msg))

def error(module, msg):
    """Print in stadard formatted way to STDOUT

    Args:
        module (str): name of the invoking script
        msg (str): the message to be logged

    Returns: None

    """
    import datetime
    timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print('%s [%s] %s' % (timestamp, module, msg), file=sys.stderr)

def main(argv):
    pass

if __name__ == '__main__':
    main(sys.argv[1:])
