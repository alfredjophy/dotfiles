#!/bin/bash
repo=$(ls ~/Github | wofi --show dmenu)

[ -z "$repo" ] && exit

cd ~/Github/$repo

kitty -1 nvim .
