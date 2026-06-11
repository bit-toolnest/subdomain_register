#!/usr/bin/env bash
set -euo pipefail

# run-install.sh
# Simple wrapper that calls the main installer in a nearby folder

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAIN_INSTALL="$SCRIPT_DIR/main/install.sh"

if [ -x "$MAIN_INSTALL" ]; then
  echo "Running main installer: $MAIN_INSTALL"
  exec "$MAIN_INSTALL" "$@"
else
  echo "ERROR: main installer not found at $MAIN_INSTALL" >&2
  exit 1
fi
