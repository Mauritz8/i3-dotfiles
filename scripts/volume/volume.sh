#!/bin/bash

DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

function get_volume {
    amixer -D default get PCM | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer -D default get PCM | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

volume=`get_volume`

function send_notification {
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($volume/5)) | sed 's/[0-9]//g')
    if is_mute ; then
        icon_name="$DIR/muted.png"
        notify-send -i "$DIR/muted.png" --replace-id=555 -u normal "Mute" -t 2000
        return
    elif [ "$volume" = "0" ]; then
        icon_name="$DIR/muted.png"
    elif [  "$volume" -lt "20" ]; then
        icon_name="$DIR/volume-low.png"
    elif [ "$volume" -lt "50" ]; then
        icon_name="$DIR/volume-medium.png"
    else
        icon_name="$DIR/volume-high.png"
    fi

    # Send the notification
    notify-send "$volume""     ""$bar" -i "$icon_name" -t 2000 -h string:synchronous:"$bar" --replace-id=555
}

# check if volume has changed
# if it has send a notification
while true
do
    current_volume=`get_volume`

    if [[ "$current_volume" != "$volume" ]] ; then
        volume=$current_volume
        send_notification
    fi
    sleep .3;
done

#case $1 in
#    up)
#	    # Set the volume on (if it was muted)
#	    amixer -D default set PCM on > /dev/null
#	    # Up the volume (+ 5%)
#	    amixer -D default sset PCM 5%+ > /dev/null
#	    send_notification
#	    ;;
#    down)
#	    amixer -D default set PCM on > /dev/null
#	    amixer -D default sset PCM 5%- > /dev/null
#	    send_notification
#	    ;;
#    mute)
    	# Toggle mute
#	    amixer -D default set PCM 1+ toggle > /dev/null
#        send_notification
#	    ;;
#esac
