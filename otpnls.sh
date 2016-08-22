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
    OTPLOAD=$(cat otp.load)
    LISTOTP=$(ls -1 otp/)
    clear
    echo "[shOTPad - v$OTPVER]"
    echo ""
    echo "1. New One-Time Pad"
    echo "2. Load One-Time Pad ($OTPLOAD)"
    echo "3. Unload One-Time Pad"
    echo "4. List One-Time Pads"
    echo "5. Back"
    echo ""
    read -p "Enter menu option: " -s -n1 OTPNLS
    case "$OTPNLS" in
        1)
            clear
            echo "[shOTPad - v$OTPVER]"
            echo ""
            read -p "Enter (code) name of receiver: " OTPNARE
            read -p "Enter (code) name of sender (you): " OTPOWN
            read -p "Enter the length of your One-Time Pad: " OTPCHAR
            cat /dev/urandom | tr -dc 'A-Z' | fold -w $OTPCHAR | head -n 1 > otp/otp-$OTPNARE.pad
            cp otp/otp-$OTPNARE.pad otp/otp-$OTPOWN.pad
            OTPNARE=""
            OTPOWN=""
            OTPCHAR=""
            echo ""
            echo "One-Time Pad created. Share it securely with your contact."
            echo ""
            read -p "Press any key to continue... " -n1 -s
        ;;
        2)
            clear
            echo "[shOTPad - v$OTPVER]"
            echo ""
            echo "One-time pads:"
            echo "$LISTOTP"
            echo ""
            read -p "Enter name of one-time pad: " OTPLOAD
            echo "otp/$OTPLOAD" > otp.load
            echo ""
            echo "One-Time Pad loaded and ready for use."
            echo ""
            read -p "Press any key to continue... " -n1 -s
        ;;
        3)
            clear
            echo "[shOTPad - v$OTPVER]"
            #OTPLOAD=""
            echo "No OTP loaded" > otp.load
            echo ""
            echo "One-Time Pad unload loaded."
            echo ""
            read -p "Press any key to continue... " -n1 -s
        ;;
        4)
            clear
            echo "[shOTPad - v$OTPVER]"
            echo ""
            echo "One-time pads:"
            echo "$LISTOTP"
            echo ""
            read -p "Press any key to continue... " -n1 -s
        ;;
        5)
            clear
            LISTOTP=""
            OTPLOAD=""
            OTPNLS=""
            OTPCHAR=""
            OTPNARE""
            OTPOWN=""
            OTPVER=""
            printf "033c"
            exec ./start.sh
        ;;
    esac
done
