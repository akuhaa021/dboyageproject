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
elif [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi

tls="$(cat /root/log-install.txt | grep -w "VLess TCP XTLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m       ⇱ Add VLess TCP XTLS ⇲      \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xtls/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo -e "\E[44;1;39m       ⇱ Add VLess TCP XTLS ⇲      \E[0m"
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			read -n 1 -s -r -p "Press any key to back on menu"
			v2ray-menu
		fi
	done

echo -ne "   Custom UUID [press enter for random] : "
read uuid
[[ -z $uuid ]] && uuid=$(cat /proc/sys/kernel/random/uuid)
echo -e "   Please Choose Telco : "
echo -e "   1. Digi Pokemon Go"
echo -e "   2. Umobile"
echo -e "   3. MaxisTV : "
echo -e "   4. Celcom : "
echo -e "   5. Yes4G : "
read -p "   Your Choise is : " telco

if [[ $telco = "1" ]]; then
	address="www.pokemon.com.${domain}"
	sni="www.pokemon.com"
	telko="DigiGo"
elif [[ $telco = "2" ]]; then
	address=$MYIP
	sni="pay-dcb.u.com.my"
	telko="Umobile"
elif [[ $telco = "3" ]]; then
	address=$domain
	sni="sub.viu.com"
	telko="MaxisTV"
elif [[ $telco = "4" ]]; then
	address="onlinepayment.celcom.com.my"
	sni=$address
	telko="Celcom"
elif [[ $telco = "5" ]]; then
	address="cdn.who.int"
	sni="who.int"
	telko="Yes"
else
echo -e "   Invalid Choice. no bug added. add manual."
fi

read -p "   Expired (days) : " masaaktif

sts=$bug_addr2


exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vlessXTLS$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""$xCho""'","email": "'""$user""'"' /usr/local/etc/xtls/config.json


vlesslink1="vless://${uuid}@${address}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#vless_XTLS_${telko}_${user}"
vlesslink2="vless://${uuid}@${address}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#vless_XTLS_${telko}_${user}"
systemctl restart xray
clear
echo -e "━━━━━━━━━━━━━━━━━━"
echo -e "XRay Vless Account Information"
echo -e "━━━━━━━━━━━━━━━━━━"
echo -e "Server : ${svname}-XTLS"
echo -e "Server IP: $MYIP"
echo -e "Telco : ${telko}"
echo -e "Username: ${user}"
echo -e "Vless ID: ${uuid}"
echo -e "Active Time: ${masaaktif} days"
echo -e "Expiration date: $exp"
echo -e "━━━━━━━━━━━━━━━━━━"
echo -e "CLICK TO COPY"
echo -e "━━━━━━━━━━━━━━━━━━"
echo -e "${vlesslink2}"
echo ""
