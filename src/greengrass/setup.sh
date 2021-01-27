if [ $# -ne 3 ]; then
  echo "Usage : sh setup.sh (AWS_ACCESS_KEY_ID) (AWS_SECRET_ACCESS_KEY) (JAVA_HOME)" 1>&2
  exit 1
fi
sudo apt -y update
sudo apt -y install openjdk-8-jdk
if [ ! -e $3 ]; then
  echo "JAVA_HOME ${3} does not exists" 1>&2
  exit 1
fi
echo "export AWS_ACCESS_KEY_ID=${1}\nexport AWS_SECRET_ACCESS_KEY=${2}\nexport JAVA_HOME=${3}" >> environment.txt

#
# https://docs.aws.amazon.com/greengrass/latest/developerguide/setup-filter.rpi.html
#
sudo adduser --system ggc_user
sudo addgroup --system ggc_group
sudo cp /etc/sysctl.d/98-rpi.conf /etc/sysctl.d/98-rpi.conf~
sudo echo -e "fs.protected_hardlinks = 1\nfs.protected_symlinks = 1" >> /etc/sysctl.d/98-rpi.conf
# sudo sysctl -a 2> /dev/null | grep fs.protected
sudo cp /boot/cmdline.txt /boot/cmdline.txt~
sudo sed -i '$ s/$/ cgroup_enable=memory cgroup_memory=1/' /boot/cmdline.txt
curl -s https://d2s8p88vqu9w66.cloudfront.net/releases/greengrass-nucleus-latest.zip > greengrass-nucleus-latest.zip
unzip greengrass-nucleus-latest.zip -d GreengrassCore && rm greengrass-nucleus-latest.zip

exit 0
