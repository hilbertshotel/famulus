#!/bin/bash

L="\x1b[36m=========>\x1b[0m\x1b[32m"
R="\x1b[0m\x1b[36m<=========\x1b[0m"

print () {
  echo -e $L $1 $R
}

DIR="$HOME/famulus"


# BACKUP MATE CONFIGURATION
# ==================================================

dconf dump /org/mate/ > $DIR/mate/mate_config
print "successful MATE config backup"


# BACKUP VSCODE CONFIGURATION
# ==================================================

cp $HOME/.config/Code/User/settings.json $DIR/vscode/settings.json
print "successful VSCODE config backup"


# BACKUP BASH PROFILE
# ==================================================

cp $HOME/.profile $DIR/bash/.profile
print "successful BASH profile backup"
