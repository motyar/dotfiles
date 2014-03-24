dotfiles Installation
====================

cd $HOME

git clone git://github.com/motyar/dotfiles.git

cd dotfiles

chmod +x install

./install


If you need same dotfiles for root user, run

sudo su

./install

## Forceful push

git remote set-url origin git@github.com:motyar/dotfiles.git

chmod +x push

./push


## Solarized colorscheme for Xresources
xrdb -load ~/.solarize && xterm -fullscreen

## Loading the Keyboard settings
Use xev to see keycode.

Edit .Xmodmap
Run xmodmap ~/.Xmodmap

## Load .bashrc
source .bashrc
