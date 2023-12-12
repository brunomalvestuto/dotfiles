# XDG Base spec compliant
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export _Z_DATA="$XDG_DATA_HOME/z"
export ASDF_DATA_DIR="$XDG_DATA_HOME"/asdf
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export ZSH="$XDG_DATA_HOME"/oh-my-zsh
export GVIMINIT='let $MYGVIMRC="$XDG_CONFIG_HOME/vim/gvimrc" | source $MYGVIMRC'
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

export EDITOR=vim
export LC_ALL="en_US.UTF-8"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
# ZSH_THEME="af-magic"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="gnzh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)


# ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_ITERM2=true


# Install zsh-autosuggestions
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Install ZSH syntax Highlighting
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]
then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi


plugins=(z tmux git mercurial colorize common-aliases zsh-autosuggestions zsh-syntax-highlighting)


autoload -U colors && colors

# Disable the old-fashion flow control, that allows you to use C-s ou C-x
# http://apple.stackexchange.com/questions/24310/emacs-ctrl-x-ctrl-s-command-not-working-in-terminal-app/34503#34503
stty -ixon -ixoff

export DEFAULT_USER="$USER"


bindkey '^ ' autosuggest-accept

# Customize to your needs...
#
# Enabling  vi-mode without overwriting backwards search
# bindkey -v
# bindkey '^R' history-incremental-search-backward

# AUTOSUGGEST
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bold,bg=#ff00ff,bold"
# C-SPC to accept suggestion

test -e "$XDG_CONFIG_HOME/zsh/.zshrc.local" && source "$XDG_CONFIG_HOME/zsh/.zshrc.local"
test -e "${XDG_CONFIG_HOME}/zsh/.zshrc.alias" && source "${XDG_CONFIG_HOME}/zsh/.zshrc.alias"

source $ZSH/oh-my-zsh.sh


export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
autoload -U +X bashcompinit && bashcompinit

# Dotfiles github
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# ASDF
. "$XDG_DATA_HOME/asdf/asdf.sh"
. "$XDG_DATA_HOME/asdf/completions/asdf.bash"

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
