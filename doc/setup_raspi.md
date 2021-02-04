## How to setup Raspberry Pi for Ninja qPCR safely

## Initial setup

- Download and install [Raspberry Pi Imager](https://www.raspberrypi.org/software/) to computer if it doesn't have yet.
- Stick SD card to computer.
- Choose "RASPBERRY PI OS LITE (32-BIT)" and SD card on Raspi Imager and Install.
- Move SD card from computer to Raspi.
- Connect monitor and keyboard to Raspi.
- Power on Raspi.
- Login with default ID and password ("pi" and "raspberry")

## Keyboard setup (If need to change from US)

- `sudo raspi-config`
- **5 Localisation Options**/**L3 Keyboard**/**Generic 105-key PC (intl.)**/**Other**/**Japanese**/**Japanese - Japanese (OADG 109A)**/**The default...**/**No compose key**

## WiFi setup

- `sudo raspi-config`
- **1 System Options**/**S1 Wireless LAN**/**JP Japan**(for example)/Input SSID and password/**Finish** and reboot
- You can check settings by `cat /etc/wpa_supplicant/wpa_supplicant.conf`
- You can check MAC address and provided IP by `ifconfig`

## SSH setup

- `sudo raspi-config`
- **3 Interface Options**/**P2 SSH**/**Enable**
- `ssh pi@(Raspi IP)` from computer in same wifi network with default ID and password ("pi" and "raspberry")
- `mkdir ~/.ssh; chmod 700 ~/.ssh`
- `vi ~/.ssh/authorized_keys`
- `chmod 600 ~/.ssh/authorized_keys` then put your public keys
- `exit`
- `ssh -i (private key) pi@(Raspi IP)` to confirm your key is working
- `sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.org`
- `sudo vi /etc/ssh/sshd_config`
  - PermitRootLogin no
  - PasswordAuthentication no
- `sudo /etc/init.d/ssh restart`
- `exit`
- `ssh -i (private key) pi@(Raspi IP)`

## DIY model setup by git clone (Skip here if dev or prod model)

- 

## Dev and Prod model setup with AWS GreenGrass (Skip here if DIY model)

- 

