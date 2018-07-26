#!/bin/bash
# shOTPad (upgrade) v0.1
# Made by Dr. Waldijk
# Read the README.md for more info.
# By running this script you agree to the license terms.
# -----------------------------------------------------------------------------------
OTPLOC=$(pwd)
OTPNOW=$(cat $OTPLOC/start.sh | sed -n "2p" | egrep -o '([0-9]{1,2}\.)*[0-9]{1,2}')
OTPLTS=$(curl -ILs -o /dev/null -w %{url_effective} https://github.com/DokterW/shOTPad/releases/latest | egrep -o '([0-9]{1,2}\.)*[0-9]{1,2}')
if [[ "$OTPLTS" != "$OTPNOW" ]]; then
    wget -q -N --show-progress https://raw.githubusercontent.com/DokterW/shOTPad/master/start.sh -P $OTPLOC/
    if [ ! -x $OTPLOC/shOTPad/start.sh ]; then
        chmod +x $OTPLOC/shOTPad/start.sh
    fi
    echo "Latest version of shOTPad v$OTPLTS installed." 
else
    echo "You already have the latest version of shOTPad v$OTPLTS installed."
fi
OTPLOC=""
OTPNOW=""
OTPLTS=""
sleep 3s
printf "\033c"
