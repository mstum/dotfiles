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

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -laG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgExEx"
export GREP_OPTIONS="--color"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export WORDCHARS='*?[]~&;!$%^<>'

activate_virtualenv() {
    if [ -f env/bin/activate ]; then . env/bin/activate;
    elif [ -f ../env/bin/activate ]; then . ../env/bin/activate;
    elif [ -f ../../env/bin/activate ]; then . ../../env/bin/activate;
    elif [ -f ../../../env/bin/activate ]; then . ../../../env/bin/activate;
    fi
}

# Set up rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

function movtogif {
  if [[ $# = 0 ]]
  then
    echo "USAGE: movtogif filename.mov"
  else
    ffmpeg -i $1 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1:r.gif
  fi
}
