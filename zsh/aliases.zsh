# Trailing space: expand aliases that follow sudo (e.g. sudo l)
alias sudo='sudo '

alias vim="nvim"
alias lg="gitui"
alias search="rg -i -uuu --no-ignore"
alias nvm="fnm"
alias uuid='uuidgen | tr "[:upper:]" "[:lower:]"'
alias claer="clear"

# Modern CLI tools (only when installed)
if command -v eza &>/dev/null; then
  alias ls="eza --icons --group-directories-first"
  alias l="eza -la --icons --group-directories-first --hyperlink"
  alias lt="eza --tree --level=2 --icons"
  alias ll="eza -la --icons --group-directories-first"
fi

if command -v bat &>/dev/null; then
  alias cat="bat --style=plain"
  alias batp="bat --style=plain"
fi

if command -v rg &>/dev/null; then
  alias grep="rg"
fi

# Use `fd` explicitly (do not alias find — scripts expect BSD/GNU find)

if command -v btm &>/dev/null; then
  alias htop="btm"
  alias top="btm"
fi

# Git
alias push="git push"
alias pull="git pull"
alias gpo="git push origin"
alias uncommit="git reset --soft HEAD~1"
alias nah="git reset --hard; git clean -df"

# Composer
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"

# Laravel / PHP
alias a="php artisan"
alias mfs="php artisan migrate:fresh --seed"
alias pp="php artisan test --parallel"

# Editors / openers
alias o="open ."
alias vscode='code "`pwd`"'
alias zed='open -a /Applications/Zed.app "`pwd`"'
alias phpstorm='open -a PhpStorm "`pwd`"'

# Grok CLI
alias g="grok"
alias gy="grok --always-approve"
alias c="grok"
alias cy="grok --always-approve"

# Everyday utilities
alias hostfile="sudo \${EDITOR:-nvim} /etc/hosts"
alias sshconfig="\${EDITOR:-nvim} ~/.ssh/config"
alias ip="curl -s ifconfig.me/ip; echo"
alias flush-redis="redis-cli FLUSHALL"

# macOS-specific
if [[ $(uname) == "Darwin" ]]; then
  alias kubectl-uxd="kubectl --kubeconfig=$HOME/Code/kube/uxd.yaml --insecure-skip-tls-verify"
  alias k9s="k9s --kubeconfig ~/Code/kube/personal.yml"
  alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
  alias phpcsfixer='for file in $(git diff --name-only HEAD | grep "\.php$"); do PHP_CS_FIXER_IGNORE_ENV=1 vendor/bin/php-cs-fixer fix "$file"; done'
  alias phprec='vendor/bin/rector process $(git diff --name-only HEAD | paste -sd " " -)'
  alias phpfix='phpcsfixer && phprec'

  alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
  alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
  alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
fi
