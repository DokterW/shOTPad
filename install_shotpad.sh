#!/bin/bash
# shOTPad (install) v0.1
# Made by Dr. Waldijk
# Read the README.md for more info.
# By running this script you agree to the license terms.
# -----------------------------------------------------------------------------------
clear
# echo "Install shOTPad."
# echo ""
# echo "shOTPad will be installed to your preferred location, like this:"
# echo "/WhatYouSpecify/shOTPad/"
# echo "Keep in mind that 'WhatYouSpecify' must already be an existing path."
# echo ""
# read -p "Enter where you want to install shOTPad: " OTPLOC
OTPLOC=$(pwd)
mkdir $OTPLOC/shOTPad
wget -q -N --show-progress https://raw.githubusercontent.com/DokterW/shOTPad/master/start.sh -P $OTPLOC/shOTPad/
if [ ! -x $OTPLOC/shOTPad/start.sh ]; then
    chmod +x $OTPLOC/shOTPad/start.sh
fi
wget -q -N --show-progress https://raw.githubusercontent.com/DokterW/shOTPad/master/upgrade_shotpad.sh -P $OTPLOC/shOTPad/
if [ ! -x $OTPLOC/shOTPad/upgrade_shotpad.sh ]; then
    chmod +x $OTPLOC/shOTPad/upgrade_shotpad.sh
fi
mkdir $OTPLOC/shOTPad/otp
wget -q -N --show-progress https://raw.githubusercontent.com/DokterW/shOTPad/master/otp/otp-sample.pad -P $OTPLOC/shOTPad/otp/
wget -q -N --show-progress https://raw.githubusercontent.com/DokterW/shOTPad/master/otp.load -P $OTPLOC/shOTPad/
DUPRINST=$(pwd)
rm -f $FUPRINST/install_dupr.sh
printf "\033c"
