#!/bin/bash -eux

## How To Use postCreateCommand.sh
#   (bash) $ PASSWORD=password .devcontainer/postCreateCommand.sh
#   (fish) $ env PASSWORD=password .devcontainer/postCreateCommand.sh

## Chown dist/ volume if it was mounted
# echo $PASSWORD | sudo --stdin chown -R docker-user:docker /workspace/WORKSPACE/dist/

## GPG setting
# echo $PASSWORD | sudo --stdin mkdir -p /opt/homebrew/bin
# if [ ! -e /opt/homebrew/bin/gpg ]; then
#     echo $PASSWORD | sudo --stdin ln -s /usr/bin/gpg /opt/homebrew/bin/gpg
# fi
## For fish user
# export GPG_TTY=$(tty)
# fish -c "set -Ux GPG_TTY (tty)"

## Git submodule(s) install (if they exist)
# git submodule update --init

## Install python packages
pip3 install poetry

USE_VENV=true
if [ $USE_VENV ]; then
    poetry config virtualenvs.create true
    poetry config virtualenvs.in-project true
else
    poetry config virtualenvs.create false
fi
poetry install

## Install starship prompt 
curl -fsSL https://starship.rs/install.sh -o starship_install.sh
echo $PASSWORD | sudo --stdin sh starship_install.sh -y
rm starship_install.sh
mkdir -p ~/.config/fish
echo "starship init fish | source" >> ~/.config/fish/config.fish
fish -c "set -U fish_greeting"
