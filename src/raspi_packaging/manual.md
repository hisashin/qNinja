# Installation
* Insert SD card to Mac
* Install Raspberry Pi OS LITE to a SD card (>8GB) with Imager (v1.4)

# Setup
* Insert SD card to RasPi board
* Power on
* Login (user=pi, password=raspberry)
* Config `sudo raspi-config`
  * Change keyboard layout (Localisation Options > Change Keyboard Layout > Change Keyboard Layout > Generic 105-key PC (intl.) > Japanese)
  * Localisation Options > Change WLAN Country
  * Change User Password
  * Open "Network Options > Hostname" and input "ninjaqpcr". This config is applied to mDNS.
  * Enable functionalities
    * Interfacing options > I2C
    * Interfacing options > SSH
  * Network config (Wireless LAN)
    * Input Country (JP), SSID and password
      * or `sudo wpa_passphrase <SSID> <passphrase> | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf`
* Finish raspi-config and reboot (in dialog)

# Add SSH key (from PC)
* `ssh-copy-id pi@ninjaqpcr.local` (Remove a line containing "ninjaqpcr.local" from ~/.ssh/known_hosts if needed)
* Now you can login by just typing `ssh pi@ninjaqpcr.local`


# Install packages (apt & npm)
```
sudo apt update
sudo apt install nodejs npm hostapd isc-dhcp-server wiringpi libcap2-bin lightdm
sudo apt-get update --fix-missing
sudo setcap cap_net_bind_service=+ep /usr/bin/node
sudo npm install --global http-server
```

Create directories

```
sudo mkdir /usr/local/ninjaqpcr
sudo chown pi /usr/local/ninjaqpcr
mkdir -p /usr/local/ninjaqpcr/console/client/dist
mkdir ~/ninjaqpcr
mkdir ~/ninjaqpcr/user_data
mkdir ~/ninjaqpcr/user_data/protocol
mkdir ~/ninjaqpcr/user_data/experiment

```

# Install apps (from PC)

```
cd /Users/maripo/git/Ninja-qPCR/src
scp qpcr/user_data/protocol/* pi@ninjaqpcr.local:~/ninjaqpcr/user_data/protocol
./deploy.sh
./deploy_update.sh # Update packages
```

# Register startup script
* `sudo vi /etc/rc.local`
* Add `/usr/local/ninjaqpcr/startup/startup.sh` above line `exit 0`

# Define global env variables
* `sudo vi /etc/environment`
* Add lines below
```
NINJAQPCR_USER_DATA=/home/pi/ninjaqpcr/user_data
NINJAQPCR_HOME=/usr/local/ninjaqpcr
```

# Launch Chromium on GUI launch
* `mkdir ~/.config/autorun`
* `vi ~/.config/autorun/ninjaqpcr.desktop`
```
[Desktop Entry]
Name=Ninja-qPCR
Exec=/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://localhost:8080?kiosk=true
Type=Application
```

# Disable GPIO interrupts (for rpio.poll)
Add the following line to /boot/config.txt
```
dtoverlay=gpio-no-irq

```

# Delete logs and settings
```
sudo rm -rf /var/log/*
echo "" > ~/.ssh/authorized_keys
sudo cp /usr/local/ninjaqpcr/network_conf_app/wpa_supplicant_header.txt /etc/wpa_supplicant/wpa_supplicant.conf
rm -f ~/.bash_history
```