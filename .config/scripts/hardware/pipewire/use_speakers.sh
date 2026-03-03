#!/bin/bash

pw-link playback.game_output:output_FL alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G6_840066435E1-00.analog-stereo:playback_FL
pw-link playback.game_output:output_FR alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G6_840066435E1-00.analog-stereo:playback_FR
pw-link playback.voice_output:output_FL alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G6_840066435E1-00.analog-stereo:playback_FL
pw-link playback.voice_output:output_FR alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G6_840066435E1-00.analog-stereo:playback_FR
pw-link playback.browser_output:output_FL alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G6_840066435E1-00.analog-stereo:playback_FL
pw-link playback.browser_output:output_FR alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G6_840066435E1-00.analog-stereo:playback_FR
pw-link playback.music_output:output_FL alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G6_840066435E1-00.analog-stereo:playback_FL
pw-link playback.music_output:output_FR alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G6_840066435E1-00.analog-stereo:playback_FR

pw-link -d playback.game_output:output_FL alsa_output.usb-Nacon_RIG-800PRO_Hid_Interface-00.iec958-stereo:playback_FL
pw-link -d playback.game_output:output_FR alsa_output.usb-Nacon_RIG-800PRO_Hid_Interface-00.iec958-stereo:playback_FR
pw-link -d playback.voice_output:output_FL alsa_output.usb-Nacon_RIG-800PRO_Hid_Interface-00.iec958-stereo:playback_FL
pw-link -d playback.voice_output:output_FR alsa_output.usb-Nacon_RIG-800PRO_Hid_Interface-00.iec958-stereo:playback_FR
pw-link -d playback.browser_output:output_FL alsa_output.usb-Nacon_RIG-800PRO_Hid_Interface-00.iec958-stereo:playback_FL
pw-link -d playback.browser_output:output_FR alsa_output.usb-Nacon_RIG-800PRO_Hid_Interface-00.iec958-stereo:playback_FR
pw-link -d playback.music_output:output_FL alsa_output.usb-Nacon_RIG-800PRO_Hid_Interface-00.iec958-stereo:playback_FL
pw-link -d playback.music_output:output_FR alsa_output.usb-Nacon_RIG-800PRO_Hid_Interface-00.iec958-stereo:playback_FR
