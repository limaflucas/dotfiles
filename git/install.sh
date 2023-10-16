#!/bin/zsh
GIT_FILE="gitconfig"

if [ ! -f "$GIT_FILE" ]; then
    echo "Before running, ensure you have generated the $GIT_FILE file"
    return -1;
fi

echo "Copying $GIT_FILE"
cp $GIT_FILE $HOME/.$GIT_FILE

echo "All set! You are free to go."
return 0;
