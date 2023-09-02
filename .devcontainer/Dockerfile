FROM python:3.11-bullseye

ARG WORKSPACE_NAME=repo-name
ARG SUDO_PASSWORD=pw
ARG USERNAME=docker-user

WORKDIR /app/${WORKSPACE_NAME}

# To install github cli (gh)

# RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
#     | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
#     && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
#     | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# To install fish

# RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' \
#     | tee /etc/apt/sources.list.d/shells:fish:release:3.list \
#     && curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key \
#     | gpg --dearmor \
#     | tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

# Install fish, sudo, vim, less, git-lfs (if needed)
RUN apt-get update \
    && apt-get install -y \
    # gh \
    # fish \
    git-lfs \ 
    sudo \
    vim \
    less \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a user (in docker group and sudoers)
#   We will set a loose password so that we can use `sudo` in the container in emergency or demonstration.
#   In the usual case, we should modify this Dockerfile and rebuild it.
ARG GROUP=docker
ARG GID=1000
ARG UID=1000
RUN groupadd --gid ${GID} ${GROUP} \
    && useradd --uid ${UID} --gid ${GID} --create-home ${DOCKER_USER} \
    && adduser ${DOCKER_USER} sudo \
    && echo "${DOCKER_USER}:${SUDO_PASSWORD}" | chpasswd
USER ${DOCKER_USER}

# Config
ENV HOME=/home/${DOCKER_USER}
ENV PATH=${HOME}/.local/bin:${PATH}
ARG PATH_TO_BIN=${HOME}/.local/bin
RUN echo "PATH=${PATH_TO_BIN}:\${PATH}" >> ${HOME}/.bash_profile

# RUN mkdir -p ${HOME}/.config/fish \
#     && echo "set fish_user_paths ${PATH_TO_BIN} \$fish_user_paths" >> ${HOME}/.config/fish/config.fish

# ENV GIT_EDITOR=/usr/bin/vim

ENTRYPOINT [ "/bin/sh", "-c", "sleep infinity" ]
