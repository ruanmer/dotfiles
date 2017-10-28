# general
alias ls='ls -G'
alias la='ls -la -G'
alias ll='ls -l -G'
alias cl='clear'

alias home='cd ~'
alias ..='cd ..'

alias rm='rm -i'

alias rt='reset'
alias emptytrash='rm -fr ~/.Trash'

# prompt
export PS1='\[\033[01;32m\]➜  \[\033[01;31m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) $ '

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# z
. $(brew --prefix)/etc/profile.d/z.sh
