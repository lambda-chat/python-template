#!/bin/bash -x

# install python packages
pip3 install poetry
poetry config virtualenvs.create false
poetry install --no-root

# change default shell to fish
echo "password" | chsh -s $(which fish)
