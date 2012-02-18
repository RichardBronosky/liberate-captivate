#!/usr/bin/env bash

# practice safe Bash
set -o nounset
set -o errexit

if uname -a | grep -iq darwin; then
    # Get it
    curl -LO https://github.com/downloads/Benjamin-Dobell/Heimdall/heimdall-1.3.1-mac.dmg
    # (hopefully only the url above should have to change as new releases come out)

    # Mount it
    open heimdall-*.dmg
    all_matches=($(ls -d /Volumes/HEIMDALL*))
    mount_point=${a[0]}

    # Install it
    open $mount_point/heimdall-*.mpkg
fi
