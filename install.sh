#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

trap 'echo "Installation stoped"; exit 1' INT

# Source environment scripts
declare file_dir="$(dirname "$(realpath "$BASH_SOURCE")")"

read -p "Set auto update? y/n: " setUpdate;
if [[ $setUpdate =~ ^[Yy](es)?$ || -z $setUpdate ]]; then
    source $file_dir/environment/distro/distroAutoUpdate.sh
else
    source $file_dir/environment/distro/distroNormalUpdate.sh
fi

source $file_dir/environment/system.sh

# Create environment variables
if [ ! -f /etc/environment ]; then
    sudo touch /etc/environment
fi

declare env_variables=("PKG_MG" "UPDATE_CMD" "DF_TERMINAL")

for var in "${env_variables[@]}"; do
    if grep -q "^$var=" /etc/environment; then
        sudo sed -i "s#^$var=.*#$var=$(printf "%s\n" "${!var}")#" /etc/environment
    else
        sudo echo "$var="${!var}"" >> /etc/environment
    fi
done

# Assert update script in the system
if [ ! -d /etc/updatecheck ]; then
    sudo mkdir /etc/updatecheck
fi
sudo cp $file_dir/update.sh /etc/updatecheck/
sudo cp $file_dir/terminal.sh /etc/updatecheck/

# Modify sudoers
if [ ! -f /etc/sudoers.d/updatecheck ]; then
    sudo touch /etc/sudoers.d/updatecheck
fi

if ! grep -q "^.*NOPASSWD:.*" /etc/sudoers.d/updatecheck; then
    echo "$SUDO_USER ALL=(ALL:ALL) NOPASSWD: /etc/updatecheck/update.sh" > /etc/sudoers.d/updatecheck
fi

sudo chmod 440 /etc/sudoers.d/updatecheck

sudo chmod +x /etc/updatecheck/update.sh
sudo chmod u+s /etc/updatecheck/update.sh
sudo chown root:root /etc/updatecheck/update.sh
sudo chmod 755 /etc/updatecheck/update.sh

# Create crontab command call
if ! sudo crontab -l | grep -qF "@reboot sleep 60; /etc/updatecheck/update.sh"; then
    (sudo crontab -l 2>/dev/null; echo "@reboot sleep 60; /etc/updatecheck/update.sh") | sudo crontab -
fi

echo "Updatecheck successfully installed"
exit 0
