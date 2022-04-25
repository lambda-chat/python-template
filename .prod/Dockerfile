FROM python:3.9.12-bullseye

# for PRODUCTION

# Sample usage:
#     $ docker compose up -d
#     $ docker exec prod-container python -m package_name.sample
#     Hello, World!
#     $ docker compose down

# Copy files
COPY . /src/WORKSPACE
WORKDIR /src/WORKSPACE

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
RUN echo "export PATH=${PATH_TO_BIN}:\${PATH}" >> ${HOME}/.bash_profile 

# Install Python packages
RUN pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-dev
