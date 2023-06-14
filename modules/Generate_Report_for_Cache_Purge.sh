#!/bin/bash


echo  # Add an empty line

echo -e "\e[0;36mRADHE KRISHNA ❤ \e[0m" 

echo  # Add an empty line

# Function to generate the vulnerability report
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
    echo -e "\e[0;36mModule Finished ❤ \e[0m" 
}

# Main script execution
main() {
    echo "Please provide the following information:"
    echo

    # Prompt user for name
    read -p "Your Name: " name

    # Prompt user for target website
    read -p "Target Website: " target

    # Prompt user for response of curl request
    read -p "Response of curl request: " response

    echo  # For one-line gap

    # Generate the vulnerability report and save it in Report.txt
    generate_report "$name" "$target" "$response"
}

# Execute the main function
main
