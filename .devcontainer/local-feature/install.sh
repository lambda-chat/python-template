#!/usr/bin/env bash

apt-get update
apt-get install -y sudo vim git-lfs
apt-get clean
rm -rf /var/lib/apt/lists/*

# Add a non-root user `vscode` with sudo access
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

groupadd --gid $USER_GID $USERNAME
useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME
echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
chmod 0440 /etc/sudoers.d/$USERNAME
