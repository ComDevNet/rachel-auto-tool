#!/bin/bash

# Move to the /var/www/ directory
cd /var/www/ || exit

# Get the current version
current_version=$(git describe --tags --abbrev=0)

# Display the current version
echo "Current System Version: $current_version"

# Run git fetch to get the latest changes
sudo git fetch

# Get the latest release version
latest_version=$(git tag -l | sort -V | tail -n 1)

# Display the latest release version
echo "Latest Release Version: $latest_version"

# Ask the user if they want to pull the new release
read -p "Do you want to update to the latest release? (y/n): " user_response

if [ "$user_response" == "y" ]; then
    # Perform a git pull
    sudo git pull
    echo "New release pulled successfully. Returning to the main menu in 3 seconds..."
else
    echo "Interface is the latest version. Returning to the main menu in 3 seconds..."
fi

sleep 3
# Return to the main script
exec ./main.sh