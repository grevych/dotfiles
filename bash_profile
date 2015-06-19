# Author: Marin Alcaraz
# Platform: OS X

#-----------BEHAVIORS---------

#Terminal behaves likes vi
set -o vi

#Colored man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

#No bell
set bell-style none

#------------ENVIRONMENT VARIABLES-------------
export PATH=/usr/local/go/bin:/usr/local/bin:/usr/pkg/bin:/usr/pkg/sbin:$PATH
export EDITOR=vim
export SHELL=bash
export MANPATH=/usr/pkg/man:$MANPATH

#------------ALIAS------------
alias l='ls -l'
alias show-hidden='defaults write com.apple.Finder AppleShowAllFiles TRUE'
alias hide='defaults write com.apple.Finder AppleShowAllFiles FALSE'
alias ne='mvim'

#------------PS---------------

PS1='\[\e[1;32m\]\u@\W$>\[\e[0m\] '
SUDO_PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'
