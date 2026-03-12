#!/usr/bin/bash

configPath="$HOME/.config/"
dotfilePath="$HOME/dotfiles/"

checkAndTouch () {
    [ ! -f $(dirname "$1") ] && mkdir -p "$( dirname "$1" )" && touch "$1"
}

copyDot () {
    checkAndTouch "$dotfilePath$2"
    cp -f "$1$2" "$dotfilePath$2"
}

copyDotFolder () {
    mkdir -p "$dotfilePath$2"
    if [ ! -z "$1$2" ]; then 
        cp -rf "$1$2"/. "$dotfilePath$2"
    fi
}

copyDotFolder "$configPath" "alacritty"
copyDotFolder "$configPath" "cwal/templates"
copyDot "$configPath" "cwal/script.sh"
copyDot "$configPath" "fastfetch/config.jsonc"
copyDotFolder "$configPath" "fuzzel"
copyDotFolder "$configPath" "niri"
copyDotFolder "$configPath" "zsh"
copyDotFolder "$configPath" "vim"
copyDotFolder "$configPath" "wezterm"
copyDotFolder "$configPath" "nvim"

