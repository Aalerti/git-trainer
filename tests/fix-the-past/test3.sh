#!/bin/bash

cd "$HOME/fix-the-past" || exit 1

if [ ! -f main.cpp ]; then
    echo "3. Ошибка: Файл main.cpp вообще не найден! Вы его случайно не удалили?"
    exit 1
fi

grep -q "[A-Za-z_]* *rectangleArea" main.cpp
HAS_RECTANGLE=$?

grep -q "[A-Za-z_]* *triangleArea" main.cpp
HAS_TRIANGLE=$?

if [ "$HAS_RECTANGLE" -eq 0 ] && [ "$HAS_TRIANGLE" -eq 0 ]; then
    echo "3. В файле присутствуют обе нужные функции. Отличная работа!"
    exit 0
else
    echo "3. В файле main.cpp не хватает кода! Вы точно перенесли triangleArea и сохранили rectangleArea?"
    exit 1
fi
