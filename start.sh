#!/bin/bash
# shOTPad v2.2
# Made by Dokter
# A one-time pad bash script that creates one-time pads, encrypts and decrypts messages.
# Read the README.md for more info, but you will also find some info below.
# By running this script you agree to the license terms.
# Config ----------------------------------------------------------------------------
OTPNAM="shOTPad"
OTPVER="2.2"
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
            [1-9]|[1-2][0-9])
                CIPHER="${OTPABC[$CIPHER]}"
            ;;
        esac
    fi
}
funclst () {
    OTPLOAD=$(cat otp.load)
    LISTOTP=$(ls -1 otp/)
}
# -----------------------------------------------------------------------------------
while :
do
    clear
    echo "[$OTPNAM v$OTPVER]"
    echo ""
    echo "(E)ncrypt"
    echo "(D)ecrypt"
    echo ""
    echo "(N)ew OTP / (L)oad OTP / (U)nload OTP / L(i)st OTPs / (Q)uit"
    read -p "> " -s -n1 OTPADMENU
    OTPADMENU=$(echo "$OTPADMENU" | tr [a-z] [A-Z])
    case "$OTPADMENU" in
        [ED])
            ONETIMEPAD=$(cat otp.load)
            OTPAD=$(cat $ONETIMEPAD)
            while :; do
            clear
            echo "[$OTPNAM v$OTPVER]"
            echo ""
            if [[ -z "$OTPAD" ]]; then
                echo "No One-Time Pad loaded or it is empty."
            else
                echo "Loaded One-Time Pad has ${#OTPAD} characters left."
                if [[ "${#OTPAD}" -le "16" ]]; then
                    echo "Caution: One-Time Pad is almost empty!"
                fi
            fi
            echo ""
            if [[ $OTPADMENU = "E" ]]; then
                echo "(E)ncrypt message."
            elif [[ $OTPADMENU = "D" ]]; then
                echo "Decrypt message."
            fi
            echo "(B)ack"
            echo ""
            read -p "> " -s -n1 OTPKEY
            OTPKEY=$(echo "$OTPKEY" | tr [a-z] [A-Z])
            case "$OTPKEY" in
                [ED])
                    clear
                    # Only continue if there is an OTP loaded.
                    if [[ -n "$OTPAD" ]]; then
                        echo "[$OTPNAM v$OTPVER]"
                        echo ""
                        if [[ $OTPADMENU = "E" ]]; then
                            echo "Enter message (without spaces) you wish to encrypt and press enter:"
                        elif [[ $OTPADMENU = "D" ]]; then
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
                            if [[ $OTPADMENU = "E" ]]; then
                                CIPHER=$(expr $OTPADKEY + $OTPAD)
                            elif [[ $OTPADMENU = "D" ]]; then
                                CIPHER=$(expr $OTPADKEY - $OTPAD)
                            fi
                            # Modulo 26
                            funcmod26
                            # Ciphertext
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
                        echo "[$OTPNAM v$OTPVER]"
                        echo ""
                        echo "Message:"
                        echo "> $OTPMESSAGE"
                        echo ""
                        echo "> $OTPM"
                        echo ""
                        if [[ $OTPADMENU = "E" ]]; then
                            echo "[copy ciphertext and send it to your contact]"
                        elif [[ $OTPADMENU = "D" ]]; then
                            echo "[do not copy/paste]"
                        fi
                        echo ""
                        read -p "Press any key to continue... " -n1 -s
                        OTPMESSAGE=""
                        OTPM=""
                    fi
                ;;
                B)
                    break
                ;;
            esac
            done
        ;;
        N)
            funclst
            clear
            echo "[$OTPNAM v$OTPVER]"
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
        L)
            funclst
            clear
            echo "[$OTPNAM v$OTPVER]"
            echo ""
            echo "One-time pads:"
            echo "$LISTOTP"
            echo ""
            echo "Enter name of one-time pad:"
            read -p "> " OTPLOAD
            if [[ -n "$OTPLOAD" ]]; then
                echo "otp/$OTPLOAD" > otp.load
                clear
                echo "[$OTPNAM v$OTPVER]"
                echo ""
                echo "One-Time Pad loaded and ready for use."
                echo ""
                read -p "Press any key to continue... " -n1 -s
            else
                clear
                echo "[$OTPNAM v$OTPVER]"
                echo ""
                echo "No One-Time Pad loaded."
                echo ""
                read -p "Press any key to continue... " -n1 -s
            fi
        ;;
        U)
            clear
            echo "[$OTPNAM v$OTPVER]"
            #OTPLOAD=""
            echo "No OTP loaded" > otp.load
            echo ""
            echo "One-Time Pad unloaded."
            echo ""
            read -p "Press any key to continue... " -n1 -s
        ;;
        I)
            funclst
            clear
            echo "[$OTPNAM v$OTPVER]"
            echo ""
            echo "One-time pads:"
            echo "$LISTOTP"
            echo ""
            read -p "Press any key to continue... " -n1 -s
        ;;
        Q)
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
