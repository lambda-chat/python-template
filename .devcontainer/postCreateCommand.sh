#!/bin/bash -x

PASSWORD=password

# install python packages
pip3 install poetry
poetry config virtualenvs.create false
poetry install

# chown dist/ volume
echo $PASSWORD | sudo --stdin chown -R docker-user:docker /workspace/TEMP/dist/

# change default shell to fish
echo $PASSWORD | chsh -s $(which fish)

# install starship prompt 
curl -fsSL https://starship.rs/install.sh -o starship_install.sh
echo $PASSWORD | sudo --stdin sh starship_install.sh -y
rm starship_install.sh
mkdir -p ~/.config/fish
echo "starship init fish | source" >> ~/.config/fish/config.fish
fish -c "set -U fish_greeting"

unset PASSWORD
