FROM git-trainer:base-task-image

ARG USERNAME=student
ARG GIT_USERNAME=student
ARG GIT_EMAIL=student@alivetech.com
ENV DESCRIPTION="Проект сломался при последнем коммите. Найдите новую функцию в истории (№4) и cout, относящийся к ней, вернитесь в стабильное состояние (№3), создайте ветку, добавьте недостающую функцию и cout, относящийся к ней (аргументы любой функции в этой задаче должны быть 4,5). Сделайте коммит и введите git-trainer submit. Сливать ветку с main пока НЕ нужно!"

RUN echo -n $DESCRIPTION > /etc/git-trainer/description
COPY ./tasks/fix-the-past/src/repo /home/${USERNAME}/fix-the-past

WORKDIR /home/${USERNAME}/fix-the-past
RUN sudo chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/fix-the-past
USER $USERNAME
RUN git config --global --add safe.directory /home/${USERNAME}/fix-the-past && git switch main



