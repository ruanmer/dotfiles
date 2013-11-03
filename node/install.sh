#!/bin/sh
source $HOME/.dotfiles/log.sh

# -- Node.JS -------------------------------------------------------------------
if which node &> /dev/null; then
	msg_ok "node"
else
	msg_run "node" "brew install node"
	brew install node
fi

# -- Bower ---------------------------------------------------------------------
if which bower &> /dev/null; then
	msg_ok "bower"
else
	msg_run "bower" "sudo npm install -g bower"
	sudo npm install -g bower
fi

# -- Grunt ---------------------------------------------------------------------
if which grunt &> /dev/null; then
	msg_ok "grunt"
else
	msg_run "grunt" "sudo npm install -g grunt-cli"
	sudo npm install -g grunt-cli
fi

# -- JSHint --------------------------------------------------------------------
if which jshint &> /dev/null; then
	msg_ok "jshint"
else
	msg_run "jshint" "sudo npm install -g jshint"
	sudo npm install -g jshint
fi