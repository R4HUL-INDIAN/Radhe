#!/bin/bash

echo  # Add an empty line

echo -e "\e[0;36mRADHE KRISHNA ❤ \e[0m" 

echo  # Add an empty line

# Function to update the repository
update_repository() {
    echo "Updating repository: $PWD..."

    # Fetch the latest changes from the remote repository
    git fetch

    # Merge the fetched changes into the current branch
    git merge origin/$(git symbolic-ref --short HEAD)

    echo "Repository updated successfully."
}

# Execute the update_repository function
update_repository
