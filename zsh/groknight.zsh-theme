# GrokNight / GrokDay — oh-my-zsh prompt.
# Colors follow the OS appearance (scripts/appearance): dark matches Ghostty
# "Grok Dark", light matches Grok Day / Ghostty "Grok Light".

_grok_dotfiles() {
  if [[ -n ${DOTFILES:-} && -f ${DOTFILES}/scripts/appearance ]]; then
    print -r -- "$DOTFILES"
    return 0
  fi
  if [[ -L $HOME/.zshrc ]]; then
    local link
    link=$(readlink "$HOME/.zshrc")
    [[ $link != /* ]] && link="$HOME/$link"
    print -r -- "$(cd "$(dirname "$link")/.." && pwd)"
    return 0
  fi
  print -r -- "$HOME/Code/vblinden/dotfiles"
}

grok_apply_theme() {
  local force=0
  [[ ${1:-} == --force ]] && force=1
  if (( force == 0 )) && (( SECONDS - ${_grok_theme_checked:--999} < 2 )); then
    return
  fi
  _grok_theme_checked=$SECONDS

  local root mode
  root=$(_grok_dotfiles)
  if [[ -f $root/scripts/appearance ]]; then
    mode=$(sh "$root/scripts/appearance" 2>/dev/null) || mode=dark
  else
    mode=dark
  fi
  [[ $mode == light ]] || mode=dark
  [[ $mode == ${_grok_theme_mode:-} ]] && return
  _grok_theme_mode=$mode

  local accent red amber teal muted lscolors
  local ls_colors
  if [[ $mode == light ]]; then
    # GrokDay user chrome is gray (#444444), not the assistant magenta.
    accent="#444444"
    red="#cd3048"
    amber="#a27612"
    teal="#378e23"
    muted="#767676"
    # Bold black directories (ANSI black), not magenta.
    lscolors="AxExcxdxCxegedabagacad"
    ls_colors="di=1;38;2;38;38;38:ln=1;38;2;47;100;210:so=38;2;10;142;112:pi=38;2;162;118;18:ex=1;38;2;55;142;35:bd=1;38;2;47;100;210:cd=1;38;2;47;100;210:su=1;38;2;205;48;72:sg=1;38;2;162;118;18:tw=1;38;2;55;142;35:ow=1;38;2;162;118;18:or=1;38;2;205;48;72:mi=1;38;2;205;48;72:*.md=38;2;68;68;68:*.json=38;2;162;118;18:*.yml=38;2;162;118;18:*.yaml=38;2;162;118;18:*.toml=38;2;162;118;18:*.php=38;2;68;68;68:*.py=38;2;55;142;35:*.rs=38;2;47;100;210:*.go=38;2;47;100;210:*.ts=38;2;47;100;210:*.tsx=38;2;47;100;210:*.js=38;2;162;118;18:*.jsx=38;2;162;118;18:*.sh=38;2;55;142;35:*.zsh=38;2;55;142;35:*.lua=38;2;47;100;210"
  else
    accent="#bb9af7"
    red="#f7768e"
    amber="#e0af68"
    teal="#1abc9c"
    muted="#6c6c6c"
    lscolors="FxExcxdxCxegedabagacad"
    ls_colors="di=1;38;2;187;154;247:ln=1;38;2;122;162;247:so=38;2;26;188;156:pi=38;2;224;175;104:ex=1;38;2;158;206;106:bd=1;38;2;122;162;247:cd=1;38;2;122;162;247:su=1;38;2;247;118;142:sg=1;38;2;224;175;104:tw=1;38;2;158;206;106:ow=1;38;2;224;175;104:or=1;38;2;247;118;142:mi=1;38;2;247;118;142:*.md=38;2;200;200;200:*.json=38;2;224;175;104:*.yml=38;2;224;175;104:*.yaml=38;2;224;175;104:*.toml=38;2;224;175;104:*.php=38;2;187;154;247:*.py=38;2;158;206;106:*.rs=38;2;122;162;247:*.go=38;2;122;162;247:*.ts=38;2;122;162;247:*.tsx=38;2;122;162;247:*.js=38;2;224;175;104:*.jsx=38;2;224;175;104:*.sh=38;2;158;206;106:*.zsh=38;2;158;206;106:*.lua=38;2;122;162;247"
  fi

  # folder  on branch*  ›
  PROMPT="%B%F{${accent}}%1~%f%b"
  PROMPT+='$(git_prompt_info)'
  PROMPT+=" %(?:%F{${accent}}:%F{${red}})%1{›%}%f "

  ZSH_THEME_GIT_PROMPT_PREFIX=" %F{${muted}}on %B%F{${accent}}"
  ZSH_THEME_GIT_PROMPT_SUFFIX='%f%b'
  ZSH_THEME_GIT_PROMPT_DIRTY="%b %F{${amber}}%1{*%}%f"
  ZSH_THEME_GIT_PROMPT_CLEAN="%b %F{${teal}}%1{·%}%f"

  export CLICOLOR=1
  export LSCOLORS="$lscolors"
  export LS_COLORS="$ls_colors"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd grok_apply_theme
grok_apply_theme
