if [ $# -ne 2 ]; then
  echo "Usage : sh setup_dir.sh (source dir) (data dir)"
  exit 1
fi
dir_src=$1
dir_data=$2
if [ -s $dir_src ]; then
  echo "$dir_src already exists"
  exit 1
fi
if [ -s $dir_data ]; then
  echo "$dir_data already exists"
  exit 1
fi

#
# https://docs.aws.amazon.com/greengrass/latest/developerguide/setup-filter.rpi.html
#
apt -y update
apt -y install openjdk-8-jdk
adduser --system ggc_user
addgroup --system ggc_group
usermod -aG sudo ggc_user
sh -c "echo 'ggc_user ALL=NOPASSWD: ALL' >> /etc/sudoers"
cp /etc/sysctl.d/98-rpi.conf /etc/sysctl.d/98-rpi.conf~
chmod 774 /etc/sysctl.d/98-rpi.conf
echo "fs.protected_hardlinks = 1\nfs.protected_symlinks = 1" | sudo tee -a /etc/sysctl.d/98-rpi.conf
chmod 744 /etc/sysctl.d/98-rpi.conf
# sysctl -a 2> /dev/null | grep fs.protected
cp /boot/cmdline.txt /boot/cmdline.txt~
sed -i '$ s/$/ cgroup_enable=memory cgroup_memory=1/' /boot/cmdline.txt

apt update
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt -y install nodejs hostapd wiringpi
apt-get -y install libcap2-bin
setcap cap_net_bind_service=+ep /usr/bin/node
npm install --global http-server

#
# STILL EXIT WITH EXIT-CODE. Maybe because wlan0 is used as dhcp client. https://zoe6120.com/2019/07/13/1016/
# Reference https://zoe6120.com/2019/07/13/1016/
#
apt -y install isc-dhcp-server
cp -p /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.orig
sed -i 's/INTERFACESv4=""/INTERFACESv4="wlan0"/' /etc/default/isc-dhcp-server
cp -p /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.orig
sed -i -e "s/^option domain-name/#option domain-name/" -e "s/^#authoritative/authoritative/" /etc/dhcp/dhcpd.conf
echo "
subnet 192.168.12.0 netmask 255.255.255.0 {
  range 192.168.12.3 192.168.12.99;
  option routers 192.168.12.1;
  option domain-name-servers 192.168.12.1, 192.168.12.2;
  ignore declines;
}
" | tee -a /etc/dhcp/dhcpd.conf

echo "Test link $dir_src"
ln -s -f ~/ $dir_src
rm -rf $dir_src
echo "export NINJAQPCR_SRC=$dir_src" | tee -a /etc/profile

echo "Create $dir_data"
mkdir -p $dir_data
echo "export NINJAQPCR_DATA=$dir_data" | tee -a /etc/profile

exit 0
