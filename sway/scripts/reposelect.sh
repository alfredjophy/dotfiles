#!/bin/bash

repos=$(find ~/GitRepos -name "*.git" -type d -exec exa --icons -d {} \;| sed -r 's#/.git##'| sed -r 's#Repos/##'| sed -r 's#/home/ajrx/##')
lines=$(echo "$repos" | wc -l)
repo=$(echo "$repos" |wofi -i --show dmenu --lines=$lines)

[ -z "$repo" ] && exit
echo $repo
repo=$(echo "/home/ajrx/GitRepos/${repo:1}" | sed -r "s/ //")

echo "$repo"
cd $repo
kitty -1 nvim . 
