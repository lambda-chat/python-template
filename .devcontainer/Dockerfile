FROM python:3.10-bullseye

# Install sudo, fish, vim
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | tee -a /etc/apt/sources.list && \
    wget -q -O - https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | apt-key add - && \
    apt-get update && \
    apt-get install -y sudo fish vim && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a user (in docker group and sudoers)
ARG USER=docker-user
ARG GROUP=docker
ARG GID=1000
ARG UID=1000
RUN groupadd --gid ${GID} ${GROUP} && \
    useradd --uid ${UID} --gid ${GID} --create-home ${USER} && \
    adduser ${USER} sudo && \
    echo "${USER}:password" | chpasswd
USER ${USER}

# Config
ENV HOME=/home/${USER}
ENV PATH=${HOME}/.local/bin:${PATH}
ARG PATH_TO_BIN=${HOME}/.local/bin
RUN echo "PATH=${PATH_TO_BIN}:\${PATH}" >> ${HOME}/.bash_profile && \
    mkdir -p ${HOME}/.config/fish && echo "set fish_user_paths ${PATH_TO_BIN} \$fish_user_paths" >> ${HOME}/.config/fish/config.fish

ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 100; done"]
