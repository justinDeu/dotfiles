#!/usr/bin/env sh

WIDTH="dynamic"
if [ "$SELECTED" = "true" ]; then
  WIDTH="0"
fi

# Hack to not have them show icons
WIDTH="0"

sketchybar --animate tanh 20 --set $NAME icon.highlight=$SELECTED label.width=$WIDTH
