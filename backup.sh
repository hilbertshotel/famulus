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


# BACKUP FIREFOX CONFIGURATION
# ==================================================

firefox_profile="40147x9s.default-release/"

cp -r $HOME/.mozilla/firefox/$firefox_profile $DIR/$firefox_profile
echo -e $CHECK "successful FIREFOX profile backup"


# BACKUP BASH PROFILE
# ==================================================

cp $HOME/.profile $DIR/bash/.profile
echo -e $CHECK "successful BASH profile backup"
