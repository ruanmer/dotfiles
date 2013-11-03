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

alias cask='brew cask'

# finder
alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

# dirs
alias jobs='cd ~/Documents/Jobs'
alias labs='cd ~/Documents/Labs'

# sublime editor
export EDITOR="/usr/bin/subl"

# paths > general
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"

# paths > rvm
if [ -s "$HOME/.rvm/scripts/rvm" ]; then . "$HOME/.rvm/scripts/rvm"; fi
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# prompt
export PS1='\[\033[01;32m\]\u ➜  \[\033[01;31m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) $ '

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# z
. $(brew --prefix)/etc/profile.d/z.sh

# Make Grunt print stack traces by default
command -v grunt > /dev/null && alias grunt="grunt --stack"