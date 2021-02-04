## How to setup Raspberry Pi for Ninja qPCR safely

## Initial setup

- Download and install [Raspberry Pi Imager](https://www.raspberrypi.org/software/) to computer if it doesn't have yet.
- Stick SD card to computer.
- Choose "RASPBERRY PI OS LITE (32-BIT)" and SD card on Raspi Imager and Install.
- Move SD card from computer to Raspi.
- Connect monitor and keyboard to Raspi.
- Power on Raspi.
- Login with default ID and password ("pi" and "raspberry")
- `sudo apt -y update; sudo apt-get -y update`

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
- `sudo vi /etc/ssh/sshd_config` then activate these lines
  - PermitRootLogin no
  - PasswordAuthentication no
- `sudo /etc/init.d/ssh restart`
- `exit`
- `ssh -i (private key) pi@(Raspi IP)`

## DIY model setup by git clone (Skip here if dev or prod model)

- `curl -OL https://github.com/hisashin/Ninja-qPCR/archive/master.zip`
- `unzip master.zip; cd Ninja-qPCR-master`
- //TODO boot setup

## Dev and Prod model setup with AWS GreenGrass (Skip here if DIY model)

[Setting up a Raspberry Pi](https://docs.aws.amazon.com/greengrass/latest/developerguide/setup-filter.rpi.html)

- `curl -OL https://raw.githubusercontent.com/hisashin/Ninja-qPCR/master/src/greengrass/setup1.sh`
-　`sh setup1.sh`
-　`sudo reboot`

[Configure AWS IoT Greengrass on AWS IoT](https://docs.aws.amazon.com/greengrass/v1/developerguide/gg-config.html)

- [Create thing](https://ap-northeast-1.console.aws.amazon.com/iot/home?region=ap-northeast-1#/greengrass/v2/cores/create)
  - example name of core device : qpcr-dev-001
  - example name of group : qpcr-dev
- Publish **temporary** security credentials using AWS STS trust relationship
  - `aws sts assume-role --role-arn arn:aws:iam::123456789:role/(role-name) --role-session-name "qpcr-dev-temp" --profile (proper IAM) > assume-role-output.txt` on computer
    my case `aws sts assume-role --role-arn arn:aws:iam::314407188943:role/greengrass --role-session-name qpcr-dev-001 --duration-seconds 3600 --profile gg_publisher > assume-role-output.txt`
- `ssh -i (private key) pi@(Raspi IP)`
- `export AWS_ACCESS_KEY_ID=(Credentials.AccessKeyId)`
- `export AWS_SECRET_ACCESS_KEY=(Credentials.SecretAccessKey)`
- `export AWS_SESSION_TOKEN=(Credentials.SessionToken)`
- Run command shown bottom part of Create thing page
  my case `sudo -E java -Droot="/greengrass/v2" -Dlog.store=FILE -jar ./GreengrassCore/lib/Greengrass.jar --aws-region ap-northeast-1 --thing-name qpcr-dev-001 --thing-group-name qpcr-dev --component-default-user ggc_user:ggc_group --provision true --setup-system-service true --deploy-dev-tools true`
- Finish Create thing and wait a while to show up added thing qpcr-dev-001
- `sudo cp /etc/hosts /etc/hosts.orig`
- `sudo cp /etc/hostname /etc/hostname.orig`
- `sudo sed -i -e "s/raspberrypi/qpcr-dev-001/g" /etc/hosts`
- `sudo sed -i -e "s/raspberrypi/qpcr-dev-001/g" /etc/hostname` (sometimes not needed. automatically updated when /etc/hosts were changed)
- `sudo reboot`

