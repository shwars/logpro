FROM swipl:latest
RUN apt-get update && apt-get install -y python3 python3-pip wget
RUN pip3 install --no-cache notebook

USER root
RUN python3 -m pip install --upgrade jswipl

### create user with a home directory
ARG NB_USER=buser
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# copy repo
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}
WORKDIR ${HOME}
RUN mkdir -p ${HOME}/.local/share/jupyter/kernels/jswipl && cd ${HOME}/.local/share/jupyter/kernels/jswipl && wget https://raw.githubusercontent.com/targodan/jupyter-swi-prolog/master/kernel.json

WORKDIR ${HOME}