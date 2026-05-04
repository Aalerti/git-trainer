#!/bin/bash

REPO_DIR="$HOME/orbital-failure"
TMP_DIR="$(mktemp -d /tmp/orbital-failure.XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

if ! cp -R "$REPO_DIR" "$TMP_DIR/repo" 2>/dev/null; then
    echo "4. Не удалось подготовить временную копию репозитория."
    exit 1
fi

cd "$TMP_DIR/repo" || exit 1

if ! grep -q "6.6743015e-11" include/constants.h; then
    echo "4. Убедитесь, что повреждённые константы восстановлены корректно."
    exit 1
fi

if ! grep -q "5.9722e24" include/constants.h; then
    echo "4. Убедитесь, что повреждённые константы восстановлены корректно."
    exit 1
fi

echo "4. Повреждённые константы восстановлены."
exit 0