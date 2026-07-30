# GrokNight ls colors (override oh-my-zsh defaults)
# LSCOLORS = BSD/macOS ls (-G); LS_COLORS = GNU ls / eza / tree / fd / etc.
export CLICOLOR=1
export LSCOLORS="FxExcxdxCxegedabagacad"
export LS_COLORS="di=1;38;2;187;154;247:ln=1;38;2;122;162;247:so=38;2;26;188;156:pi=38;2;224;175;104:ex=1;38;2;158;206;106:bd=1;38;2;122;162;247:cd=1;38;2;122;162;247:su=1;38;2;247;118;142:sg=1;38;2;224;175;104:tw=1;38;2;158;206;106:ow=1;38;2;224;175;104:or=1;38;2;247;118;142:mi=1;38;2;247;118;142:*.md=38;2;200;200;200:*.json=38;2;224;175;104:*.yml=38;2;224;175;104:*.yaml=38;2;224;175;104:*.toml=38;2;224;175;104:*.php=38;2;187;154;247:*.py=38;2;158;206;106:*.rs=38;2;122;162;247:*.go=38;2;122;162;247:*.ts=38;2;122;162;247:*.tsx=38;2;122;162;247:*.js=38;2;224;175;104:*.jsx=38;2;224;175;104:*.sh=38;2;158;206;106:*.zsh=38;2;158;206;106:*.lua=38;2;122;162;247"

# History settings.
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY     # Immediately append to history file
setopt EXTENDED_HISTORY       # Record timestamp in history
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file
setopt SHARE_HISTORY          # Share history between all sessions

# Execute commands using history (e.g. !$) immediately
unsetopt HIST_VERIFY

export LANG=en_US.UTF-8
export EDITOR=nvim

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$HOME/.grok/bin:$PATH"

# Prefer bat as the man pager when available
if command -v bat &>/dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
