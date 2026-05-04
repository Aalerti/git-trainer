#!/bin/bash

REPO_DIR="$HOME/orbital-failure"
TMP_DIR="$(mktemp -d /tmp/orbital-failure.XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

if ! cp -R "$REPO_DIR" "$TMP_DIR/repo" 2>/dev/null; then
    echo "6. Не удалось подготовить временную копию репозитория."
    exit 1
fi

cd "$TMP_DIR/repo" || exit 1


if ! git log -1 >/dev/null 2>&1; then
    echo "6. Не удалось получить историю коммитов."
    exit 1
fi


INITIAL_HASH="$(git rev-list --max-parents=0 HEAD)"
CURRENT_HASH="$(git rev-parse HEAD)"

if [[ "$INITIAL_HASH" = "$CURRENT_HASH" ]]; then
    echo "6. Убедитесь, что вы сделали новый коммит с исправлениями."
    exit 1
fi


if git log -p include/constants.h | grep -q "6.6743015e-11"; then
    echo "6. Изменения констант зафиксированы в истории Git."
    exit 0
else
    echo "6. Убедитесь, что вы исправили константы через коммит."
    exit 1
fi