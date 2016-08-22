#!/bin/bash
# shOTPad v0.1 by Dr. Waldijk
# https://github.com/DokterW/shOTPad - https://dokterw.me/
# A one-time pad bash script that creates one-time pads,
# encrypts and decrypts messages.
# -----------------------------------------------------------------------------------
MOD26="26"
MOD26NEG="-1"
function funcmod26 {
    if [ "$CIPHER" -ge "$MOD26" ]
        then
        CIPHER=$(expr $CIPHER - $MOD26)
    elif [ "$CIPHER" -le "$MOD26NEG" ]
        then
        CIPHER=$(expr $CIPHER + $MOD26)
    fi
}
