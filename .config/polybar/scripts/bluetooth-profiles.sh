#!/bin/bash

function usage {
    echo
    echo "Usage: $0 (current|phone|music|switch)"
    exit 0
}

function current {
    if pactl list | grep "Active Profile: a2dp_sink" > /dev/null; then
        echo ""
    else
        echo ""
    fi
}

function setprofile {
    #change the default sink
    pactl set-card-profile "$cardname" "$profilename" || echo "Problem setting profile"; exit 3
    pacmd set-default-sink "$devicename" || echo "Problem setting default sink"; exit 4 
}

function switchprofile {
    if pactl list | grep "Active Profile: a2dp_sink"; then
        pactl set-card-profile "$cardname" "headset_head_unit" || echo "Problem setting profile"; exit 3
        pacmd set-default-sink "$devicename" || echo "Problem setting default sink"; exit 4 
    else
        pactl set-card-profile "$cardname" "a2dp_sink" || echo "Problem setting profile"; exit 3
        pacmd set-default-sink "$devicename" || echo "Problem setting default sink"; exit 4 
    fi
}
# Get Card and Device
cardname=$(pactl list | grep bluez_card | awk '{print $NF}')
devicename=$(pacmd list-sinks | grep -o '<bluez_sink[^>]*' | cut -d\< -f2)

case "$1" in
  phone)
      profilename="headset_head_unit"
      setprofile
      ;;
  music)
      profilename="a2dp_sink"
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