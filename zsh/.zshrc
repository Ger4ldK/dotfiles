include () {
    [[ -f "$1" ]] && source "$1"
}
# TODO check and install if these don't exist
include /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
include ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

include $ZSH_CONFIG_PATH/autoload.zsh
include $ZSH_CONFIG_PATH/prompt.zsh
include $ZSH_CONFIG_PATH/keybinds.zsh
include $ZSH_CONFIG_PATH/alias.zsh
include $ZSH_CONFIG_PATH/fetcher.zsh

