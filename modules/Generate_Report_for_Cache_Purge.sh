#!/bin/bash

clear 

start_time=$(date +%s)  # Record the start time

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉

echo  # For one-line gap

echo -e "\e[1;33mRADHE RADHE ❤ \e[0m" 

echo  # For one-line gap

generate_report() {
    local name="$1"
    local target="$2"
    local response="$3"

    echo "Hello Team," > Report.txt
    echo "I am $name from India, working as a Security Researcher. I have found a security vulnerability on your website." >> Report.txt
    echo >> Report.txt
    echo "Description:" >> Report.txt
    echo "Cache Purge means to delete the stored caches. So if you purge the cache, it means the next time you visit that website, it will generate the page by pulling info from the database (the original method). Then, it will recopy the page again to create a new cache. The Cache Purge request simply allows users to delete any cached resource." >> Report.txt
    echo >> Report.txt
    echo "Steps To Reproduce:" >> Report.txt
    echo "Enter the following curl command in the terminal:" >> Report.txt
    echo >> Report.txt
    echo "curl -X PURGE \"https://$target\"" >> Report.txt
    echo >> Report.txt
    echo "The vulnerable response will be:" >> Report.txt
    echo >> Report.txt
    echo "$response" >> Report.txt
    echo >> Report.txt
    echo "Mitigation:" >> Report.txt
    echo "Disallow cache purge requests or limit them to authenticated users only." >> Report.txt
    echo >> Report.txt
    echo "Reference:" >> Report.txt
    echo "https://sapt.medium.com/apple-hall-of-fame-for-a-small-misconfiguration-unauth-cache-purging-faf81b19419b" >> Report.txt
    echo >> Report.txt
    echo "Impact:" >> Report.txt
    echo "If the Purge request is available to any user, even those who are not authenticated, as an attacker, I can delete/invalidate the caches stored at certain resources. This can lead to increased bandwidth costs and degraded application performance. Allowing anonymous users to purge cache could be used to maliciously degrade performance." >> Report.txt
    echo >> Report.txt
    echo "Please attach a proof-of-concept (POC) image showing the vulnerability while reporting." >> Report.txt

    echo "Vulnerability report saved as Report.txt"
    echo # For one line gap

}


main() {
    echo "Please provide the following information:"
    echo


    read -p "Your Name: " name


    read -p "Target Website: " target


    read -p "Response of curl request: " response

    echo  # For one-line gap


    generate_report "$name" "$target" "$response"
}

# Execute the main function
main

echo  # For one-line gap

# For Script Execution Timing

end_time=$(date +%s)  # Record the end time
execution_time=$((end_time - start_time))  

if ((execution_time < 60)); then
  echo "The Report Module finished in $execution_time seconds"
else
  minutes=$((execution_time / 60))  
  seconds=$((execution_time % 60))  
  echo "The Report Module finished in $minutes minutes $seconds seconds"
fi

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉

