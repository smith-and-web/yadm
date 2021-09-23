#!/usr/bin/env bash
xrdb /home/josh/.Xresources
xrandr --output DVI-D-0 --mode 2560x1440 --pos 3840x0 --rotate left --output HDMI-0 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --off --output DVI-D-1 --off
exec i3
