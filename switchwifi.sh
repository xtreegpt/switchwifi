#!/bin/bash

############# Get wpa_supplicant-wlan0.conf network list ##############
NETS=$( wpa_cli -i wlan0 list_networks )

############# Create a string array form $NETS ###############
INDEX=0
for str in ${NETS[*]};
do
        NET_ARRAY[$INDEX]=$str
                ((++INDEX))
done

############################## print colum header ################################
printf "\n${NET_ARRAY[0]}\t${NET_ARRAY[1]}\t${NET_ARRAY[2]}\t${NET_ARRAY[3]}\t${NET_ARRAY[4]}\t${NET_ARRAY[5]}\t${NET_ARRAY[6]}\t${NET_ARRAY[7]}\n"

############################# print Wifi ID and network name #####################
printf "\t${NET_ARRAY[8]}\t\t${NET_ARRAY[9]}\t\t${NET_ARRAY[10]}\t\t${NET_ARRAY[11]}\n"
printf "\t${NET_ARRAY[12]}\t\t${NET_ARRAY[13]}\t\t${NET_ARRAY[14]}\t\t${NET_ARRAY[15]}\n"
printf "\t${NET_ARRAY[16]}\t\t${NET_ARRAY[17]}\t${NET_ARRAY[18]}\t\t${NET_ARRAY[19]}\n"
printf "\t${NET_ARRAY[20]}\t\t${NET_ARRAY[21]}\t\t${NET_ARRAY[22]}\t\t${NET_ARRAY[23]}\n"
printf "\t${NET_ARRAY[24]}\t\t${NET_ARRAY[25]}\t${NET_ARRAY[26]}\t\t${NET_ARRAY[27]}\n"

###################### Ask for ID # ############
printf "\nSelect the network ID number of the WiFi network you want to use "
printf "\n\n"

printf "enter 0, 1, 2, 3, 4 or ctrl+c to exit\n"

############# Read in customer selection ############
read num

############# Change WiFi network ##############
printf "switching to network $num\n"

wpa_cli -i wlan0 select_network $num

######### EOF ############
