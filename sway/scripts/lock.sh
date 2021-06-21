#!/bin/bash
pgrep swaylock || swaylock -f -S -e --effect-greyscale --fade-in 1 --effect-blur 10x2 --indicator --clock --ring-color white --text-color white
