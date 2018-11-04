export LANG="en_GB.utf8"

export LD_LIBRARY_PATH=$HOME/lib:/usr/local/lib
export MANPATH=$HOME/man:`manpath -q`
export TEXINPUTS=.:~/lib//:
export RUST_SRC_PATH=${HOME}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export GOPATH=$HOME/go

# Make Java apps work in XMonad
export _JAVA_AWT_WM_NONREPARENTING=1

# Haskell setup
export C2HS_REGRESSION_SUITE=1
export C2HS_REGRESSION_FLAGS_CV=opencv24

if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Set prompt.
if [ "$TERM" = "xterm" -o "$TERM" = "rxvt" -o "$TERM" = "rxvt-unicode" ]
then
    PS1='\[\033[1;30m\e]0;\u@\h: \w\007\][\h:\W] $ '
    trap 'echo -ne "\033[0;30m"' DEBUG
else
    PS1='[\h:\W] $ '
fi

# Default browser.
if [ -n "$DISPLAY" ]; then export BROWSER=chromium; fi

if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi
if [ -f ~/.bash_secrets ]; then . ~/.bash_secrets; fi
if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi
source ~/.git-completion.bash
[ -f /home/iross/.travis/travis.sh ] && source /home/iross/.travis/travis.sh
eval "$(direnv hook bash)"

export AWS_DEFAULT_PROFILE=memcachier
export AWS_PROFILE=memcachier
export WWW_USER_EMAIL=ian@memcachier.com


genpasswd() {
    local l=$1
    [ "$l" == "" ] && l=16
    tr -dc A-Za-z0-9 < /dev/urandom | head -c ${l} | xargs
}

genhex() {
    local l=$1
    [ "$l" == "" ] && l=16
    tr -dc a-f0-9 < /dev/urandom | head -c ${l} | xargs
}
