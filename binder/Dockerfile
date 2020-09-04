FROM python:3.7-slim
RUN pip install --no-cache notebook

USER root
RUN apt-get install software-properties-common
RUN apt-add-repository ppa:swi-prolog/stable
RUN apt-get update
RUN apt-get install swi-prolog
RUN python -m pip install --upgrade jswipl

### create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

USER ${NB_USER}

WORKDIR ${HOME}
RUN mkdir ${HOME}/.local/share/jupyter/kernels
RUN cd ${HOME}/.local/share/jupyter/kernels
RUN mkdir jswipl && cd jswipl
RUN wget https://raw.githubusercontent.com/targodan/jupyter-swi-prolog/master/kernel.json

WORKDIR ${HOME}