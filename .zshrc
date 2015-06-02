setopt promptsubst
autoload -U promptinit
promptinit
prompt mstum 

autoload -U compinit
compinit

# Add paths that should have been there by default
export PATH=${PATH}:/usr/local/bin
export PATH="/Users/Michael/bin:$PATH"
export PATH="$PATH:$HOME/local/node/bin:$HOME/local/lynx/bin:/opt/local/bin:/usr/local/bin"
export NODE_PATH="$HOME/local/node:$HOME/local/node/lib/node_modules"

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgExEx"
export GREP_OPTIONS="--color"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export WORDCHARS='*?[]~&;!$%^<>'

# ACTUAL CUSTOMIZATION OH NOES!
gd() { git diff $* | view -; }
gdc() { gd --cached $*; }
alias rbgrep="grep --include='*.rb' $*"
alias r=script/rails

activate_virtualenv() {
    if [ -f env/bin/activate ]; then . env/bin/activate;
    elif [ -f ../env/bin/activate ]; then . ../env/bin/activate;
    elif [ -f ../../env/bin/activate ]; then . ../../env/bin/activate;
    elif [ -f ../../../env/bin/activate ]; then . ../../../env/bin/activate;
    fi
}

# Originally from Jonathan Penn, with modifications by Gary Bernhardt
function whodoneit() {
    (set -e &&
        for x in $(git grep -I --name-only $1); do
            git blame -f -- $x | grep $1;
        done
    )
}

# Set up rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# .net
source dnvm.sh
function code {
    if [[ $# = 0 ]]
    then
      open -a "Visual Studio Code"
    else
      [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
      open -a "Visual Studio Code" --args "$F"
    fi
}
