if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

alias vim "nvim"
alias lg "gitui"
alias nvm "fnm"
alias search "rg -uuu"
alias ai "ollama run gemma"

fish_add_path "/Users/vblinden/.local/bin"
fish_add_path "/Users/vblinden/.composer/vendor/bin"
fish_add_path "/Users/vblinden/go/bin"

eval "$(fnm env --use-on-cd)"

source ~/.secrets
