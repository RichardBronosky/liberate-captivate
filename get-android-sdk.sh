#!/usr/bin/env bash

# practice safe Bash
set -o nounset
set -o errexit

if uname -a | grep -iq darwin; then
    PLATFORM=macosx
    curl -LO http://dl.google.com/android/android-sdk_r16-macosx.zip
    unzip android-sdk_r16-macosx.zip 
elif uname -a | grep -iq linux; then
    PLATFORM=linux
    curl -LO http://dl.google.com/android/android-sdk_r16-linux.tgz
    tar zxf android-sdk_r16-linux.tgz 
fi
# Imagine how much more DRY this could be if Google would just stick with tar!
cd android-sdk-$PLATFORM

# Get just the platform tools. All you need is adb.
tools/android update sdk --no-ui --filter platform-tool
