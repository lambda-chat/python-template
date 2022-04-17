FROM python:3.9.12-bullseye

WORKDIR /workspace/WORKSPACE

# To install fish
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' \
    | tee /etc/apt/sources.list.d/shells:fish:release:3.list \
    && curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key \
    | gpg --dearmor \
    | tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
# Install fish, sudo, vim, less, git-lfs (if needed)
RUN apt-get update \
    && apt-get install -y \
    fish \
    sudo \
    vim \
    less \
    git-lfs \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a user (in docker group and sudoers)
#   We will set a loose password so that we can use `sudo` in the container in emergency.
#   In the usual case, we should modify this Dockerfile and rebuild it.
ARG PASSWORD=password
ARG USER=docker-user
ARG GROUP=docker
ARG GID=1000
ARG UID=1000
RUN groupadd --gid ${GID} ${GROUP} \
    && useradd --uid ${UID} --gid ${GID} --create-home ${USER} \
    && adduser ${USER} sudo \
    && echo "${USER}:${PASSWORD}" | chpasswd
USER ${USER}

# Config
ENV HOME=/home/${USER}
ENV PATH=${HOME}/.local/bin:${PATH}
ARG PATH_TO_BIN=${HOME}/.local/bin
RUN echo "PATH=${PATH_TO_BIN}:\${PATH}" >> ${HOME}/.bash_profile \
    && mkdir -p ${HOME}/.config/fish \
    && echo "set fish_user_paths ${PATH_TO_BIN} \$fish_user_paths" >> ${HOME}/.config/fish/config.fish
ENV GIT_EDITOR=/usr/bin/vim

ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 100; done"]
