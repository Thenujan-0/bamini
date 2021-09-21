#!/bin/sh

# bool function to test if the user is root or not (POSIX only)
is_user_root () { [ "$(id -u)" -eq 0 ]; }

if is_user_root; then
    cp tamil-bamini.conf /usr/share/fcitx5/inputmethod/tamil-bamini.conf
    cp tamil-bamini.main.dict /usr/share/fcitx5/table/tamil-bamini.main.dict
    echo 'Installation success!'
    exit 0 # implicit, here it serves the purpose to be explicit for the reader
else
    echo 'You need sudo permissions to install.' >&2
    exit 1
fi
