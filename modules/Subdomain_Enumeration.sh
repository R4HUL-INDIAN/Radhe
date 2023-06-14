#!/bin/bash

echo  # For one-line gap

echo -e "\e[0;36mRADHE RADHE ❤ \e[0m" 

echo  # For one-line gap

read -p "Enter the Target Name: " domain

echo  # For one-line gap

amass enum -passive -d $domain -o amass.txt 

assetfinder --subs-only $domain > assetfinder.txt

subfinder -d $domain > subfinder.txt

sublist3r -d $domain  -o sublist3r.txt

cat amass.txt assetfinder.txt subfinder.txt sublist3r.txt >> subdomains.txt 

rm amass.txt assetfinder.txt subfinder.txt sublist3r.txt

echo -e "\e[0;36mSUBDOMAINS ENUMERATION FINISHED :) \e[0m"
