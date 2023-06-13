#!/bin/bash

echo  # Add an empty line

echo -e "\e[0;36mRADHE KRISHNA ❤ \e[0m" 

# File that contains the URLs to be purged
file="Urls.txt"

# Output file for the result
output_file="Results.txt"

# ANSI escape sequences for text formatting
bold=$(tput bold)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

# Read each line of the file
while read -r line; do
  # Replace the words after "curl -X PURGE"
  curl_command=$(echo "curl -X PURGE $line")

  # Run the curl command and capture the result
  result=$(eval "$curl_command" 2>&1)

  # Check if the result includes the phrase '"status": "ok"'
  if [[ $result = *'"status": "ok"'* ]]; then
    # Mark the URL as "vulnerable"
    status="${bold}${cyan}VULNERABLE${reset}"
  else
    status="NOT VULNERABLE"
  fi

  # Save the URL and status to the output file
  echo -e "URL: $line\nStatus: $status\n" >> "$output_file"

  # Print a message to indicate that the URL has been processed
  echo  # Add an empty line

  echo "Processed URL: $line"
  echo  # Add an empty line
done < "$file"

# Add an empty line at the end of the script
echo

# Print a message to indicate that the script has finished
echo "Script execution completed :)"
