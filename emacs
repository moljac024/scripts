#!/bin/bash
# This script is to be used with emacs running as server.
# If there is a present emacs frame, switch to it, otherwise
# create a new one. This way, you have only one emacs frame running.

emacsclient -c "$@"
