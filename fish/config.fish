if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

alias vim "nvim"
alias lg "gitui"
alias nvm "fnm"
alias search "rg -uuu"
alias ai "ollama run gemma"

fish_add_path "~/.local/bin"
fish_add_path "~/.composer/vendor/bin"
fish_add_path "~/go/bin"

eval "$(fnm env --use-on-cd)"

# Add Herd to the path
fish_add_path "/Users/vblinden/Library/Application Support/Herd/bin"
fish_add_path "/Users/vblinden/Library/Application Support/Herd/config/php/82"
fish_add_path "/Users/vblinden/Library/Application Support/Herd/config/php/83"

source ~/.secrets
