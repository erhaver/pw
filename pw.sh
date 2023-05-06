#!/bin/bash
# pwgen should be installed.

# Generate password without specific symbols:
intPW=$(pwgen -syvB -1 16 -r \`\"\~\!\@\:\'\,\.\+\(\)\;\{\}\=\-\_\\\<\>)

echo "$intPW" | xclip -selection clipboard
# Uncomment next line if you use wl-copy
# echo "$intPW" | wl-copy

# Send notify.
notify-send -t 1200 --hint int:transient:1 "pwgen" "Пароль скопирован" -i '/usr/share/icons/Adwaita/32x32/actions/edit-copy-symbolic.symbolic.png' 
