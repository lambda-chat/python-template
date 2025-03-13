#!/bin/bash -eux

# Install python packages
poetry config virtualenvs.create true
poetry config virtualenvs.in-project true
poetry install
poetry self add poetry-plugin-shell

# [Optional] Install starship prompt 
curl -fsSL https://starship.rs/install.sh -o starship_install.sh
echo $PASSWORD | sudo --stdin sh starship_install.sh -y
rm starship_install.sh
mkdir -p ~/.config/fish
echo "starship init fish | source" >> ~/.config/fish/config.fish
cp .devcontainer/assets/starship.toml ~/.config/starship.toml
fish -c "set -U fish_greeting"
