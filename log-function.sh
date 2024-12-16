#!/usr/bin/env bash

set -eu

log() {
    if [[ ! -z $(command -v systemctl &> /dev/null) ]];
    then
        # Systemd is present
        logger --stderr --tag "build.sh" "$@"
    else
        # No Systemd, fall back to stderr
        echo "$@" >&2
    fi
}
#The function first checks if the systemctl command is available. If it is, it uses the logger command to log the message with the tag build.sh. If systemctl is not available, the function falls back to using echo to print the message to stderr.
# The log function can be used to log messages in a consistent way across different systems, whether they use Systemd or not. This can be useful for scripts that need to log messages for debugging or monitoring purposes.
# The &> is used to redirect both stdout and stderr to /dev/null, effectively suppressing any output from the command. The -z flag is used to check if the output of the command is empty, indicating that the command is not available. The [[ ... ]] syntax is used for conditional expressions in bash, and the ! -z condition checks if the output of the command is not empty.