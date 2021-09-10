#!/bin/bash
apt-get autoremove
apt-get clean
journalctl --vacuum-time=3d
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
rm -rf ~/.cache/thumbnails/*
