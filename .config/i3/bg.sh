#!/bin/sh

killall xwinwrap

sleep 1

xwinwrap -g 3840x2160 -b -s -st -sp -nf -ov -fdt -- mpv -wid WID --really-quiet --framedrop=vo --no-audio --loop --osc=no --osd-bar=no --osd-level=0 --screen=0 ~/Videos/pexels-matthias-groeneveld-5292752.mp4