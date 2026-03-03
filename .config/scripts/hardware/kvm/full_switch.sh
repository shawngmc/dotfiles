#!/bin/bash

TARGET=$1
if [ -z "$TARGET" ]; then
  echo "Usage: $0 <GAMING,FLEX,WORK,MAC>"
  exit 1
fi

if [ "$TARGET" = "GAMING" ]; then
  SWITCH_ID=1
  DELL_INPUT=0x0f
elif [ "$TARGET" = "FLEX" ]; then
  SWITCH_ID=2
  DELL_INPUT=0x11
elif [ "$TARGET" = "WORK" ]; then
  SWITCH_ID=3
  DELL_INPUT=0x11
elif [ "$TARGET" = "MAC" ]; then
  SWITCH_ID=4
  DELL_INPUT=0x11
else
  echo "Invalid target: $TARGET"
  exit 1
fi





# Set HDMI Out
# TODO: Prevent pause by checking if already current - not sure how to get status
# Web UI uses weird binary format
TS=$(date +%s%3N)
curl -X POST "http://192.168.1.147/video_set${TS}" -d "#video_d out2 matrix=$SWITCH_ID"


# Get USB Status via CGI
usb_raw=$(curl -X POST http://192.168.1.72/cgi-bin/MUH44TP_getsetparams.cgi -d "lcc")
usb_raw_json="${usb_raw:2:-1}"
usb_raw_json_fixed="${usb_raw_json//\'/\"}"
usb_output=$(echo $usb_raw_json_fixed | jq -r .Outputbuttom)
usb_output_1="${usb_output:0:1}"
usb_output_2="${usb_output:1:1}"
usb_output_3="${usb_output:2:1}"
usb_output_4="${usb_output:3:1}"


# Set KB/Mouse Out only if necessary
if [ "$usb_output_1" != "$SWITCH_ID" ]; then
    curl -X POST http://192.168.1.72/cgi-bin/MMX32_Keyvalue.cgi -d "CMD=>SetUSB 01:${SWITCH_ID}"$'\n'
    sleep 0.1
fi

if [ "$usb_output_2" != "$SWITCH_ID" ]; then
    curl -X POST http://192.168.1.72/cgi-bin/MMX32_Keyvalue.cgi -d "CMD=>SetUSB 02:${SWITCH_ID}"$'\n'
    sleep 0.1
fi

# Set Monitor Input only if necessary
CURRENT_DELL_INPUT=0$(ddcutil -d 1 getvcp 60 --brief | awk '{print $NF}')
if [ "$CURRENT_DELL_INPUT" != "$DELL_INPUT" ]; then
  ddcutil -d 1 setvcp 60 ${DELL_INPUT}
fi
