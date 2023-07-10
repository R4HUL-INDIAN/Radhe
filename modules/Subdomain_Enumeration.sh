#!/bin/bash

clear 

start_time=$(date +%s)  # Record the start time

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉

echo  # For one-line gap

echo -e "\e[1;33mRADHE RADHE ❤ \e[0m" 

echo  # For one-line gap

read -p "Enter the Target Name: " domain

echo  # For one-line gap

echo -e "\e[1;33m[+] Collecting Subdomains From Amass \e[0m"

amass enum -passive -d $domain -o amass.txt >/dev/null 2>&1


echo  # For one-line gap

echo -e "\e[1;33m[+] Collecting Subdomains From Assetfinder \e[0m"

assetfinder --subs-only $domain > assetfinder.txt

echo  # For one-line gap

echo -e "\e[1;33m[+] Collecting Subdomains From Subfinder \e[0m"

subfinder -d $domain 2>/dev/null > subfinder.txt

echo  # For one-line gap

echo -e "\e[1;33m[+] Collecting Subdomains From Sublist3r \e[0m"

# sublist3r -d $domain  -o sublist3r.txt >/dev/null 2>&1

cat amass.txt assetfinder.txt subfinder.txt >> subdomains.txt 

rm amass.txt assetfinder.txt subfinder.txt 

echo  # For one-line gap

# For Script Execution Timing

end_time=$(date +%s)  # Record the end time
execution_time=$((end_time - start_time))  

if ((execution_time < 60)); then
  echo "The Subdomain Enumeration Module finished in $execution_time seconds"
else
  minutes=$((execution_time / 60))  
  seconds=$((execution_time % 60))  
  echo "The Subdomain Enumeration Module finished in $seconds seconds"
fi

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉
