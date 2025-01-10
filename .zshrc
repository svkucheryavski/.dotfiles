# Alis to track and syn changes in conf files
alias home='git --work-tree=$HOME --git-dir=$HOME/.dotfiles'

# add local bin directory to path
export PATH="$HOME/bin:$PATH"

# add starship support 
eval "$(starship init zsh)"

# this is needed for VNC
export DISPLAY=:1


# if yazi is called with "y" it will change local directory on quit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# run commands specific for local computer
if [ -f ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi

# check if the .dotfiles repo has changed on remote and show message if so
check_git_status() {
    local repo_path="$HOME"
    if [ -d "$repo_path/.dotfiles" ]; then
        cd "$repo_path" || return
        if ! home status -uno | grep -q "Your branch is up to date"; then
            echo -e "\e[31mWARNING: Local .dotfiles repo is out of sync with remote!\e[0m"
        fi
    fi
}

check_git_status

