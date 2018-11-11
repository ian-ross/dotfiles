[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH="$HOME/.cabal/bin${PATH:+:}$PATH"
PATH="$HOME/.local/bin${PATH:+:}$PATH"
PATH="$HOME/.cargo/bin${PATH:+:}$PATH"
PATH="$HOME/bin${PATH:+:}$PATH"

if [[ -f .bash_profile_extras ]]
then
    . .bash_profile_extras
fi

echo PULLING ORG FILES...
cd ~/org
git pull
cd

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    echo "Starting X in 3 seconds..."
    sleep 1
    echo "Starting X in 2 seconds..."
    sleep 1
    echo "Starting X in 1 seconds..."
    sleep 1
    echo "Starting X now!"
    startx
fi
