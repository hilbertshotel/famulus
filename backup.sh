#!/bin/bash

CHECK="\x1b[32mok:\x1b[0m"
DIR="$HOME/famulus"


# BACKUP MATE CONFIGURATION
# ==================================================

dconf dump /org/mate/ > $DIR/mate/mate_config
echo -e CHECK "successful MATE config backup"


# BACKUP VSCODE CONFIGURATION
# ==================================================

cp $HOME/.config/Code/User/settings.json $DIR/vscode/settings.json
echo -e CHECK "successful VSCODE config backup"


# BACKUP BASH PROFILE
# ==================================================

cp $HOME/.profile $DIR/bash/.profile
echo -e $CHECK "successful BASH profile backup"
