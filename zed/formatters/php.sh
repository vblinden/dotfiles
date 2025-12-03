#!/usr/bin/env bash

BUFFER_PATH="$1"

if [[ -z "$BUFFER_PATH" ]]; then
  echo "Error: buffer path is required" >&2
  exit 1
fi

# Create temporary file in the same directory (so config files like pint.json are found)
DIR=$(dirname "$BUFFER_PATH")
TEMP=$(mktemp "$DIR/zed-temp-XXXXXX.php")
cat > "$TEMP"

# Function to run a command and exit with its status
run_formatter() {
  "$@" --quiet "$TEMP" >/dev/null 2>&1
  local exit_code=$?
  if [[ $exit_code -eq 0 ]]; then
    cat "$TEMP"
  fi
  rm -f "$TEMP"
  exit $exit_code
}

# 1. Local Pint
if [[ -x "./vendor/bin/pint" ]]; then
  run_formatter ./vendor/bin/pint

# 2. Global Pint
elif command -v pint >/dev/null 2>&1; then
  run_formatter pint

# 3. Local php-cs-fixer
elif [[ -x "./vendor/bin/php-cs-fixer" ]]; then
  run_formatter ./vendor/bin/php-cs-fixer fix

# 4. Global php-cs-fixer
elif command -v php-cs-fixer >/dev/null 2>&1; then
  run_formatter php-cs-fixer fix

else
  echo "No formatter found (Laravel Pint or PHP-CS-Fixer)" >&2
  rm -f "$TEMP"
  exit 1
fi
