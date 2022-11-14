#!/bin/bash
# pwgen should be installed.
#
# Generate password without specific symbols:
intPW=$(pwgen -syvB -1 16 -r \`\"\~\!\@\:\'\,\.\+\(\)\;\{\}\=\-\_\\\<\>)
echo $intPW | clip.exe


#TODO: 
# 1. WSL clipboard | done
# 2. wsl-notify-send 

# Send notify on linux:
# notify-send "Пароль скопирован" -i '/usr/share/icons/Adwaita/32x32/actions/edit-copy-symbolic.symbolic.png' 
