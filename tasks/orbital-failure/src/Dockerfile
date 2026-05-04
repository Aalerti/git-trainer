FROM git-trainer:base-task-image

ARG USERNAME=student
ARG GIT_USERNAME=student
ARG GIT_EMAIL=student@alivetech.com
ENV DESCRIPTION="Вы подключились к небольшому проекту для расчёта орбитальных параметров спутника. Проект раньше работал корректно, но после серии рефакторингов программа начала выдавать физически невозможные результаты. По словам разработчиков, во время большого перехода на новую структуру проекта были случайно повреждены некоторые физические константы. Ваша задача - восстановить корректную работу программы, используя историю Git, сделать коммит с исправленными значениями. Нельзя просто откатить проект на старый коммит: текущая структура проекта уже изменилась, появился CMake, файлы были перемещены, а старые версии исходников больше не подходят напрямую.\nЧтобы собрать проект: \ncd orbital-failure\n./task.sh"
RUN echo -n $DESCRIPTION > /etc/git-trainer/description
COPY ./tasks/orbital-failure/src/repo /home/${USERNAME}/orbital-failure

RUN sudo apt-get update && sudo apt-get install -y cmake build-essential

WORKDIR /home/${USERNAME}/orbital-failure
RUN sudo chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/orbital-failure
USER $USERNAME
RUN git config --global --add safe.directory /home/${USERNAME}/orbital-failure && git switch main
