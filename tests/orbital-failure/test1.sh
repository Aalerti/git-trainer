#!/bin/bash

REPO_DIR="$HOME/orbital-failure"

if [ -d "$REPO_DIR" ]; then
    echo "1. Директория orbital-failure существует."
    exit 0
else
    echo "1. Убедитесь, что директория orbital-failure существует."
    exit 1
fi




