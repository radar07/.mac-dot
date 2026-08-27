#!/bin/sh

# some useful options (man zshoptions)
setopt autocd menucomplete
setopt interactive_comments
setopt appendhistory

stty stop undef  # Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# load zsh functions
source "$ZDOTDIR/.zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

bindkey -s '^o' 'yazi^M'
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down

##### Evals #####

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

##### Vim mode #####

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

##### Aliases #####

alias ff="fastfetch"

# Colorize grep output (good for log files)
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# eza instead of ls
alias ls="eza --color=always --grid --icons --group-directories-first"
alias la="eza -a --color=always --grid --icons --group-directories-first"
alias ll="eza -l --color=always --grid --icons --group-directories-first"
alias lla="eza -al --color=always --grid --icons --group-directories-first";

# confirm before overwriting
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias cat="bat"

# to show unicode characters in tmux sessions
alias tmux="tmux -u"

alias ff="fastfetch"

# git shell aliases
alias g="git"
alias m="git checkout master"
alias mm="git checkout main"

# easier to read disk
alias df="df -h"

# lazygit
alias lg="lazygit"

# lazyjj
alias lj="lazyjj"

# cd for directory jumping
alias cd="z"

# vim for neovim
alias vim="nvim"

##### Exports #####
export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="$PATH:$(go env GOPATH)/bin"

export GPG_TTY=$(tty)

