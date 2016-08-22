#!/bin/bash
# shOTPad v0.1 by Dr. Waldijk
# https://github.com/DokterW/shOTPad - https://dokterw.me/
# A one-time pad bash script that creates one-time pads,
# encrypts and decrypts messages.
# -----------------------------------------------------------------------------------
function funcpad {
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
