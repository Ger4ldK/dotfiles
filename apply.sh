#!/usr/bin/bash

configPath="$HOME/.config/"
dotfilePath="$HOME/dotfiles/"

checkAndTouch () {
    [ ! -f $(dirname "$1") ] && mkdir -p "$( dirname "$1" )" && touch "$1"
}

applyDot () {
    checkAndTouch "$2"
    cp -f "$dotfilePath$1" "$2"
}

applyDotFolder () {
    mkdir -p "$2$1"
    cp -rf "$dotfilePath$1"/. "$2$1"
}

applyDotFolder "alacritty" "$configPath"
applyDotFolder "cwal/templates" "$configPath"
applyDot "cwal/script.sh" "$configPath"
applyDotFolder "fastfetch" "$configPath"
applyDotFolder "niri" "$configPath"
applyDotFolder "zsh" "$configPath"
applyDotFolder "vim" "$configPath"

