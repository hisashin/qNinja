# Flash RPi image to SD card
* Insert SD card (>8GB) to Mac
* Install Raspberry Pi OS (32-bit) with Imager (v1.4)

# Setup (by touchscreen interface)
* Insert SD card to RasPi

## Touchscreen of Mouse
* Connect RPi's USB port and the touchscreen's "touch" port
  * Connecting both touch interface via USB hub and keyboard does not work correctly.
* Connect RPI and the touchscreen by HDMI cable
* Power on (GUI starts)
* (By touchscreen interface) Left-top menu > Preferences > Raspberry Pi Configuration > System > Boot / Auto Login > To Console Autologin
* (By touchscreen interface) Left-top menu > Logout > Shutdown

## Keyboard
* Attach a keyboard to RPi's USB port
* Waiting for X startup
* Exit X by pressing Ctrl + Alt + F1

# Setup by CLI
* Connect items
  * Power the touchscreen by 5V AC adapter (instead of RPi's USB port)
  * Attach a keyboard to RPi's USB port
* Login (user=pi, password=raspberry)
* Config `sudo raspi-config`
  * Change keyboard layout (Localisation Options > Keyboard > Generic 105-key PC (intl.) > Japanese)
    * Enable X shutdown by Ctrl+Alt+BS
  * Localisation Options > WLAN Country
    * Select your country based on physical location
  * Change User Password (System options > Password)
  * Open "System options > Hostname" and input "ninjaqpcr". This config is applied to mDNS.
  * Enable functionalities
    * Interfacing options > I2C
    * Interfacing options > SSH
  * Network config (System options > Wireless LAN)
    * Input Country (JP), SSID and password
      * or `sudo wpa_passphrase <SSID> <passphrase> | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf`
  * Enable GUI auto-login
    * System options > Boot / Auto Login : Detktop autologin
  * Disable screen sleep
    * Display Options > Screen Blanking > NO
  * Display Options > Underscan (Remove black borders)
  * Exit raspi-config
* `sudo reboot`

# Add SSH key (from PC)
* `ssh-copy-id pi@ninjaqpcr.local` (Remove a line containing "ninjaqpcr.local" from ~/.ssh/known_hosts if needed)
* Now you can login by just typing `ssh pi@ninjaqpcr.local`


# Install packages (apt & npm)
```
sudo apt update
# sudo apt install nodejs npm hostapd isc-dhcp-server wiringpi libcap2-bin
sudo apt install nodejs npm hostapd isc-dhcp-server libcap2-bin lightdm
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
mkdir ~/.config/autorun

```

# Install apps (from PC)

```
cd /Users/maripo/git/Ninja-qPCR/src
scp qpcr/user_data/protocol/* pi@ninjaqpcr.local:~/ninjaqpcr/user_data/protocol
./deploy.sh
./deploy_update.sh # Update packages
```

# Set X Startup script
```
sudo vi /etc/xdg/lxsession/LXDE-pi/autostart
```
and paste

```
@lxpanel --profile LXDE-pi
@pcmanfm --desktop --profile LXDE-pi
@xscreensaver -no-splash

```


/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://localhost:8080?kiosk=true

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

# Disable GPIO interrupts (for rpio.poll)
Add the following line to /boot/config.txt
```
dtoverlay=gpio-no-irq

```

# Display config

vi /boot/config.txt

framebuffer_width=1024
framebuffer_height=600

# Delete logs and settings
```
sudo rm -rf /var/log/*
echo "" > ~/.ssh/authorized_keys
sudo cp /usr/local/ninjaqpcr/network_conf_app/wpa_supplicant_header.txt /etc/wpa_supplicant/wpa_supplicant.conf
rm -f ~/.bash_history
```