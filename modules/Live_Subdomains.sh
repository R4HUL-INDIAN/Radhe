#!/bin/bash

echo  # For one-line gap

echo -e "\e[0;36mRADHE KRISHNA ❤ \e[0m" 

echo  # For one-line gap

puredns resolve subdomains.txt -r resolvers.txt -w puredns.txt

httpx -l subdomains.txt -timeout 35 -o httpx.txt -t 100 

echo -e "\e[0;36mModule Finished ❤ \e[0m" 

