#!/bin/bash

clear 

start_time=$(date +%s)  # Record the start time

# Made with 🖤 by RADHE-INDIAN

echo  # For one-line gap

echo -e "\e[1;33mRADHE RADHE ❤ \e[0m"

echo  # Add an empty line

# Function to update the repository
update_repository() {
    echo -e "\e[1;33m[+] UPDATING RADHE TOOL \e[0m" $PWD"..."
    echo  # For one-line gap
    
    # Fetch the latest changes from the remote repository
    git fetch
    
    # Merge the fetched changes into the current branch
    git merge origin/$(git symbolic-ref --short HEAD)
    
    echo  # For one-line gap
    
    echo -e "\e[1;33m[+] RADHE TOOL UPDATED SUCESSFULLY. \e[0m"
}

# Execute the update_repository function
update_repository

echo  # For one-line gap
# For Script Execution Timing

end_time=$(date +%s)  # Record the end time
execution_time=$((end_time - start_time))

if ((execution_time < 60)); then
  echo "The Update Module finished in $execution_time seconds"
else
  minutes=$((execution_time / 60))
  seconds=$((execution_time % 60))
  echo "The Update Module finished in $minutes minutes $seconds seconds"
fi

# Made with 🖤 by RADHE-INDIAN
