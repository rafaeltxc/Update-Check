#!/bin/bash

# Script must be run as sudo user
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Handles installation cancelling.
trap 'echo "Installation stoped"; exit 1' INT

# Source environment scripts for needed variables.
declare file_dir="$(dirname "$(realpath "$BASH_SOURCE")")"

read -p "Set auto update? y/n: " setUpdate;
if [[ $setUpdate =~ ^[Yy](es)?$ || -z $setUpdate ]]; then
    source $file_dir/environment/distro/distroAutoUpdate.sh
else
    source $file_dir/environment/distro/distroNormalUpdate.sh
fi

source $file_dir/environment/system.sh

# Assert needed scripts in the system.
if [ ! -d /etc/updatecheck ]; then
    sudo mkdir /etc/updatecheck
fi
sudo cp $file_dir/config/update.sh /etc/updatecheck/
sudo cp $file_dir/environment/terminal.sh /etc/updatecheck/

# Add sudoers configuration file to handle script without the need of password.
if [ ! -f /etc/sudoers.d/updatecheck ]; then
    sudo touch /etc/sudoers.d/updatecheck
fi

if ! grep -q "^.*NOPASSWD:.*" /etc/sudoers.d/updatecheck; then
  echo "$SUDO_USER ALL=(ALL:ALL) NOPASSWD: /etc/updatecheck/update.sh, $(echo $(command -v $PKG_MG)) $UPDATE_CMD" > /etc/sudoers.d/updatecheck
fi

# Change files permissions for executation.
sudo chmod 440 /etc/sudoers.d/updatecheck

sudo chmod +x /etc/updatecheck/update.sh
sudo chmod u+s /etc/updatecheck/update.sh
sudo chown root:root /etc/updatecheck/update.sh
sudo chmod 755 /etc/updatecheck/update.sh

# Assert system service
declare env_variables=("DF_TERMINAL" "PKG_MG" "UPDATE_CMD")

sudo sed -i "s/^User=.*/User=$SUDO_USER/" $file_dir/config/update.service
for var in "${env_variables[@]}"; do
    sudo sed -i "s#^.*$var.*#Environment=\"$var=$(printf "%s\n" "${!var}")\"#" $file_dir/config/update.service
done

if [ ! -f /etc/systemd/system/update.service ]; then
    sudo cp $file_dir/config/update.service /etc/systemd/system/
fi
sudo chmod 644 /etc/systemd/system/update.service

sudo systemctl daemon-reload
sudo systemctl enable update

# Exit code
echo "Updatecheck successfully installed"
exit 0
