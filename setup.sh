#!/bin/bash

# DATA
# ==================================================

L="\x1b[34m=========>\x1b[0m\x1b[35m"
R="\x1b[0m\x1b[34m<=========\x1b[0m"

print () {
  echo -e $L $1 $R
}

DIR="$HOME/famulus"


# REMOVE SOME DIRECTORIES FROM HOME
# ==================================================

dir_arr=( "Music" "Pictures" "Documents" "Public" "Videos" "Templates" )

for dir in "${dir_arr[@]}"
do
  path="$HOME/$dir"
  if [ -d "$path" ] ; then
    rmdir $path
  fi
done
print "useless home directories deleted"


# CONFIGURE GIT
# ==================================================

git config --global user.email "nikolay.kalchev@abv.bg"
git config --global user.name "Nikolay Kalchev"
print "git configured"


# UPDATE && UPGRADE SYSTEM
# ==================================================

echo "update system? y/n"
read input
if [ $input == "y" ] ; then
  apt -y update && apt upgrade
  print "system up to date"
fi


# CONFIGURE MATE
# ==================================================

dconf load /org/mate/ < $DIR/mate/mate_config
print "mate environment configured"


# CONFIGURE BASH PROFILE
# ==================================================

cp $DIR/bash/.profile $HOME/.profile
print "bash profile configured"


# CONFIGURE FIREFOX
# ==================================================

firefox_profile="40147x9s.default-release/"

cp -r $DIR/firefox/$firefox_profile $HOME/.mozilla/firefox/$firefox_profile
print "firefox profile configured"


# INSTALL AND CONFIGURE VIM
# ==================================================

apt -y install vim

cp -r $DIR/.vim/ $HOME/.vim
print "vim installed && configured"


# INSTALL AND CONFIGURE VSCODE
# ==================================================

apt -y install code
cp $DIR/vscode/settings.json $HOME/.config/Code/User/settings.json
print "vscode installed && configured"


# INSTALL AND CONFIGURE NIM
# ==================================================

if [ ! -d "$HOME/.nimble" ] ; then
  curl https://nim-lang.org/choosenim/init.sh -sSf | sh
fi
print "nim installed"


# INSTALL GO
# ==================================================

GOTAR="go1.17.5.linux-amd64.tar.gz"

if [ ! -d "$HOME/go" ] ; then
  wget https://dl.google.com/go/$GOTAR
  tar -C $HOME -xzf $GOTAR
  rm -r $GOTAR
fi

print "go installed"


# INSTALL GHC
# ==================================================

apt -y install ghc  
print "ghc installed"


# INSTALL AND CONFIGURE POSTGRESQL
# ==================================================

apt -y install postgresql
sudo cp $DIR/psql/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
sudo systemctl restart postgresql.service
print "postgresql installed && configured"


# INSTALL NGINX
# ==================================================

apt -y install nginx
print "nginx installed"


# INSTALL TYPESCRIPT
# ==================================================

apt -y install node-typescript
print "typescript installed"


# INSTALL RUST
# ==================================================

if [ ! -d "$HOME/.cargo" ] ; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
print "rust installed"


# SETUP DIRECTORIES
# ==================================================

if [ ! -d "$HOME/bin" ] ; then
  mkdir $HOME/bin
fi
print "~/bin/ directory created"

if [ ! -d "$HOME/src" ] ; then
  mkdir $HOME/src
fi
print "~/src/ directory created"


# CLONE AND COMPILE TOOLS
# ==================================================

# clone () {
#   if [ ! -d "${src}/$1" ] ; then
#     git clone https://github.com/hilbertshotel/$1
#     cd $src/$1
#   fi
# }

# src = "$HOME/src"
# cd $src


# if [ ! -d "${src}/lines" ] ; then
#   git clone https://github.com/hilbertshotel/lines
#   cd $HOME/src/$1
#   go mod tidy
#   go build $1
#   mv $1 $HOME/bin/$1
# fi


# ghc -O2 src/Main.hs -o bin/lines -i:src -no-keep-hi-files -no-keep-o-files -XLambdaCase





echo 
echo -e "\x1b[36mFamulus has finished. Please reboot your system, sire.\x1b[0m"