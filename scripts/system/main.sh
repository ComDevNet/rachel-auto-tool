#!/bin/bash

# clear the screen
clear

echo ""
echo ""

# Display the name of the tool
figlet -c -t -f 3d "SYSTEM" | lolcat

echo ""

# A border to cover the description and its centered
echo  "================================================================================="
echo "All basic system settings, Be careful here though, you might mess up the system"
echo "================================================================================="

echo ""

# variables
RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
DARK_GRAY='\033[1;30m'

# Display menu options
echo -e "1. Modem            ${DARK_GRAY}-| Connect to a USB Modem${NC}"
echo -e "2. WIFI Name                   ${DARK_GRAY}-| Change the WIFI signal name${NC}"
echo -e "3. Wifi Password               ${DARK_GRAY}-| Change the WIFI signal password${NC}"
echo -e "4. Raspberry Pi Configuration  ${DARK_GRAY}-| Run raspi-config${NC}"
echo -e "5. Reboot                      ${DARK_GRAY}-| Reboot the system${NC}"
echo -e "6. Shutdown                    ${DARK_GRAY}-| Shutdown the system${NC}"
echo -e "${GREEN}7. Go Back                     ${DARK_GRAY}-| Go back to the main menu${NC}"
echo -e "${RED}8. Exit                        ${DARK_GRAY}-| Exit the program${NC}"

echo -e "${NC}"
# Prompt the user for input
read -p "Choose an option (1-8): " choice

# Check the user's choice and execute the corresponding script
case $choice in
    1)
        ./scripts/system/modem.sh
        ;;
    2) 
        ./scripts/system/wifi-name.sh
        ;;
    3) 
        ./scripts/system/wifi-password.sh
        ;;
    4)
        ./scripts/system/raspi-config.sh
        ;;
    5)
        ./scripts/system/reboot.sh
        ;;
    6)
        ./scripts/system/shutdown.sh
        ;;
    7)
        ./main.sh
        ;;
    8)
        ./exit.sh
        ;;
    *)
        echo -e "${RED}Invalid choice. Please choose a number between 1 and 8.${NC}"
        sleep 1.5
        exec ./scripts/system/main.sh
        ;;
esac
