#!/bin/bash

cd "$HOME/fix-the-past" || exit 1

CURRENT_BRANCH=$(git branch --show-current)

if [ -z "$CURRENT_BRANCH" ]; then
    echo "1. Вы находитесь в состоянии Detached HEAD! Создайте ветку: git checkout -b <имя_ветки>."
    exit 1
elif [ "$CURRENT_BRANCH" == "main" ]; then
    echo "1. Вы всё ещё в ветке main. Вам нужно найти стабильный коммит и создать ветку от него."
    exit 1
else
    echo "1. Отлично! Вы работаете в новой ветке: $CURRENT_BRANCH."
    exit 0
fi
