#!/bin/bash

repos=$(find Repos -name "*.git" -type d | sed -r 's#/.git##'| sed -r 's#Repos/##')
repo=$(echo "$repos" |wofi --show dmenu)

[ -z "$repo" ] && exit

cd ~/Repos/$repo
kitty -1 nvim . -c "NvimTreeOpen"
