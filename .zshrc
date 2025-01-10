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

# check if the .dotfiles repo has changed on remote and show message if so
check_git_status() {
    local repo_path="$HOME/.dotefiles"
    if [ -d "$repo_path/.git" ]; then
        cd "$repo_path" || return
        if ! git status -uno | grep -q "Your branch is up to date"; then
            echo -e "\e[31mWARNING: Local repo is out of sync with remote!\e[0m"
        fi
    fi
}

check_git_status

