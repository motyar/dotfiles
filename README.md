dotfiles
========

My ~/.Dotfiles


#

Solarized colorscheme for Xresources
====================================
To choose between light/dark bakground:

  xrdb -DSOLARIZED_LIGHT -merge ~/.Xresources
  
  xrdb -DSOLARIZED_DARK -merge ~/.Xresources

When using Xdefaults
============================
ln -s .Xdefaults .Xresources

Loading the Keyboard settings
=============================
Use xev to see keycode.

Edit .Xmodmap

Run xmodmap ~/.Xmodmap


Load .bashrc
================
source .bashrc
