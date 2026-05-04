#!/bin/bash

cd "$HOME/where-am-i" || exit 1

rm -rf build
mkdir build && cd build
cmake .. > /dev/null 2>&1
make > /dev/null 2>&1


if [ $? -ne 0 ]; then
    echo "1. Ошибка компиляции! Вы точно вернули константу и правильно её назвали?"
    exit 1
fi

cd ..
OUTPUT=$(./build/orbital_app)
if echo "$OUTPUT" | grep -q "7672"; then
    echo "1. Сборка успешна! Орбитальная скорость рассчитана верно."
    exit 0
else
    echo "1. Код компилируется, но расчеты неверны. Точное ли значение нужной константы вы нашли?"
    exit 1
fi