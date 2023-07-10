#!/bin/bash

clear 

start_time=$(date +%s)  # Record the start time

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉

echo  # For one-line gap

echo -e "\e[1;33mRADHE RADHE ❤ \e[0m" 

echo  # For one-line gap

echo -e "\e[1;33m[+] Extracting active subdomains from PureDns \e[0m"

puredns resolve subdomains.txt -r resolvers.txt -w puredns.txt >/dev/null 2>&1

echo  # For one-line gap

echo -e "\e[1;33m[+] Extracting active subdomains from Httpx \e[0m"

httpx -l subdomains.txt -timeout 35 -o httpx.txt -t 100 >/dev/null 2>&1

echo  # For one-line gap

# For Script Execution Timing

end_time=$(date +%s)  # Record the end time
execution_time=$((end_time - start_time))  

if ((execution_time < 60)); then
  echo "The Live Subdomains Module finished in $execution_time seconds"
else
  minutes=$((execution_time / 60))  
  seconds=$((execution_time % 60))  
  echo "The Live Subdomains Module finished in $seconds seconds"
fi

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉

