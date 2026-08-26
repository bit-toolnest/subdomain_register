#!/bin/bash
# source set_env.sh

# Defaults with override support
export GRADLE_ARGS="${GRADLE_ARGS:---info}"
export EXECUTION_TIMEOUT="${EXECUTION_TIMEOUT:-1800}"
export SERVICE_USER="${SERVICE_USER:-}"
export DOMAIN="${DOMAIN:-bitone.in}"
export PRINCIPAL="${PRINCIPAL:-bitone}"
export LOCAL_PORT="${LOCAL_PORT:-8080}"
export TOKEN="${TOKEN:-}"
echo "Environment variables set:"
echo "  GRADLE_ARGS=$GRADLE_ARGS"
echo "  EXECUTION_TIMEOUT=$EXECUTION_TIMEOUT"



