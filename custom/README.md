# Machine-local overrides

This directory is a *template only*. Real overrides live outside the repo:

```
~/.dotfiles-custom/shell/exports.zsh
~/.dotfiles-custom/shell/aliases.zsh
~/.dotfiles-custom/shell/functions.zsh
~/.dotfiles-custom/shell/zshrc.zsh
```

Create any of those files and they are sourced after the shared config (and after `~/.secrets`).

Use this for work-specific API keys (prefer `~/.secrets`), host-only aliases, or anything that should not be public.
