#!/bin/bash
# shOTPad v0.1 by Dr. Waldijk
# https://github.com/DokterW/shOTPad - https://dokterw.me/
# A one-time pad bash script that creates one-time pads,
# encrypts and decrypts messages.
# -----------------------------------------------------------------------------------
#
. ./funcpad.sh
. ./funcmod26.sh
ONETIMEPAD=$(cat otp.load)
OTPAD=$(cat $ONETIMEPAD)
OTPVER="0.1"
while :
do
    clear
    echo "[shOTPad - v$OTPVER]"
    echo ""
    echo "Loaded one-time pad has ${#OTPAD} characters left."
    echo ""
    echo "1. Enter message you wish to decrypt"
    echo "2. Back"
    echo ""
    read -p "Enter choice: " -s -n1 OTPKEY
    case "$OTPKEY" in
        1)
            clear
            echo "[shOTPad - v$OTPVER]"
            echo ""
            echo "Enter message (without spaces) you wish to decrypt and press enter:"
            read -p "> " OTPMESSAGE
            # Make message uppercase.
            OTPMESSAGE=$(echo $OTPMESSAGE | tr [a-z] [A-Z])
            # How many characters is the message.
            OTPMWCNT=$(echo ${#OTPMESSAGE})
            # Set counter and position in message before crypto sequence starts.
            OTPMCNTR=1
            OTPMPOS=0
            # Reads and (de/en)crypts one character at a time.
            until [ $OTPMCNTR -gt $OTPMWCNT ]
            do
                # Read one character and turn it into a number.
                OTPADKEY=$(echo ${OTPMESSAGE:$OTPMPOS:1})
                funcpad
                OTPAD=$(cat $ONETIMEPAD | cut -c 1)
                funcpad
                # Start cipher.
                CIPHER=$(expr $OTPADKEY - $OTPAD)
                funcmod26
                funcpad
                # Add to (en/de)crypted message.
                OTPM="$OTPM$CIPHER"
                # Add counter to position in message.
                OTPMCNTR=$(expr $OTPMCNTR + 1)
                OTPMPOS=$(expr $OTPMPOS + 1)
                OTPAD=$(cat $ONETIMEPAD | cut -c 2-)
                echo $OTPAD > $ONETIMEPAD
            done
            clear
            echo "[OTPad - v$OTPVER]"
            echo ""
            echo "Message:"
            echo "> $OTPMESSAGE"
            echo ""
            echo "> $OTPM"
            echo ""
            read -p "Press any key to continue... " -n1 -s
            OTPMESSAGE=""
            OTPM=""
        ;;
        2)
            clear
            OTPMESSAGE=""
            OTPM=""
            OTPMWCNT=""
            CIPHER=""
            OTPAD=""
            OTPKEY=""
            OTPADKEY=""
            ONETIMEPAD=""
            OTPVER=""
            printf "\033c"
            #break
            exec ./start.sh
        ;;
        *)
            clear
        ;;
    esac
done
