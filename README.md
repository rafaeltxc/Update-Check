# Linux bash script to automate system update.

### About
This project consists of a script designed to run on every boot, immediately after the kernel initialization, and once all necessary dependencies are satisfied.
The functionality is to initiate a system update process, specific to the distribution being used.

### How it works
Upon execution, the script triggers the appearance of a new terminal window, automating the system update process. 
This occurs immediately after the user logs in, when the graphical interface initializes, and a stable internet connection is established.

The script's initialization is managed by the systemd services. The enabled _**update.service**_ is configured 
to execute the appropriate update command based on the distribution in use.

### Usage
**Note:** The script only work for distributions that works around systemd.

To install the script and initiate the service, run the following command:
```console
sudo sh install.sh
```
The script will automatically gather the necessary environment variables and 
if it cannot determine the system terminal, it will prompt the user to input a preferred one.

After gathering environment variables, you will be asked if the system update should proceed without security questions.

### Caution

**It's always good to be aware of what is being updated in the system, as it can lead to unexpected results. Use at your own risk.**

Upon completion, the script sets the required variables in the _**update.service**_ file, configures the service, and creates a symlink with the graphical target. After rebooting, the script should work as intended.

### Reinstallation
If for any reason, you find the need to reinstall the script, firstly, run the uninstallation script and then, run the installation script again.

### Uninstalling
To remove the script and its associated components, run the uninstallation script with the following command:
```console
sh uninstall.sh
```
The uninstallation script will automatically eliminate all related files and scripts from the system. Additionally, it will disable the service along with its symlink. Once the uninstallation process is complete, the system will no longer perform automatic updates.

### Customization
The _**update.service**_ can be customized as much as you like, and it's possible to do, to meet your specific preferences.

For example, to make the service wait for 2 minutes before running the script:
```console
[Service]
...
ExecStartPre=/bin/sleep 120
...
```

### Notes
The program will not work for all distributions or terminals, as it depends on static data.
The script is designed for a more generic approach, covering only 20 popular distributions and terminals.

All the available distros can be found in:
 - [./environment/distro/distroAutoUpdate.sh](https://github.com/rafaeltxc/Update-Check/blob/main/environment/distro/distroAutoUpdate.sh) (for distros with skipping command).
 - [./environment/distro/distroNormalUpdate.sh](https://github.com/rafaeltxc/Update-Check/blob/main/environment/distro/distroNormalUpdate.sh) (for distros without skipping command).

And the terminals in:
 - [./terminal.sh](https://github.com/rafaeltxc/Update-Check/blob/main/terminal.sh)

You may edit these files to add your prefered distribution or terminal, so the script could work as fine.
