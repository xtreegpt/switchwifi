#!/bin/bash
COUNT=0
NETS=$( wpa_cli -i wlan0 list_networks )

#################### Print Header for selection #####################
printf "\n%s\t %-s\t\t %-9s %s\n" NETWORK_ID ESSID BSSID FLAGS
printf "%s\t %-s\t\t %-9s %s\n" ---------- ----- ----- -----

#################### Use sed to skip first line and loop through the rest of $NETS ##########################
echo "$NETS" |sed '1d' | (while read i
do
        echo "$i" | awk '{printf "%5s\t\t %-16s %-6s %-s\n", $1, $2, $3, $4}'
        (( ++COUNT ))

done

(( COUNT-- ))


###################### Ask for ID # ############
printf "\nSelect the network ID number of the WiFi network you want to use "
printf "\n\n"

printf "enter a number 0 - $COUNT, or ctrl+c to exit\n")

############# Read in customer selection ############
read num

############# Change WiFi network ##############
printf "switching to network $num\n"

wpa_cli -i wlan0 select_network $num

######### EOF ############
