# GrokNight — oh-my-zsh theme inspired by Grok Build's TUI
#
# Palette (truecolor):
#   accent   #bb9af7  magenta
#   teal     #1abc9c
#   red      #f7768e
#   amber    #e0af68
#   muted    #6c6c6c

# ◆  folder  on branch*  ›
# Only the last path segment (current directory name)
PROMPT='%(?:%F{#bb9af7}%1{◆%}:%F{#f7768e}%1{◆%}) '
PROMPT+='%B%F{#bb9af7}%1~%f%b'
PROMPT+='$(git_prompt_info)'
PROMPT+=' %(?:%F{#bb9af7}:%F{#f7768e})%1{›%}%f '

# Git: muted "on", magenta branch, amber dirty / teal clean
ZSH_THEME_GIT_PROMPT_PREFIX=' %F{#6c6c6c}on %B%F{#bb9af7}'
ZSH_THEME_GIT_PROMPT_SUFFIX='%f%b'
ZSH_THEME_GIT_PROMPT_DIRTY='%b %F{#e0af68}%1{*%}%f'
ZSH_THEME_GIT_PROMPT_CLEAN='%b %F{#1abc9c}%1{·%}%f'
