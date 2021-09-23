#!/bin/zsh

source /home/josh/.cache/wal/colors.sh

echo $color6

i3lock \
--color 00000088 \
--bar-indicator \
--bar-pos h \
--bar-direction 1 \
--bar-max-height 1600 \
--bar-base-width 50 \
--bar-color `echo $color4`60 \
--bar-count 50 \
--keyhl-color `echo $color6`60 \
--bar-periodic-step 50 \
--bar-step 50 \
--bar-total-width w \
--redraw-thread \
--clock \
--force-clock \
--time-pos 135:h-260 \
--time-color $color6 \
--date-pos tx+60:ty+150 \
--date-color $color6 \
--date-align 1 \
--time-align 1 \
--status-pos 5:h-16 \
--verif-align 1 \
--wrong-align 1 \
--verif-color $color6 \
--wrong-color $color6 \
--ringver-color $color6 \
--ringwrong-color $color6 \
--modif-pos -50:-50 \
--time-size 300 \
--date-size 100 \
--time-font "ShureTechMono Nerd Font Mono" \
--date-font "ShureTechMono Nerd Font Mono" \
--layout-font "ShureTechMono Nerd Font Mono" \
--screen 1
