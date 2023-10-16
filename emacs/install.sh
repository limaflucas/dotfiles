#!/bin/zsh
# checks whether the packages and configurations files are present
MY_PKGS="my-packages.el"
MY_CFGS="my-configs.el"
DOOM_DIR="$HOME/.config/doom"

if [ ! -f "$MY_PKGS" ] || [ ! -f "$MY_CFGS" ]; then
    echo "Before running, you must create your package and configuration files"
    return -1;
fi

if [ ! -d "$DOOM_DIR" ]; then
   echo "Apparently you don't have doom installed. First, complete your Doom installation and the run this script again"
   return -1;
fi

echo "Appending commands to Doom's config.el"
echo "\n(load \"~/.config/doom/my-configs\")" >> $DOOM_DIR/config.el
echo "(require 'my-configs)" >> $DOOM_DIR/config.el


echo "Appending commands to Doom's packages.el"
echo "\n(load \"~/.config/doom/my-packages\")" >> $DOOM_DIR/packages.el
echo "(require 'my-packages)" >> $DOOM_DIR/packages.el

echo "Copying custom files to $DOOM_DIR"
cp my-packages.el my-configs.el $DOOM_DIR/.
echo "All set! Your free to go."
return 0;
