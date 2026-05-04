FROM git-trainer:base-task-image

ARG USERNAME=student
ARG GIT_USERNAME=student
ARG GIT_EMAIL=student@alivetech.com
ENV DESCRIPTION="Произошла авария на расчетном сервере! Наш модуль вычисления орбитальных маневров (src/orbital_calc.cpp) перестал работать и выдает нулевую скорость. Долгие попытки разобраться показали, что во время недавнего масштабного рефакторинга кто-то случайно стер точное значение одной из фундаментальных физических констант, заменив её на ноль. Точно известно, что правильное многозначное число внедрялось в одном из прошлых коммитов, но история проекта забита десятками других правок, добавлением телеметрии и удалением старого кода.\nВаша задача: Найти в истории изменений коммит, в котором добавлялось правильное значение этой константы и восстановить значение в коде и сделать спасительный коммит.\nВАЖНО: в этом задании нельзя использовать git checkout <hash коммита>. Вам нужно просто заглянуть в прошлое - найти команду Git, которая позволяет ПОКАЗАТЬ содержимое коммита и изменения в нем прямо в терминале."
RUN echo -n $DESCRIPTION > /etc/git-trainer/description
COPY ./tasks/where-am-i/src/repo /home/${USERNAME}/where-am-i

# Есть вариант, что это лишнее
RUN sudo apt-get update && sudo apt-get install -y cmake build-essential

WORKDIR /home/${USERNAME}/where-am-i
RUN sudo chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/where-am-i
USER $USERNAME
RUN git config --global --add safe.directory /home/${USERNAME}/where-am-i && git switch main
