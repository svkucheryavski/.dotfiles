# Alis to track and syn changes in conf files
alias home='git --work-tree=$HOME --git-dir=$HOME/.dotfiles'

# add starship support 
eval "$(starship init zsh)"

# this is needed for VNC
export DISPLAY=:1

# run commands specific for local computer
if [ -f ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi


