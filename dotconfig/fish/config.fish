fish_vi_key_bindings

function fish_mode_prompt
    # NOOP - Disable vim mode indicator
end

set PATH {$HOME}/bin $PATH

# alias
alias ll='ls -la'
alias g='git'
alias vim='nvim'
alias be='bundle exec'

alias d='cd ~/Desktop'
alias ws='cd ~/workspace'

# homebrew
if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
end

# anyenv
status --is-interactive; and source (anyenv init -|psub)

# iterm2
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# tmux
function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
        tmux new-session
        return
    end

    set new_session "Create New Session" 
    set ID (tmux list-sessions | fzf --reverse | cut -d: -f1)
    if test "$ID" = "$new_session"
        tmux new-session
    else if test -n "$ID"
        tmux attach-session -t "$ID"
    end
end

if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
end
