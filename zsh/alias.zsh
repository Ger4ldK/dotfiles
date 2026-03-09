rc () {
    clear;
    unset timer;
    source $HOME/.zshrc
}
changeTheme () {
    cwal --saturation 0.1 --contrast 0.1 --alpha 0.1 --backend libimagequant --out-dir $CWAL_OUT_DIR --img "$1" --script $HOME/.config/cwal/script.sh;
}
cw () {
    setwallpaper -m scale "$1";
    changeTheme "$1";
    clear&&fastfetch;
}

alias ls="ls -h --color"
alias l="ls -hla --color"
