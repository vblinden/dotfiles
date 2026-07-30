# Kube config helpers
kubeuxd() {
  export KUBECONFIG="$HOME/Code/kube/uxd.yml"
  echo "KUBECONFIG set to: $KUBECONFIG"
}

kubeshop() {
  export KUBECONFIG="$HOME/Code/kube/wlshop.yml"
  echo "KUBECONFIG set to: $KUBECONFIG"
}

# mkdir + cd
mkd() {
  mkdir -p "$@" && cd "${@: -1}"
}

# Pest / PHPUnit
p() {
  if [ -f vendor/bin/pest ]; then
    vendor/bin/pest "$@"
  elif [ -f vendor/bin/phpunit ]; then
    vendor/bin/phpunit "$@"
  else
    echo "No pest or phpunit found in vendor/bin"
    return 1
  fi
}

pf() {
  if [ -f vendor/bin/pest ]; then
    vendor/bin/pest --filter "$@"
  elif [ -f vendor/bin/phpunit ]; then
    vendor/bin/phpunit --filter "$@"
  else
    echo "No pest or phpunit found in vendor/bin"
    return 1
  fi
}

# Delete local branches whose remotes are gone
git-prune-local() {
  git fetch -p && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D
}

# gh clone shorthand: clone owner/repo
clone() {
  gh repo clone "$1" "${@:2}"
}

# Readable dig
digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# Quick MySQL helpers: db create|drop|refresh|list [name]
db() {
  case "$1" in
    refresh) mysql -uroot -e "drop database \`$2\`; create database \`$2\`" ;;
    create)  mysql -uroot -e "create database \`$2\`" ;;
    drop)    mysql -uroot -e "drop database \`$2\`" ;;
    list)    mysql -uroot -e "show databases" | sed 's/[|[:space:]]//g' ;;
    *)
      echo "Usage: db create|drop|refresh|list [name]"
      return 1
      ;;
  esac
}

# Run Laravel scheduler every minute (local dev)
scheduler() {
  while :; do
    php artisan schedule:run
    echo "Sleeping 60 seconds..."
    sleep 60
  done
}

# AI commit message via Grok (or pass your own message)
# Usage: commit            # generate from staged diff
#        commit "message"  # normal commit with message
commit() {
  if [[ -n "$*" ]]; then
    git commit -m "$*"
    return $?
  fi

  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Not a git repository."
    return 1
  fi

  if git diff --staged --quiet; then
    echo "No staged changes. Stage files first (git add)."
    return 1
  fi

  if ! command -v grok &>/dev/null; then
    echo "grok CLI not found. Commit with a message: commit \"your message\""
    return 1
  fi

  echo "Generating commit message with Grok..."
  local msg
  msg=$(
    git diff --staged | grok -p "Write a concise git commit message for these staged changes.
Rules:
- Output ONLY the commit message text, nothing else
- Prefer conventional commits (feat/fix/chore/docs/refactor/test) when clear
- Subject line <= 72 chars; optional body after a blank line if needed
- No quotes around the message" --disable-web-search --no-memory 2>/dev/null
  )

  # Strip surrounding quotes / whitespace
  msg=$(echo "$msg" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' -e 's/^["'\'']//' -e 's/["'\'']$//')

  if [[ -z "$msg" ]]; then
    echo "Failed to generate a commit message."
    return 1
  fi

  echo ""
  echo "Message:"
  echo "--------"
  echo "$msg"
  echo "--------"
  git commit -m "$msg"
}
