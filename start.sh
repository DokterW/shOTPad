#!/bin/bash
# shOTPad v2.0
# Made by Dr. Waldijk
# A one-time pad bash script that creates one-time pads, encrypts and decrypts messages.
# Read the README.md for more info, but you will also find some info below.
# By running this script you agree to the license terms.
# Config ----------------------------------------------------------------------------
OTPNAM="shOTPad"
OTPVER="2.0"
# OTPARG=$1
# Funtions --------------------------------------------------------------------------
funcmod26 () {
    MOD26="26"
    MOD26NEG="1" # -1
    if [[ "$CIPHER" -gt "$MOD26" ]]; then
        CIPHER=$(expr $CIPHER - $MOD26)
    elif [[ "$CIPHER" -lt "$MOD26NEG" ]]; then
        CIPHER=$(expr $CIPHER + $MOD26)
    fi
}
funcpad () {
    OTPALL="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    OTPCNT="0"
    until [[ "$OTPCNT" = "26" ]]; do
        OTPCNT=$(expr $OTPCNT + 1)
        OTPABC[$OTPCNT]=$(echo "$OTPALL" | cut -c $OTPCNT)
    done
    if [[ "$1" = "otpadkey" ]]; then
        case $OTPADKEY in
            [aA-zZ])
                OTPCNT="0"
                OTPADKEY=$(echo "$OTPADKEY" | tr [a-z] [A-Z])
                while :; do
                    OTPCNT=$(expr $OTPCNT + 1)
                    OTPTST=$(echo "$OTPALL" | cut -c $OTPCNT)
                    if [[ "$OTPTST" = "$OTPADKEY" ]]; then
                        break
                    fi
                done
                OTPADKEY="$OTPCNT"
            ;;
        esac
    elif [[ "$1" = "otpad" ]]; then
        case $OTPAD in
            [aA-zZ])
                OTPCNT="0"
                OTPAD=$(echo "$OTPAD" | tr [a-z] [A-Z])
                while :; do
                    OTPCNT=$(expr $OTPCNT + 1)
                    OTPTST=$(echo "$OTPALL" | cut -c $OTPCNT)
                    if [[ "$OTPTST" = "$OTPAD" ]]; then
                        break
                    fi
                done
                OTPAD="$OTPCNT"
            ;;
        esac
    elif [[ "$1" = "cipher" ]]; then
        case $CIPHER in
            [1-9]|[1-][0-9])
                CIPHER="${OTPABC[$CIPHER]}"
                echo "${OTPABC[$CIPHER]}"
            ;;
        esac
    fi
}
# -----------------------------------------------------------------------------------
while :
do
    clear
    echo "[$OTPNAM - v$OTPVER]"
    echo ""
    echo "1. New/Load/Save one-time pad"
    echo "2. Encrypt"
    echo "3. Decrypt"
    echo "4. Quit"
    echo ""
    read -p "Enter menu option: " -s -n1 OTPADMENU
    case "$OTPADMENU" in
        1)
            while :; do
            OTPLOAD=$(cat otp.load)
            LISTOTP=$(ls -1 otp/)
            clear
            echo "[$OTPNAM - v$OTPVER]"
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
                    echo "[$OTPNAM - v$OTPVER]"
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
                    echo "[$OTPNAM - v$OTPVER]"
                    echo ""
                    echo "One-time pads:"
                    echo "$LISTOTP"
                    echo ""
                    read -p "Enter name of one-time pad: " OTPLOAD
                    if [[ -n "$OTPLOAD" ]]; then
                        echo "otp/$OTPLOAD" > otp.load
                    fi
                    echo ""
                    echo "One-Time Pad loaded and ready for use."
                    echo ""
                    read -p "Press any key to continue... " -n1 -s
                ;;
                3)
                    clear
                    echo "[$OTPNAM - v$OTPVER]"
                    #OTPLOAD=""
                    echo "No OTP loaded" > otp.load
                    echo ""
                    echo "One-Time Pad unload loaded."
                    echo ""
                    read -p "Press any key to continue... " -n1 -s
                ;;
                4)
                    clear
                    echo "[$OTPNAM - v$OTPVER]"
                    echo ""
                    echo "One-time pads:"
                    echo "$LISTOTP"
                    echo ""
                    read -p "Press any key to continue... " -n1 -s
                ;;
                5)
                    break
                ;;
            esac
        done
        ;;
        [2-3])
            ONETIMEPAD=$(cat otp.load)
            OTPAD=$(cat $ONETIMEPAD)
            while :; do
            clear
            echo "[$OTPNAM - v$OTPVER]"
            echo ""
            echo "Loaded one-time pad has ${#OTPAD} characters left."
            echo ""
            echo "1. Enter message you wish to encrypt"
            echo "2. Back"
            echo ""
            read -p "Enter choice: " -s -n1 OTPKEY
            case "$OTPKEY" in
                1)
                    clear
                    echo "[$OTPNAM - v$OTPVER]"
                    echo ""
                    if [[ $OTPADMENU = 2 ]]; then
                        echo "Enter message (without spaces) you wish to encrypt and press enter:"
                    elif [[ $OTPADMENU = 3 ]]; then
                        echo "Enter message (without spaces) you wish to decrypt and press enter:"
                    fi
                    read -p "> " OTPMESSAGE
                    # Make message uppercase.
                    OTPMESSAGE=$(echo $OTPMESSAGE | tr [a-z] [A-Z])
                    # How many characters is the message.
                    OTPMWCNT=$(echo ${#OTPMESSAGE})
                    # Set counter and position in message before crypto sequence starts.
                    OTPMCNTR=1
                    OTPMPOS=0
                    # Reads and (de/en)crypts one character at a time.
                    until [[ $OTPMCNTR -gt $OTPMWCNT ]]; do
                        # Read one character and turn it into a number.
                        OTPADKEY=$(echo ${OTPMESSAGE:$OTPMPOS:1})
#                        OTPAD=$(echo ${OTPMESSAGE:$OTPMPOS:1})
                        funcpad otpadkey
#                        OTPADKEY=$OTPAD
                        OTPAD=$(cat $ONETIMEPAD | cut -c 1)
                        funcpad otpad
                        # Start cipher.
                        if [[ $OTPADMENU = 2 ]]; then
                            CIPHER=$(expr $OTPADKEY + $OTPAD)
                        elif [[ $OTPADMENU = 3 ]]; then
                            CIPHER=$(expr $OTPADKEY - $OTPAD)
                        fi
                        funcmod26
                        funcpad cipher
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
                    break
                ;;
            esac
            done
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
            OTPNAM=""
            ABCOALL=""
            OTPALL=""
            ABCOCNT=""
            OTPCNT=""
            OTPABC=""
            printf "\033c"
            break
        ;;
    esac
done
