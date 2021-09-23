#!/bin/env sh

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u josh -x polybar >/dev/null; do 
    sleep 1;
done

polybar --reload i3 &
polybar --reload spotify &
polybar --reload util &
