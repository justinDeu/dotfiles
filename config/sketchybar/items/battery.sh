#!/usr/bin/env sh

sketchybar --add event battery_update \
 					 --add item battery right       \
  				 --set battery script="$PLUGIN_DIR/power.sh"                \
                         update_freq=5 \
    						         icon=􀛨                      \
    						         icon.color=0xffbf616a        \
           --subscribe battery battery_update
