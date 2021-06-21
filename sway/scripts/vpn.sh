#!/bin/bash


cd /home/ajrx/.config/protonvpn

VPN=$(ls *.ovpn | wofi -d "VPN: ")

[ -z "$VPN" ] && exit

pkill openvpn
openvpn /home/ajrx/.config/protonvpn/$VPN

exit
