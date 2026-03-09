#!/usr/bin/bash

cwalOutput="$HOME/.config/cwal/out/"

# ownership (ideally by group) needs to be granted to $2 using chown, else script needs sudo on the lines to copy configs
checkAndCopy () {
    if ![ -f "$2" ]; then
        touch "$2"
    fi
    cp -f "$1" "$2"
}	

checkAndCopy "${cwalOutput}colors-sysc-greet.toml" "/usr/share/sysc-greet/themes/colors-sysc-greet.toml"
checkAndCopy "${cwalOutput}colors-fuzzel.ini" "$HOME/.config/fuzzel/colors-fuzzel.ini"
checkAndCopy "${cwalOutput}colors-niri.kdl" "$HOME/.config/niri/colors-niri.kdl"
