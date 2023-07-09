#!/bin/bash

echo -e "\e[31m" 

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


modules=("Subdomain Enumeration" "Live Subdomains" "Find Cache Purge" "Find SSRF" "Update Radhe Tool" )

execute_module() {
    local module_name="$1"
    local module_script="modules/${module_name// /_}.sh"

    # Check if the module script exists
    if [[ -f "$module_script" ]]; then
echo  # For one-line gap
        echo "Executing module: $module_name"
        source "$module_script"
    else
        echo "Module not found: $module_script"
    fi
}

# Main script execution
main() {

echo -e "\e[0;36m𝙍𝙖𝙙𝙝𝙚 𝙞𝙨 𝙢𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉. \e[0m" 

echo  # For one-line gap

echo -e "\e[0;36mJAI SHREE KRISHNA ❤ 🙏 \e[0m" 

echo  # For one-line gap

    echo "Choose a module:"

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

            if [[ "$selected_module" == "Find Cache Purge" ]]; then
                # Sub-modules under "Find Cache Purge" module
                local cache_purge_modules=("Scan for Cache Purge Issues" "Generate Report for Cache Purge")

                echo "Choose a sub-module:"

                # Loop to display sub-module options
                for ((j = 0; j < ${#cache_purge_modules[@]}; j++)); do
                    echo "$((j+1)). ${cache_purge_modules[j]}"
                done

                echo  # For one-line gap

                # Prompt user to choose sub-module
                read -p "Enter the sub-module number: " selected_sub_module_number

                # Validate the user's choice
                if [[ "$selected_sub_module_number" =~ ^[0-9]+$ ]]; then
                    local selected_sub_index=$((selected_sub_module_number-1))

                    # Check if the selected sub-module number is within range
                    if ((selected_sub_index >= 0 && selected_sub_index < ${#cache_purge_modules[@]})); then
                        local selected_sub_module="${cache_purge_modules[selected_sub_index]}"
                        execute_module "$selected_sub_module"
                    else
                        echo "Invalid sub-module number: $selected_sub_module_number"
                    fi
                else
                    echo "Invalid input: $selected_sub_module_number"
                fi

            else
                execute_module "$selected_module"
            fi
        else
            echo "Invalid module number: $selected_module_number"
        fi
    else
        echo "Invalid input: $selected_module_number"
    fi
}

# Execute the main function
main
