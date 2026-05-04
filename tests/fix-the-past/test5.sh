#!/bin/bash

cd "$HOME/fix-the-past" || exit 1

rm -f app

git status --porcelain | grep -q "^"
HAS_CHANGES=$?

if [ "$HAS_CHANGES" -eq 0 ]; then
    echo "5. Почти готово! У вас есть несохраненные изменения, сделайте git commit."
    exit 1
fi

BASE_HASH=$(git merge-base HEAD main)
CURRENT_HASH=$(git rev-parse HEAD)

if [ "$BASE_HASH" == "$CURRENT_HASH" ]; then
    echo "5. Вы не зафиксировали изменения. Создайте коммит со спасенным кодом!"
    exit 1
else
    echo "5. Победа! Вы спасли проект из истории и зафиксировали результат."
    exit 0
fi
