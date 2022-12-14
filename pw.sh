#!/bin/bash
# pwgen should be installed.
#
# Generate password without specific symbols:
intPW=$(pwgen -syvB -1 16 -r \`\"\~\!\@\:\'\,\.\+\(\)\;\{\}\=\-\_\\\<\>)
# Copy and print password.
# Uncomment next line if you want it:
#echo "$intPW" | xclip -filter -selection clipboard
# Copy but don't print password:
echo "$intPW" | xclip -selection clipboard
# Send notify.
# Change icon if you want:
notify-send --hint int:transient:1 "pwgen" "Пароль скопирован" -i '/usr/share/icons/Adwaita/32x32/actions/edit-copy-symbolic.symbolic.png' 
