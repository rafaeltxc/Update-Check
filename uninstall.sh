#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

trap 'echo "Installation stoped"; exit 1' INT

# Remove configuration files
sudo rm -rf /etc/updatecheck >> /dev/null 2>&1
sudo rm /etc/systemd/system/update.service >> /dev/null 2>&1
systemctl daemon-reload
sudo rm /etc/sudoers.d/updatecheck >> /dev/null 2>&1

# Remove environment variables
declare env_variables=("PKG_MG" "UPDATE_CMD" "DF_TERMINAL")

for var in "${env_variables[@]}"; do
  sudo sed -i "s/^$var=//g" /etc/environment
done

echo "Updatecheck successfully uninstalled"
exit 0
