#!/bin/bash

REPO_DIR="$HOME/orbital-failure"
TMP_DIR="$(mktemp -d /tmp/orbital-failure.XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

if ! cp -R "$REPO_DIR" "$TMP_DIR/repo" 2>/dev/null; then
    echo "5. Не удалось подготовить временную копию репозитория."
    exit 1
fi

cd "$TMP_DIR/repo" || exit 1

OUT="$(./task.sh 2>/dev/null)"

EXPECTED="Calculated Orbital Velocity: 7672.62 m/s"

if echo "$OUT" | grep -q "$EXPECTED"; then
    echo "5. Орбитальная скорость вычисляется корректно."
    exit 0
else
    echo "5. Орбитальная скорость вычисляется неверно."
    exit 1
fi