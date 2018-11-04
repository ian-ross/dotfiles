[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH=$HOME/bin:$PATH
PATH=$HOME/.cabal/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=/big/haskell/bin:$PATH
PATH=$HOME/.gem/ruby/2.2.0/bin:$PATH
PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH
PATH=/usr/local/heroku/bin:$PATH
PATH=$GOPATH/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH

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
