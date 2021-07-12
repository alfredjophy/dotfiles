#!/bin/bash

repos=$(find ~/Repos -name "*.git" -type d -exec exa --icons -d {} \;| sed -r 's#/.git##'| sed -r 's#Repos/##'| sed -r 's#/home/ajrx/##')
repo=$(echo "$repos" |wofi --show dmenu)

[ -z "$repo" ] && exit
echo $repo
repo=$(echo "/home/ajrx/Repos/${repo:1}" | sed -r "s/ //")

echo "$repo"
cd $repo
kitty -1 nvim . -c "NvimTreeOpen"
