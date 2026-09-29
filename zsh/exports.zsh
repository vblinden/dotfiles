# Directory colors follow the OS appearance (GrokNight / GrokDay).
# The prompt theme applies them; this covers the case where that ran too early.
if typeset -f grok_apply_theme >/dev/null; then
  grok_apply_theme --force
fi

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
