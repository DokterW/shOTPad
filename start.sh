#!/bin/bash
# shOTPad v1.0.1 by Dr. Waldijk
# https://github.com/DokterW/shOTPad - https://dokterw.me/
# A one-time pad bash script that creates one-time pads,
# encrypts and decrypts messages.
# Read the README.md for more info.
# By running this script you agree to the license terms.
# Funtions --------------------------------------------------------------------------
funcmod26 ()
{
    MOD26="26"
    MOD26NEG="-1"
    if [ "$CIPHER" -ge "$MOD26" ]
        then
        CIPHER=$(expr $CIPHER - $MOD26)
    elif [ "$CIPHER" -le "$MOD26NEG" ]
        then
        CIPHER=$(expr $CIPHER + $MOD26)
    fi
}
funcpad ()
{
    if [ "$OTPADKEY" = a ] || [ "$OTPADKEY" = A ]
        then
        OTPADKEY="0"
    elif [ "$OTPADKEY" = b ] || [ "$OTPADKEY" = B ]
        then
        OTPADKEY="1"
    elif [ "$OTPADKEY" = c ] || [ "$OTPADKEY" = C ]
        then
        OTPADKEY="2"
    elif [ "$OTPADKEY" = d ] || [ "$OTPADKEY" = D ]
        then
        OTPADKEY="3"
    elif [ "$OTPADKEY" = e ] || [ "$OTPADKEY" = E ]
        then
        OTPADKEY="4"
    elif [ "$OTPADKEY" = f ] || [ "$OTPADKEY" = F ]
        then
        OTPADKEY="5"
    elif [ "$OTPADKEY" = g ] || [ "$OTPADKEY" = G ]
        then
        OTPADKEY="6"
    elif [ "$OTPADKEY" = h ] || [ "$OTPADKEY" = H ]
        then
        OTPADKEY="7"
    elif [ "$OTPADKEY" = i ] || [ "$OTPADKEY" = I ]
        then
        OTPADKEY="8"
    elif [ "$OTPADKEY" = j ] || [ "$OTPADKEY" = J ]
        then
        OTPADKEY="9"
    elif [ "$OTPADKEY" = k ] || [ "$OTPADKEY" = K ]
        then
        OTPADKEY="10"
    elif [ "$OTPADKEY" = l ] || [ "$OTPADKEY" = L ]
        then
        OTPADKEY="11"
    elif [ "$OTPADKEY" = m ] || [ "$OTPADKEY" = M ]
        then
        OTPADKEY="12"
    elif [ "$OTPADKEY" = n ] || [ "$OTPADKEY" = N ]
        then
        OTPADKEY="13"
    elif [ "$OTPADKEY" = o ] || [ "$OTPADKEY" = O ]
        then
        OTPADKEY="14"
    elif [ "$OTPADKEY" = p ] || [ "$OTPADKEY" = P ]
        then
        OTPADKEY="15"
    elif [ "$OTPADKEY" = q ] || [ "$OTPADKEY" = Q ]
        then
        OTPADKEY="16"
    elif [ "$OTPADKEY" = r ] || [ "$OTPADKEY" = R ]
        then
        OTPADKEY="17"
    elif [ "$OTPADKEY" = s ] || [ "$OTPADKEY" = S ]
        then
        OTPADKEY="18"
    elif [ "$OTPADKEY" = t ] || [ "$OTPADKEY" = T ]
        then
        OTPADKEY="19"
    elif [ "$OTPADKEY" = u ] || [ "$OTPADKEY" = U ]
        then
        OTPADKEY="20"
    elif [ "$OTPADKEY" = v ] || [ "$OTPADKEY" = V ]
        then
        OTPADKEY="21"
    elif [ "$OTPADKEY" = w ] || [ "$OTPADKEY" = W ]
        then
        OTPADKEY="22"
    elif [ "$OTPADKEY" = x ] || [ "$OTPADKEY" = X ]
        then
        OTPADKEY="23"
    elif [ "$OTPADKEY" = y ] || [ "$OTPADKEY" = Y ]
        then
        OTPADKEY="24"
    elif [ "$OTPADKEY" = z ] || [ "$OTPADKEY" = Z ]
        then
        OTPADKEY="25"
    elif [ "$OTPAD" = a ] || [ "$OTPAD" = A ]
        then
        OTPAD="0"
    elif [ "$OTPAD" = b ] || [ "$OTPAD" = B ]
        then
        OTPAD="1"
    elif [ "$OTPAD" = c ] || [ "$OTPAD" = C ]
        then
        OTPAD="2"
    elif [ "$OTPAD" = d ] || [ "$OTPAD" = D ]
        then
        OTPAD="3"
    elif [ "$OTPAD" = e ] || [ "$OTPAD" = E ]
        then
        OTPAD="4"
    elif [ "$OTPAD" = f ] || [ "$OTPAD" = F ]
        then
        OTPAD="5"
    elif [ "$OTPAD" = g ] || [ "$OTPAD" = G ]
        then
        OTPAD="6"
    elif [ "$OTPAD" = h ] || [ "$OTPAD" = H ]
        then
        OTPAD="7"
    elif [ "$OTPAD" = i ] || [ "$OTPAD" = I ]
        then
        OTPAD="8"
    elif [ "$OTPAD" = j ] || [ "$OTPAD" = J ]
        then
        OTPAD="9"
    elif [ "$OTPAD" = k ] || [ "$OTPAD" = K ]
        then
        OTPAD="10"
    elif [ "$OTPAD" = l ] || [ "$OTPAD" = L ]
        then
        OTPAD="11"
    elif [ "$OTPAD" = m ] || [ "$OTPAD" = M ]
        then
        OTPAD="12"
    elif [ "$OTPAD" = n ] || [ "$OTPAD" = N ]
        then
        OTPAD="13"
    elif [ "$OTPAD" = o ] || [ "$OTPAD" = O ]
        then
        OTPAD="14"
    elif [ "$OTPAD" = p ] || [ "$OTPAD" = P ]
        then
        OTPAD="15"
    elif [ "$OTPAD" = q ] || [ "$OTPAD" = Q ]
        then
        OTPAD="16"
    elif [ "$OTPAD" = r ] || [ "$OTPAD" = R ]
        then
        OTPAD="17"
    elif [ "$OTPAD" = s ] || [ "$OTPAD" = S ]
        then
        OTPAD="18"
    elif [ "$OTPAD" = t ] || [ "$OTPAD" = T ]
        then
        OTPAD="19"
    elif [ "$OTPAD" = u ] || [ "$OTPAD" = U ]
        then
        OTPAD="20"
    elif [ "$OTPAD" = v ] || [ "$OTPAD" = V ]
        then
        OTPAD="21"
    elif [ "$OTPAD" = w ] || [ "$OTPAD" = W ]
        then
        OTPAD="22"
    elif [ "$OTPAD" = x ] || [ "$OTPAD" = X ]
        then
        OTPAD="23"
    elif [ "$OTPAD" = y ] || [ "$OTPAD" = Y ]
        then
        OTPAD="24"
    elif [ "$OTPAD" = z ] || [ "$OTPAD" = Z ]
        then
        OTPAD="25"
    elif [ "$CIPHER" = "0" ]
        then
        CIPHER="A"
    elif [ "$CIPHER" = "1" ]
        then
        CIPHER="B"
    elif [ "$CIPHER" = "2" ]
        then
        CIPHER="C"
    elif [ "$CIPHER" = "3" ]
        then
        CIPHER="D"
    elif [ "$CIPHER" = "4" ]
        then
        CIPHER="E"
    elif [ "$CIPHER" = "5" ]
        then
        CIPHER="F"
    elif [ "$CIPHER" = "6" ]
        then
        CIPHER="G"
    elif [ "$CIPHER" = "7" ]
        then
        CIPHER="H"
    elif [ "$CIPHER" = "8" ]
        then
        CIPHER="I"
    elif [ "$CIPHER" = "9" ]
        then
        CIPHER="J"
    elif [ "$CIPHER" = "10" ]
        then
        CIPHER="K"
    elif [ "$CIPHER" = "11" ]
        then
        CIPHER="L"
    elif [ "$CIPHER" = "12" ]
        then
        CIPHER="M"
    elif [ "$CIPHER" = "13" ]
        then
        CIPHER="N"
    elif [ "$CIPHER" = "14" ]
        then
        CIPHER="O"
    elif [ "$CIPHER" = "15" ]
        then
        CIPHER="P"
    elif [ "$CIPHER" = "16" ]
        then
        CIPHER="Q"
    elif [ "$CIPHER" = "17" ]
        then
        CIPHER="R"
    elif [ "$CIPHER" = "18" ]
        then
        CIPHER="S"
    elif [ "$CIPHER" = "19" ]
        then
        CIPHER="T"
    elif [ "$CIPHER" = "20" ]
        then
        CIPHER="U"
    elif [ "$CIPHER" = "21" ]
        then
        CIPHER="V"
    elif [ "$CIPHER" = "22" ]
        then
        CIPHER="W"
    elif [ "$CIPHER" = "23" ]
        then
        CIPHER="X"
    elif [ "$CIPHER" = "24" ]
        then
        CIPHER="Y"
    elif [ "$CIPHER" = "25" ]
        then
        CIPHER="Z"
fi
}
# -----------------------------------------------------------------------------------
OTPVER="1.0.1"
OTPNAM="shOTPad"
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
            while :
            do
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
                    echo "otp/$OTPLOAD" > otp.load
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
            while :
            do
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
                    if [ $OTPADMENU = 2 ]
                    then
                        echo "Enter message (without spaces) you wish to encrypt and press enter:"
                    elif [ $OTPADMENU = 3 ]
                    then
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
                    until [ $OTPMCNTR -gt $OTPMWCNT ]
                    do
                        # Read one character and turn it into a number.
                        OTPADKEY=$(echo ${OTPMESSAGE:$OTPMPOS:1})
                        funcpad
                        OTPAD=$(cat $ONETIMEPAD | cut -c 1)
                        funcpad
                        # Start cipher.
                        if [ $OTPADMENU = 2 ]
                        then
                            CIPHER=$(expr $OTPADKEY + $OTPAD)
                        elif [ $OTPADMENU = 3 ]
                        then
                            CIPHER=$(expr $OTPADKEY - $OTPAD)
                        fi
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
            printf "\033c"
            break
        ;;
    esac
done
