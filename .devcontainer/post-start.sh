#!/usr/bin/env bash
set -e
git config --global --add safe.directory "${CONTAINER_WORKSPACE_FOLDER:-$PWD}"
