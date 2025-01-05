### Overview
Shell Script program to automate the processes of symlinking the actions to execute an automatic full system update on every boot.

> [!NOTE]  
> This is only a pseudo-generic shell script, so bugs and malfunctioning are prone to happen depending on the environment and its configuration. Some debuging and extra configuration may be necessary.

### How does it work
Upon execution, the script triggers the appearance of a new terminal window, automating the system update process. 
This occurs immediately after the user logs in, when the graphical interface initializes, and a stable internet connection is established.

The script's initialization is managed by the systemd services. The enabled _**update.service**_ is configured 
to execute the appropriate update command based on the Linux distribution in use (if available).

### Usage
To install the script and enable the service, run the following command:

```console
bash install.sh
```

The script will automatically gather the necessary environment variables, and 
if it cannot determine the system terminal, it will prompt the user to input a preferred one.

After gathering environment variables, you will be asked if the system update should proceed without security questions. Upon completion, the script sets the required variables in the _**update.service**_ file, configures the service, and creates a symlink with the graphical target. After rebooting, the script should work as intended.

> [!IMPORTANT]  
> For the script to work, you must have installed first, _lsb\_release_ and _jq_.

### Uninstalling
To remove the script and its associated components, run the uninstallation script with the following command:

```console
bash uninstall.sh
```

The uninstallation script will automatically remove all related files and scripts previously created in the system. Additionally, it will disable the service along with its symlink. Once the uninstallation process is complete, the system will no longer perform automatic updates.

> [!TIP]
> For any reason if a re-installation is needed, running the uninstall script and re-running the install script, should be enough.

### Notes
The program will not work for all distributions or terminals, as it depends on static data.
The script is designed for a more generic approach, covering only so many popular distributions and terminals.

All the available distros can be found in:
 - [./environment/distro/distroAutoUpdate.sh](https://github.com/rafaeltxc/Update-Check/blob/main/environment/distro/distroAutoUpdate.sh) (for distros with skipping command).
 - [./environment/distro/distroNormalUpdate.sh](https://github.com/rafaeltxc/Update-Check/blob/main/environment/distro/distroNormalUpdate.sh) (for distros without skipping command).

And the terminals in:
 - [./terminal.sh](https://github.com/rafaeltxc/linux-update-service/blob/main/environment/terminal.sh)

You may edit these files to add your prefered distribution or terminal, so the script could work as fine.
