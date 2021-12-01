FROM python:3.10-bullseye

# for PRODUCTION (in construction)

# add files
ADD . /src/TEMP
WORKDIR /src/TEMP

# Create a user
ARG USER=docker-user
ARG GROUP=docker-group
ARG GID=1000
ARG UID=1000
RUN groupadd --gid ${GID} ${GROUP} && \
    useradd --uid ${UID} --gid ${GID} --create-home ${USER}
USER ${USER}

# Config
ENV HOME=/home/${USER}
ENV PATH=${HOME}/.local/bin:${PATH}
ARG PATH_TO_BIN=${HOME}/.local/bin
RUN echo "PATH=${PATH_TO_BIN}:\${PATH}" >> ${HOME}/.bash_profile 

# Install Python packages
RUN pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-dev

ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 100; done"]
