#!/usr/bin/bash

configPath="$HOME/.config/"
dotfilePath="$HOME/dotfiles/"

checkAndTouch () {
    [ ! -f $(dirname "$1") ] && mkdir -p "$( dirname "$1" )" && touch "$1"
}

applyDot () {
    checkAndTouch "$configPath$1"
    cp -f "$dotfilePath$1" "$configPath$1"
}

applyDotFolder () {
    mkdir -p "$2$1"
    if [ ! -z "$dotfilePath$1" ]; then 
        cp -rf "$dotfilePath$1"/. "$2$1"
    fi
}

applyDotFolder "alacritty" "$configPath"
applyDotFolder "cwal/templates" "$configPath"
applyDot "cwal/script.sh" "$configPath"
applyDotFolder "fastfetch" "$configPath"
applyDotFolder "fuzzel" "$configPath"
applyDotFolder "niri" "$configPath"
applyDotFolder "zsh" "$configPath"
applyDotFolder "vim" "$configPath"
applyDotFolder "wezterm" "$configPath"

