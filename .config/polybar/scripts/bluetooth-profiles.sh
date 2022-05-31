#!/bin/bash

function usage {
    echo
    echo "Usage: $0 (current|phone|music|switch)"
    exit 0
}

function current {
    if pactl list | grep "Active Profile: a2dp-sink-ldac" > /dev/null; then
        echo ""
    else
        echo ""
    fi
}

function setprofile {
    #change the default sink
    pactl set-card-profile "$cardname" "$profilename" || echo "Problem setting profile"; exit 3
    pactl set-default-sink "$devicename" || echo "Problem setting default sink"; exit 4 
}

function switchprofile {
    if pactl list | grep "Active Profile: a2dp-sink-ldac"; then
        echo "$cardname $devicename"
        pactl set-card-profile "$cardname" "headset-head-unit" || echo "Problem setting profile"; exit 3
        pactl set-default-sink "$devicename" || echo "Problem setting default sink"; exit 4 
    else
        echo "$cardname $devicename"
        pactl set-card-profile "$cardname" "a2dp-sink-ldac" || echo "Problem setting profile"; exit 3
        pactl set-default-sink "$devicename" || echo "Problem setting default sink"; exit 4 
    fi
}
# Get Card and Device
cardname=$(pactl list | grep bluez_card | awk '{print $NF}' | head -1)
devicename=$(pactl list sinks | grep -o 'bluez_output[^>]*' | head -1)

case "$1" in
  phone)
      profilename="headset-head-unit"
      setprofile
      ;;
  music)
      profilename="a2dp-sink"
      setprofile
      ;;
  current)
      current
      ;;
  switch)
      switchprofile
      ;;
  *)
      usage
      ;;
esac

exit 0