#!/bin/bash

cd "$HOME/fix-the-past" || exit 1

if [ ! -f main.cpp ]; then
  echo "4. Ошибка: Файл main.cpp вообще не найден! Вы его случайно не удалили?"
  exit 1
fi

# delete предыдущего на всякий
rm -f app
g++ main.cpp -o app > /dev/null 2>&1
COMPILE_COMPLETED=$?

if [ "$COMPILE_COMPLETED" -ne 0 ]; then
  echo "4. Ошибка: Программа не скомпилировалась, проверьте правильно ли вы ее исправили."
  exit 1
fi

PROGRAM_OUTPUT=$(./app)
STATUS_RUN=$?

if [ "$STATUS_RUN" -ne 0 ]; then
  echo "4. Ошибка во время runtime! Проверьте на правильность вашу программу"
  exit 1
fi

echo "$PROGRAM_OUTPUT" | grep -q "Площадь прямоугольника (4x5): 20"
RECTANGLE_AREA=$?

echo "$PROGRAM_OUTPUT" | grep -q "Площадь треугольника (4x5): 10"
TRIANGLE_AREA=$?

if [ "$RECTANGLE_AREA" -eq 0 ] && [ "$TRIANGLE_AREA" -eq 0 ]; then
  echo "4. Отличная работа! Программа скомпилировалась и успешно решила поставленную задачу"
  exit 0
else
  echo "4. Ошибка: вывод программы не совпадает с требуемым в условии задачи, Проверьте, есть ли в выводе строки: Площадь прямоугольника (4x5): <возвращаемое значение из соответствующей функции> / Площадь треугольника (4x5): <возвращаемое значение из соответствующей функции>"
  exit 1
fi

