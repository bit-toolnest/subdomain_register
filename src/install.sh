#!/usr/bin/env bash
set -euo pipefail

# Wrapper for the main installer. Required installer variables are supplied
# by the environment (normally via: source set_env.sh && ./gradlew install).

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAIN_INSTALL="$SCRIPT_DIR/main/install.sh"

required_vars=(SERVICE_USER DOMAIN PRINCIPAL LOCAL_PORT TOKEN)
for var in "${required_vars[@]}"; do
  if [[ -z "${!var:-}" ]]; then
    echo "ERROR: Required environment variable $var is not set." >&2
    echo "Source set_env.sh before running the installer." >&2
    exit 1
  fi
done

if [ -f "$MAIN_INSTALL" ]; then
  echo "Running main installer with sudo: $MAIN_INSTALL"
  exec sudo --preserve-env=SERVICE_USER,DOMAIN,PRINCIPAL,LOCAL_PORT,TOKEN bash "$MAIN_INSTALL" "$@"
else
  echo "ERROR: main installer not found at $MAIN_INSTALL" >&2
  exit 1
fi