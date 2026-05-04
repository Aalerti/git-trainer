#!/bin/bash
cd "$HOME/where-am-i" || exit 1

if git reflog | grep -qiE "checkout: moving from .* to [0-9a-f]{7,}"; then
    echo "3. Ага! Кто-то использовал git checkout! Это запрещено в данном задании. Вам нужно было использовать другую команду. Начните задание заново (клавиша 'r')."
    exit 1
else
  echo "3. Отличная работа! Вы использовали безопасные методы чтения истории."
  exit 0
fi

