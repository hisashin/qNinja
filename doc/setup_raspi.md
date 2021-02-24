## How to setup Raspberry Pi for Ninja qPCR safely

## Initial setup

- Download and install [Raspberry Pi Imager](https://www.raspberrypi.org/software/) to computer if it doesn't have yet.
- Stick SD card to computer.
- Choose "RASPBERRY PI OS LITE (32-BIT)" and SD card on Raspi Imager and Install.
- Move SD card from computer to Raspi.
- Connect monitor and keyboard to Raspi.
- Power on Raspi.
- Login with default ID and password ("pi" and "raspberry")
- `sudo raspi-config`
  - Keyboard setup (If need to change from US)
    - **5 Localisation Options**/**L3 Keyboard**/**Generic 105-key PC (intl.)**/**Other**/**Japanese**/**Japanese - Japanese (OADG 109A)**/**The default...**/**No compose key**
  - WiFi setup
    - **1 System Options**/**S1 Wireless LAN**/**JP Japan**(for example)/Input SSID and password/**Finish**
  - Hostname (not required)
    - **1 System Options**/**S4 Hostname**/**ninjaqpcr**(for example)/**Finish**
  - SSH setup
    - **3 Interface Options**/**P2 SSH**/**Enable**
  - SPI setup
    - **3 Interface Options**/**P4 SPI**/**Enable**
  - I2C setup
    - **3 Interface Options**/**P5 I2C**/**Enable**
- Reboot automatically
- Login with default ID and password again ("pi" and "raspberry")
- You can confirm settings by `cat /etc/wpa_supplicant/wpa_supplicant.conf`
- You can get MAC address and provided IP by `ifconfig`
- `ssh pi@(Raspi IP)` from computer in same wifi network with default ID and password ("pi" and "raspberry")
- `mkdir ~/.ssh; chmod 700 ~/.ssh`
- `vi ~/.ssh/authorized_keys` then put your public keys
- `chmod 600 ~/.ssh/authorized_keys`
- `exit`
- `ssh -i (private key) pi@(Raspi IP)` to confirm your key is working
- `sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.org`
- `sudo vi /etc/ssh/sshd_config` then activate these lines
  - PermitRootLogin no
  - PasswordAuthentication no
- `sudo /etc/init.d/ssh restart`
- `sudo apt -y update; sudo apt-get -y update`

## DIY setup with git

Software update can be done manually by `git pull`.

- `sudo apt -y install git`
- `git config --global user.email "(your GitHub account email)"`
- `git config --global user.name "(your GitHub account)"`
- `git config --global push.default simple`
- `git config --global -l`
- `git config --global credential.helper store`
- `ssh-keygen -t rsa -C "(your GitHub account email)"` then just ENTER 3 times to make default private and public keys without password.
- Upload public key (~/.ssh/id_xxxx.pub) to GitHub as [Adding a new SSH key to your GitHub account](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
- `vi ~/.ssh/config` to write this 
  ```
  Host github
    User git
    Port 22
    HostName github.com
    IdentityFile ~/.ssh/id_xxxx
    IdentitiesOnly yes
  ```
- `chmod 600 ~/.ssh/config`
- `git clone github:hisashin/Ninja-qPCR.git`
- //TODO setup bootstrap

## PRO setup with [AWS Greengrass](https://aws.amazon.com/greengrass/)

Ninja qPCR software will be installed and updated to the latest automatically when it's added to the proper Greengrass group.

[Setting up a Raspberry Pi](https://docs.aws.amazon.com/greengrass/latest/developerguide/setup-filter.rpi.html)

- `curl -OL https://raw.githubusercontent.com/hisashin/Ninja-qPCR/master/src/greengrass/setup.sh`
- `sh setup.sh`
- `sudo reboot`

[Configure AWS IoT Greengrass on AWS IoT](https://docs.aws.amazon.com/greengrass/v1/developerguide/gg-config.html)

- Open [Create core device](https://ap-northeast-1.console.aws.amazon.com/iot/home?region=ap-northeast-1#/greengrass/v2/cores/create) on AWS Console
  - example name of core device : qpcr-dev-001
  - example name of group : qpcr-dev
- Publish **temporary** security credentials using AWS STS trust relationship
  - `aws sts assume-role --role-arn arn:aws:iam::123456789:role/(role-name) --role-session-name "qpcr-dev-temp" --profile (proper IAM) > assume-role-output.txt` on computer
    - my case `aws sts assume-role --role-arn arn:aws:iam::314407188943:role/greengrass --role-session-name qpcr-dev-001 --duration-seconds 3600 --profile gg_publisher` to sysout credentials
- `ssh -i (private key) pi@(Raspi IP)`
- `export AWS_ACCESS_KEY_ID=(Credentials.AccessKeyId)`
- `export AWS_SECRET_ACCESS_KEY=(Credentials.SecretAccessKey)`
- `export AWS_SESSION_TOKEN=(Credentials.SessionToken)`
- Run commands shown at the bottom end of **Create core device** page
  my case 
  - `curl -s https://d2s8p88vqu9w66.cloudfront.net/releases/greengrass-nucleus-latest.zip > greengrass-nucleus-latest.zip && unzip greengrass-nucleus-latest.zip -d GreengrassCore`
  - `sudo -E java -Droot="/greengrass/v2" -Dlog.store=FILE -jar ./GreengrassCore/lib/Greengrass.jar --aws-region ap-northeast-1 --thing-name qpcr-dev-001 --thing-group-name qpcr-dev --component-default-user ggc_user:ggc_group --provision true --setup-system-service true --deploy-dev-tools true`
  - `sudo tail -f /greengrass/v2/logs/greengrass.log` to check log
- Finish Create core device and wait a while to show up added thing qpcr-dev-001
- `sudo cp /etc/hosts /etc/hosts.orig`
- `sudo cp /etc/hostname /etc/hostname.orig`
- `sudo sed -i -e "s/raspberrypi/qpcr-dev-001/g" /etc/hosts`
- `sudo sed -i -e "s/raspberrypi/qpcr-dev-001/g" /etc/hostname` (sometimes not needed. automatically updated when /etc/hosts were changed)
- `sudo reboot`

