#!/bin/bash

repos=$(find ~/Repositories -name "*.git" -type d -exec exa --icons -d {} \;| sed -r 's#/.git##'| sed -r 's#Repositories/##'| sed -r 's#/home/ajrx/##')
lines=$(echo "$repos" | wc -l)
repo=$(echo "$repos" |wofi -i --show dmenu --lines=$lines)

[ -z "$repo" ] && exit
echo $repo
repo=$(echo "/home/ajrx/Repositories/${repo:1}" | sed -r "s/ //")

echo "$repo"
cd $repo
kitty -1 nvim . 
