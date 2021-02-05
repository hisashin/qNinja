#
# https://docs.aws.amazon.com/greengrass/latest/developerguide/setup-filter.rpi.html
#
sudo apt -y update
sudo apt -y install openjdk-8-jdk
sudo adduser --system ggc_user
sudo addgroup --system ggc_group
sudo cp /etc/sysctl.d/98-rpi.conf /etc/sysctl.d/98-rpi.conf~
sudo chmod 774 /etc/sysctl.d/98-rpi.conf
echo -e "fs.protected_hardlinks = 1\nfs.protected_symlinks = 1" | sudo tee -a /etc/sysctl.d/98-rpi.conf
sudo chmod 744 /etc/sysctl.d/98-rpi.conf
# sudo sysctl -a 2> /dev/null | grep fs.protected
sudo cp /boot/cmdline.txt /boot/cmdline.txt~
sudo sed -i '$ s/$/ cgroup_enable=memory cgroup_memory=1/' /boot/cmdline.txt
curl -s https://d2s8p88vqu9w66.cloudfront.net/releases/greengrass-nucleus-latest.zip > greengrass-nucleus-latest.zip
unzip greengrass-nucleus-latest.zip -d GreengrassCore && rm greengrass-nucleus-latest.zip

exit 0
