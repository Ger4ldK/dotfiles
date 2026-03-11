# autoload
autoload -Uz compinit
compinit

autoload -Uz up-line-or-beginning-search
zle -N up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -Uz vcs_info
