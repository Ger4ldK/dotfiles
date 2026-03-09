#!/usr/bin/bash
# ownership (ideally by group) needs to be granted to $2 using chown, else script needs sudo on the lines to copy configs
checkAndCopy () {
    if ! [ -f "$2" ]; then
        touch "$2"
    fi
    cp -f "$HOME/.config/cwal/out/$1" "$2"
}	

checkAndCopy "colors-sysc-greet.toml" "/usr/share/sysc-greet/themes/colors-sysc-greet.toml"
checkAndCopy "colors-fuzzel.ini" "$HOME/.config/fuzzel/colors-fuzzel.ini"
