#
# https://docs.aws.amazon.com/greengrass/latest/developerguide/setup-filter.rpi.html
#
sudo apt -y update
sudo apt -y install openjdk-8-jdk
sudo adduser --system ggc_user
sudo addgroup --system ggc_group
usermod -aG sudo ggc_user
sudo cp /etc/sysctl.d/98-rpi.conf /etc/sysctl.d/98-rpi.conf~
sudo chmod 774 /etc/sysctl.d/98-rpi.conf
echo "fs.protected_hardlinks = 1\nfs.protected_symlinks = 1" | sudo tee -a /etc/sysctl.d/98-rpi.conf
sudo chmod 744 /etc/sysctl.d/98-rpi.conf
# sudo sysctl -a 2> /dev/null | grep fs.protected
sudo cp /boot/cmdline.txt /boot/cmdline.txt~
sudo sed -i '$ s/$/ cgroup_enable=memory cgroup_memory=1/' /boot/cmdline.txt

exit 0
