#!/bin/sh

# bool function to test if the user is root or not (POSIX only)
is_user_root () { [ "$(id -u)" -eq 0 ]; }

if is_user_root; then
    cp tamil-bamini.conf /usr/share/fcitx5/inputmethod/tamil-bamini.conf
    mkdir -p /usr/share/fcitx5/table/
    cp tamil-bamini.main.dict /usr/share/fcitx5/table/tamil-bamini.main.dict
    #source this file to check if the environment variables are already configured
    source /etc/environment

    if [ "$GTK_IM_MODULE" = "" ];then
        echo "GTK_IM_MODULE=fcitx">> /etc/environment
    else
        echo "GTK_IM_MODULE is already set"
    fi



    if [ "$QT_IM_MODULE" = "" ];then
        echo "QT_IM_MODULE=fcitx">> /etc/environment
    else
        echo "QT_IM_MODULE is already set"
    fi




    if [ "$XMODIFIERS" = "" ];then
        echo "XMODIFIERS=@im=fcitx">> /etc/environment
    else
        echo "XMODIFIERS is already set"
    fi
    
    
    echo 'Installation success!'
    
    
    
    
    exit 0 # implicit, here it serves the purpose to be explicit for the reader
else
    echo 'You need sudo permissions to install.' >&2
    exit 1
fi
