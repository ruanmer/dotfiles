#!/bin/sh

# Tells the shell script to exit if it encounters an error
set -e

# -- Log -----------------------------------------------------------------------
# Duplicated code from log.sh
# since we cannot import a file when installing via cURL
function msg {
    echo  "\033[0;37m$1\033[0m";
}

function msg_ok {
    echo  "➜\033[1;32m $1 ✔\033[0m";
}

function msg_run {
    echo  "➜\033[1;35m $1 $ $2\033[0m";
}

# -- Hello :) ------------------------------------------------------------------
msg '                                     '
msg '     | |     | |  / _(_) |           '
msg '   __| | ___ | |_| |_ _| | ___  ___  '
msg '  / _` |/ _ \| __|  _| | |/ _ \/ __| '
msg ' | (_| | (_) | |_| | | | |  __/\__ \ '
msg '  \__,_|\___/ \__|_| |_|_|\___||___/ '
msg '                                     '

# -- Homebrew ------------------------------------------------------------------
if which brew &> /dev/null; then
    msg_ok "homebrew"

    # Make sure we’re using the latest Homebrew
    brew update

    # Upgrade any already-installed formulae
    brew upgrade
else
    msg_run "homebrew" "ruby -e '$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)'"
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

# -- Git -----------------------------------------------------------------------
if which git &> /dev/null; then
    msg_ok "git"
else
    msg_run "git" "brew install git"
    brew install git
fi

# -- Dotfiles ------------------------------------------------------------------
if [[ -d "$HOME/.dotfiles" ]]; then
    msg_ok "dotfiles"
else
    msg_run "dotfiles" "git clone https://github.com/ruanmer/dotfiles.git $HOME/.dotfiles"
    git clone https://github.com/ruanmer/dotfiles.git $HOME/.dotfiles
fi

# -- Config --------------------------------------------------------------------
if [[ -L "$HOME/.bash_profile" ]]; then
	msg_ok "bash_profile"
else
	msg_run "bash_profile" "ln -s $HOME/.dotfiles/.bash_profile $HOME/.bash_profile"
	ln -s $HOME/.dotfiles/.bash_profile $HOME/.bash_profile
fi

# -- Z -------------------------------------------------------------------------
if [[ -d "$HOME/.z" ]]; then
    msg_ok "z"
else
    msg_run "z" "brew install z"
    brew install z
fi

# -- Bash-completion -----------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    msg_ok "bash-completion"
else
    msg_run "bash-completion" "brew install bash-completion"
    brew install bash-completion
fi

# -- Installers ----------------------------------------------------------------
# Find the installers and run them iteratively
cd "$HOME/.dotfiles/$(dirname $)"/..
find . -name install.sh | while read installer ; do sh -c "${installer}" ; done
