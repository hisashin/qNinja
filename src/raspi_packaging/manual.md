# Installation
* Insert SD card to Mac
* Install Raspberry Pi OS LITE to a SD card (>8GB) with Imager (v1.4)

# Setup
* Insert SD card to RasPi
* Power on
* Login (user=pi, password=raspberry)
* Config `sudo raspi-config`
  * Change keyboard layout (Localisation Options > Change Keyboard Layout > Change Keyboard Layout > Generic 105-key PC (intl.) > Japanese)
  * Localisation Options > Change WLAN Country
  * Change User Password
  * Open "Network Options > Hostname" and input "ninjaqpcr". This config is applied to mDNS.
  * Enable functionalities
    * Interfacing options > I2C
    * Interfacing options > SPI
    * Interfacing options > SSH
  * Network config (Wireless LAN)
    * Input Country (JP), SSID and password
      * or `sudo wpa_passphrase <SSID> <passphrase> | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf`
* Finish raspi-config and reboot (in dialog)

# Add SSH key
* `ssh-copy-id pi@ninjaqpcr.local` (Remove a line containing "ninjaqpcr.local" from ~/.ssh/known_hosts if needed)

# Install packages (apt & npm)
* `ssh pi@ninjaqpcr.local`
* `sudo apt update`
* `sudo apt install nodejs npm hostapd isc-dhcp-server wiringpi`
* `sudo apt-get install libcap2-bin`
* `sudo setcap cap_net_bind_service=+ep /usr/bin/node`

* `sudo npm install --global http-server`
* `sudo mkdir /usr/local/ninjaqpcr
* `sudo chown pi /usr/local/ninjaqpcr`
* `mkdir ~/ninjaqpcr`
* `mkdir ~/ninjaqpcr/user_data`


# Install apps (From mac)

```
cd /Users/maripo/git/Ninja-qPCR/src
./deploy.sh
./deploy_update.sh # Update packages
```

# Register startup script
* `sudo vi /etc/rc.local`
* Add `/usr/local/ninjaqpcr/startup/startup.sh` above line `exit 0`

# Delete logs and settings
```
sudo rm -rf /var/log/*
echo "" > ~/.ssh/authorized_keys
sudo cp /usr/local/ninjaqpcr/network_conf_app/wpa_supplicant_header.txt /etc/wpa_supplicant/wpa_supplicant.conf
rm -f ~/.bash_history
```

# Extra (Ortanize this section in the installation flow)
Add to ~/.bashrc
```
export NINJAQPCR_USER_DATA=/home/pi/ninjaqpcr/user_data
export NINJAQPCR_HOME=/usr/local/ninjaqpcr
```

/etc/environment
NINJAQPCR_USER_DATA=/home/pi/ninjaqpcr/user_data
NINJAQPCR_HOME=/usr/local/ninjaqpcr