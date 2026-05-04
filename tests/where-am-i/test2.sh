#!/bin/bash

cd "$HOME/where-am-i" || exit 1

rm -rf build

git status --porcelain | grep -q "^"
HAS_CHANGES=$?

if [ "$HAS_CHANGES" -eq 0 ]; then
  echo "2. У вас остались незакоммиченные изменения! Сделайте git add и git commit."
  exit 1
fi

if ! git show HEAD:src/orbital_calc.cpp | grep -q "6.6743015e-11"; then
    echo "2. В вашем последнем коммите нет правильного значения константы в нужном файле."
    exit 1
else
  echo "2. Изменения успешно сохранены в историю Git!"
  exit 0
fi

