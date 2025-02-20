#!/bin/bash

FONT_URL="https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf"
TEMP_FONT="/tmp/FiraCodeNerdFont-Regular.ttf"
LOCAL_FONT_DIR="$HOME/.local/share/fonts"

# download
/usr/bin/timeout 35s /usr/bin/wget -q "$FONT_URL" -O "$TEMP_FONT"

if [[ -s "$TEMP_FONT" ]];then
  echo "Download Success!"
else
  echo "Download Failed!"
  exit 1
fi

/usr/bin/mkdir -p "$LOCAL_FONT_DIR"
/usr/bin/mv "$TEMP_FONT" "$LOCAL_FONT_DIR/"

# Refresh font cache
/usr/bin/fc-cache -fv
exit