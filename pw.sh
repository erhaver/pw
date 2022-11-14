#!/bin/bash
# pwgen should be installed.
#
# Generate password without specific symbols:
intPW=$(pwgen -syvB -1 16 -r \`\"\~\!\@\:\'\,\.\+\(\)\;\{\}\=\-\_\\\<\>)
echo $intPW | clip.exe
echo "Пароль скопирован!"
