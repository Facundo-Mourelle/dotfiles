# If you come from bash you might have to change your $PATH.

# Define an array to ensure uniqueness
typeset -U path

# Add necessary directories
path=(
  $HOME/bin
  $HOME/.local/bin
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
)

# Export the cleaned path
export PATH="${(j.:.)path}"
# Path to your Oh My Zsh installation.
export ZSH=/home/facumou/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

# Setup commands history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

zstyle ':completion:*' menu no

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
#
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize eza fzf zoxide aliases)

source $ZSH/oh-my-zsh.sh
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"


# Set extras
source $HOME/dotfiles/shell/alias.sh
# Start with utilities
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

alias vim='nvim'


# Set FZF source
[ -f ~/shell/.fzf.zsh ] && source ~/shell/.fzf.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/facumou/.dart-cli-completion/zsh-config.zsh ]] && . /home/facumou/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

