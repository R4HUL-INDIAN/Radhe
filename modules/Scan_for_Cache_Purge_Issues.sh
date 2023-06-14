#!/bin/bash

echo  # Add an empty line

echo -e "\e[0;36mRADHE KRISHNA ❤ \e[0m" 

# File to read from
puredns_file="puredns.txt"
httpx_file="httpx.txt"
output_file="Urls.txt"

# Function to add "https://" before each word in puredns.txt
add_https() {
    local input_file="$1"
    local output_file="$2"

    # Create a temporary file to store the modified content
    local tempfile="add_https_temp.txt"

    # Loop through each line in the input file
    while IFS= read -r line; do
        # Check if the line starts with "https://"
        if [[ $line == https://* ]]; then
            # If the line already starts with "https://", use it as is
            modified_line="$line"
        else
            # Otherwise, prepend "https://" to the line
            modified_line="https://$line"
        fi

        # Append modified line to the temporary file
        echo "$modified_line" >> "$tempfile"
    done < "$input_file"

    # Rename the temporary file to the output file
    mv "$tempfile" "$output_file"

}

# Execute add_https function to modify puredns.txt
add_https "$puredns_file" "add_puredns.txt"

# Combine add_puredns.txt and httpx.txt into Urls.txt
cat "add_puredns.txt" "$httpx_file" > "$output_file"


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

# For removing temp files

rm add_puredns.txt Urls.txt

# Print a message to indicate that the script has finished
echo "Script execution completed :)"
