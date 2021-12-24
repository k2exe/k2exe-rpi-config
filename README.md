## K2EXE RPI config

I created these to improve upon some of the other raspberry pi installer scripts for ham radio.  By using ansible we can create and describe desired states.  The following tools are installed in a base installation.

- Direwolf
- Flamp
- Flarq
- Fldigi
- Flmsg
- Flrig
- Flwrap
- JS8call
- Pat(winlink)
- Piardop
- RTL-SDR
- TQSL
- WSJT-X
- Xastir

The following have ansible playbooks but are not included in the default playbook.yml

- Ampr-ripd
- Docker
- Openwebrx (docker container)
- RTC-ds-1307 (real time clock module)
- Tinc (Onondaga County AMPRnet config) 

## Install

# Open a terminal or ssh connection to your newly installed Raspberry Pi

When installing on a new pi I always remember to create an empty file called ssh to enable remote ssh login. Don't forget to change your password upon your first login to the pi.

My procedure:
login via ssh
sudo raspi-config
do the following:
change password for pi user
setup hostname
expand filesystem to fill sd card
configure timezone
configure wireless region

exit installer and reboot
then log back and run the following to install this package

```bash
curl -o- -L https://git.io/JJuqZ | bash 
```

The installer script will install git and ansible which are both required for installation and updating of software on the pi.


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

If you want to install an optional playbook run the following and select the appropriate folder.
```bash
ansible-playbook rtc-ds-1307/main.yml
```
