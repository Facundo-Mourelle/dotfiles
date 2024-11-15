# Setup fzf
# ---------
if [[ ! "$PATH" == */home/facumou/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/facumou/.fzf/bin"
fi

source <(fzf --zsh)
