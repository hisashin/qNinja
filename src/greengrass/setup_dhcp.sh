#
# STILL EXIT WITH EXIT-CODE. Maybe because wlan0 is used as dhcp client. https://zoe6120.com/2019/07/13/1016/
# Reference https://zoe6120.com/2019/07/13/1016/
#
sudo apt -y install isc-dhcp-server
sudo cp -p /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.orig
sudo sed -i 's/INTERFACESv4=""/INTERFACESv4="wlan0"/' /etc/default/isc-dhcp-server
sudo cp -p /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.orig
sudo sed -i -e "s/^option domain-name/#option domain-name/" -e "s/^#authoritative/authoritative/" /etc/dhcp/dhcpd.conf
sudo echo "
subnet 192.168.12.0 netmask 255.255.255.0 {
  range 192.168.12.3 192.168.12.99;
  option routers 192.168.12.1;
  option domain-name-servers 192.168.12.1, 192.168.12.2;
  ignore declines;
}
" >> /etc/dhcp/dhcpd.conf
