#!/bin/bash
# shOTPad v0.1 by Dr. Waldijk
# https://github.com/DokterW/shOTPad - https://dokterw.me/
# A one-time pad bash script that creates one-time pads,
# encrypts and decrypts messages.
# -----------------------------------------------------------------------------------
#
OTPVER="0.1"
while :
do
    clear
    echo "[shOTPad - v$OTPVER]"
    echo ""
    echo "1. New/Load/Save one-time pad"
    echo "2. Encrypt"
    echo "3. Decrypt"
    echo "4. Quit"
    echo ""
    read -p "Enter menu option: " -s -n1 OTPADMENU
    case "$OTPADMENU" in
        1)
            exec ./otpnls.sh
        ;;
        2)
            exec ./otpencrypt.sh
        ;;
        3)
            exec ./otpdecrypt.sh
        ;;
        4)
            clear
            echo "No OTP loaded" > otp.load
            LISTOTP=""
            OTPLOAD=""
            OTPNLS=""
            OTPCHAR=""
            OTPNARE""
            OTPOWN=""
            OTPADMENU=""
            OTPMESSAGE=""
            OTPM=""
            OTPMWCNT=""
            CIPHER=""
            OTPAD=""
            OTPKEY=""
            OTPADKEY=""
            ONETIMEPAD=""
            OTPLOAD=""
            OTPVER=""
            printf "\033c"
            break
        ;;
    esac
done
