#!/bin/zsh
#!/bin/zsh
if [ -z "$1" ]; then
    EPATH="$HOME/.emacs.d"
else
    EPATH="$1"
fi

echo "Using $EPATH as Emacs config path"

if [ -d "$EPATH" ]; then
    echo "Backing up current Emacs files"
    mv "$EPATH" "$EPATH.bkp"
    rm -rf "$EPATH"
fi

echo "Creating directory structures"
mkdir -p "$EPATH/scripts"

echo "Installing scripts"
cp "README.org" "early-init.el" "init.el" "$EPATH/."
cp "./scripts/completion-config.el" "./scripts/elpaca-config.el" "$EPATH/scripts/."

echo "Installation completed"
