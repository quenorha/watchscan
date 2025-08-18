#!/bin/bash

green='\033[0;32;40m'
red='\033[1;31m'
normal='\033[00;00m'
format=' %-15s'

tcpportarg="20,21,22,23,53,80,102,443,502,2404,2455,4840,6626,8080,11740,20000,47808"

udpportarg="53,67,69,161,162,500,502,514,1194,1740,2404,4500,2000,47808"

res=$(nmap -p $tcpportarg $1 -oN /tmp/tcpscan)
res=$(nmap -sU -p $udpportarg $1 -oN /tmp/udpscan)

nbport=1

declare -a ports

while read p; do
port=$(echo "$p" | tr -s ' ' | cut -d ' ' -f 1)
state=$(echo "$p" | tr -s ' ' | cut -d ' ' -f 2)
service=$(echo "$p" | tr -s ' ' | cut -d ' ' -f 3)

if [[ $port =  *'/tcp'* ]]; then
    if [[ "$state" == "closed" ]]; then
        ports[$nbport]="c" 
    elif [[ "$state" == "filtered" ]]; then
        ports[$nbport]="f"
    elif [[ "$state" == "open|filtered" ]]; then
        ports[$nbport]="o|f"
    else
        ports[$nbport]="o"
    fi
    nbport=$((nbport + 1))
	
	#printf "$port $state " 
fi

done </tmp/tcpscan


while read p; do
port=$(echo "$p" | tr -s ' ' | cut -d ' ' -f 1)
state=$(echo "$p" | tr -s ' ' | cut -d ' ' -f 2)
service=$(echo "$p" | tr -s ' ' | cut -d ' ' -f 3)

if [[ $port =  *'/udp'* ]]; then
    if [[ "$state" == "closed" ]]; then
        ports[$nbport]="c"
    elif [[ "$state" == "filtered" ]]; then
        ports[$nbport]="f"
    elif [[ "$state" == "open|filtered" ]]; then
        ports[$nbport]="o|f"
    else
        ports[$nbport]="o"
    fi
    nbport=$((nbport + 1))
fi

done </tmp/udpscan
	
	printf '%s;' "${ports[@]}"