#!/bin/bash

echo -e "\e[31m"   # Set text color to red

echo "
                                   
                                           ╟▒╬  @@┐
                                            ╚▒╢  ╟▒@
                                             ╟▒@  ╟▒Ñ
                                             ]▒▒   ▒▒∩
        m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@╣▒▒@@@▒▒╣@@@@@@@@@@@@@@@@@@@@@@@N╕
                        ▒[                   ]▒▒   ▒▒▌                  ║▒▓
         j╣▒╣╬╝▒ ╟╬⌐   ▒▒╢╬╩╬╣▒@    @╢▒╢╩Ñ╗  ]▒▒   ▒▒╣@▒╬╜╙╙%╖    ╥@╬╣▒▒▒▒▒m
         j▒▒╢   ╓@╢╣┘    ╓╦@@N╗║▒C ╒▒▒╜      ╬▒▒   ▒▒▒▀      ▒▓   ╬▒▓
         j▒▒[    ╙╙    ╬Ñ╜   ╙╙╣▒L ]▒       @▒▒▒   ▒▒▌      ╒▒▒▌ ╥╬▒╢╢╢Ñ@
         j▒▒[         ▒      ╓@╢▒L  ╙╖    ╦╣▒▒▒▒   ▒▒▌     g╢▒╫  ╣▒▓       φ╢▓
          ▓▒╝          ╨╣╣▒▒▒╬╜╚╣L    ╙╩▒▒╫╝  ╩╣   ╙╣▌    ╙╣▒▓     ╙MNφ@╢▒▒▓▀╙
"

# Array to hold the available module names
modules=("Subdomain Enumeration" "Live Subdomains" "Find Cache Purge ")

# Function to execute the selected module
execute_module() {
    local module_name="$1"
    local module_script="modules/${module_name// /_}.sh"

    # Check if the module script exists
    if [[ -f "$module_script" ]]; then
        echo "Executing module: $module_name"
        source "$module_script"
    else
        echo "Module not found: $module_script"
    fi
}

# Main script execution
main() {

echo  # For one-line gap

echo -e "\e[0;36mJAI SHREE KRISHNA ❤ 🙏 \e[0m" 

echo  # For one-line gap

    echo "Choose a modules:"

    # Loop to display module options
    for ((i = 0; i < ${#modules[@]}; i++)); do
        echo "$((i+1)). ${modules[i]}"
    done

echo  # For one-line gap

    # Prompt user to choose module
    read -p "Enter the module number: " selected_module_number

    # Validate the user's choice
    if [[ "$selected_module_number" =~ ^[0-9]+$ ]]; then
        local selected_index=$((selected_module_number-1))

        # Check if the selected module number is within range
        if ((selected_index >= 0 && selected_index < ${#modules[@]})); then
            local selected_module="${modules[selected_index]}"
            execute_module "$selected_module"
        else
            echo "Invalid module number: $selected_module_number"
        fi
    else
        echo "Invalid input: $selected_module_number"
    fi
}

# Execute the main function
main
