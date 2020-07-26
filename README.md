## K2EXE RPI config

I created these to improve uppon some of the other raspberry pi installer scripts for ham radio.  By using ansible we can create and describe desired states.  The following tools are installed in a base installation.

*Direwolf
*Flamp
*Flarq
*Fldigi
*Flmsg
*Flrig
*Flwrap
*JS8call
*Pat(winlink)
*WSJT-X
*Xastir

## Install

# Open a terminal or ssh connection to your newly installed Raspberry Pi

When installing on a new pi I always remember to create an empty file called ssh to enable remote ssh login. Don't forget to change your password upon your first login to the pi.

```bash
curl -o- https://raw.githubusercontent.com/k2exe/k2exe-rpi-config/master/install.sh | bash 
```

The installer script will install git and ansible which are both required for installation and updating of software on the pi.

### Requirements

I prefer to install on Raspberry Pi 4's with 4 GB of RAM.  If you are using a different model of Pi or less RAM you will need to add a swap file in order to compile some of the software in this tool. I will leave that exercise to the end user but I may integrate a check and helper tool in the future if there is interest.  

Once installed cd into the directory where k2exe-rpi-config was installed/home/pi/k2exe-rpi-config if you used the installer script.

You may then issue the following command to install the default setup:

```bash
ansible-playbook playbook.yml
```

If you want to install or update only 1 specific package you can use ansible tags to limit the scope of the run.  Disclaimer a full run will take several hours to compile all of the software  available.

```bash
ansible-playbook playbook.yml --tags fldigi
```
