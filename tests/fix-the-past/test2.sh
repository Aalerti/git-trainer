#!/bin/bash

cd "$HOME/fix-the-past" || exit 1


TARGET_COMMIT_MSG="feat(main): implement rectangle area calculation"
TARGET_HASH=$(git log --all --grep="$TARGET_COMMIT_MSG" --format="%H" -n 1)

if [ -z "$TARGET_HASH" ]; then
    echo "Системная ошибка: Целевой стабильный коммит не найден в репозитории."
    echo "Пожалуйста, сбросьте задание."
    exit 1
fi



BASE_HASH=$(git merge-base HEAD main)

if [ -z "$BASE_HASH" ]; then
    echo "Системная ошибка: Не удалось вычислить общего предка с main."
    exit 1
fi

if [ "$BASE_HASH" == "$TARGET_HASH" ]; then
    echo "2. Супер! Ваша ветка отпочковалась от правильной стабильной версии."
    exit 0
else
    echo "2. Вы взяли за основу не тот коммит! Найдите в логах коммит с rectangleArea и создайте ветку именно от него."
    exit 1
fi
