#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/akuhaa021/reqAccess/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
svname=$(curl -sS https://raw.githubusercontent.com/akuhaa021/reqAccess/main/ip | grep $MYIP | awk '{print $2}')
Name=$(curl -sS https://raw.githubusercontent.com/akuhaa021/reqAccess/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/akuhaa021/reqAccess/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi

clear
source /var/lib/scrz-prem/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi


echo -e"\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e"\033[0;34m━━━━━━━CONFIG GENERATOR━━━━━━━━\033[0m"
echo -e"\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -rp "Input Username : " user
read -rp "Input UUID : " uuid
echo -e "Config Type : "
echo -e "1. WS : "
echo -e "2. XTLS : "
read -p "Your Choise is : " conftype
echo -e "Please Choose Telco : "
echo -e "1. Digi"
echo -e "2. Umobile"
echo -e "3. Maxis : "
echo -e "4. Celcom : "
echo -e "5. Yes4G : "
read -p "Your Choise is : " telco


if [[ $telco = "1" ]]; then
	if [[ $conftype = "1" ]]; then
	telko="Digi"
	address="162.159.133.61"
	sni=$domain
	else
	telko="DigiGo"
	address=$MYIP
	sni="www.pokemon.com"
	fi
elif [[ $telco = "2" ]]; then
	telko="Umobile"
	address=$MYIP
	sni="pay-dcb.u.com.my"
elif [[ $telco = "3" ]]; then
	telko="Hotlink"
	address="www.speedtest.net"
	sni=$address
elif [[ $telco = "4" ]]; then
	telko="Celcom"
	address="onlinepayment.celcom.com.my"
	sni=$address
elif [[ $telco = "5" ]]; then
	telko="Yes4G"
	address="cdn.who.int"
	sni="who.int"
else
echo -e "   Invalid Choice. no bug added. add manual."
fi


if [[ $conftype = "1" ]]; then
vlesslink1="vless://${uuid}@${address}:443?path=$patchtls&security=tls&encryption=none&type=ws&sni=$sni&host=${domain}#vless_${telko}_${user}"
vlesslink2="vless://${uuid}@${address}:80?path=$patchnontls&encryption=none&host=$sni&type=ws#vless_${telko}_${user}"
vlesslinkyes1="vless://${uuid}@${address}:80?path=$patchyes&security=tls&encryption=none&type=ws&host=${domain}#vless_${telko}_${user}"
vlesslinkyes2="vless://${uuid}@${address}:80?path=$patchnontls&encryption=none&host=${domain}&type=ws#vless_${telko}_${user}"
else
vlesslink2="vless://${uuid}@${address}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#vless_XTLS_${telko}_${user}"
fi

clear

echo -e "━━━━━━━━━━━━━━━━━━"
echo -e "XRay Vless Account Information"
echo -e "━━━━━━━━━━━━━━━━━━"
echo -e "Server : ${svname}"
echo -e "Server IP: $MYIP"
echo -e "Username: ${user}"
echo -e "Telco: ${telko}"
echo -e "Vless ID: ${uuid}"
echo -e "━━━━━━━━━━━━━━━━━━"
echo -e "CLICK TO COPY"
echo -e "━━━━━━━━━━━━━━━━━━"
if [[ $conftype = "1" ]]; then
	if [[ $telco = "1" ]]; then
	echo -e "${vlesslink2}"
elif [[ $telco = "2" ]]; then
	echo -e "${vlesslink2}"
elif [[ $telco = "3" ]]; then
	echo -e "${vlesslink1}"
elif [[ $telco = "4" ]]; then
	echo -e "${vlesslink1}"
elif [[ $telco = "5" ]]; then
	echo -e "${vlesslinkyes2}"
	echo -e "━━━━━━━━━━━━━━━━━━"
	echo -e "${vlesslinkyes1}"
else
	echo -e "${vlesslink2}"
	echo -e "━━━━━━━━━━━━━━━━━━"
	echo -e "${vlesslink1}"
	fi
else
	echo -e "${vlesslink2}"
fi
echo ""
