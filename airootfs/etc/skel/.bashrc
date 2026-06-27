# FlexOS bashrc
[[ $- != *i* ]] && return

PS1='\[\e[0;35m\][\[\e[0;34m\]\u\[\e[0;35m\]@\[\e[0;34m\]\h\[\e[0;35m\]] \[\e[0;33m\]\w\[\e[0;35m\]\$\[\e[0m\] '

alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'

export EDITOR=nano
export BROWSER=firefox
export TERMINAL=alacritty

neofetch
