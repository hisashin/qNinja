if [ $# -ne 2 ]; then
  echo "Usage : sh setup_dir.sh (source dir) (data dir)"
  exit 1
fi
dir_src=$1
dir_data=$2
user=`whoami`
if [ -s $dir_src ]; then
  echo "$dir_src already exists"
  exit 1
fi
if [ -s $dir_data ]; then
  echo "$dir_data already exists"
  exit 1
fi

echo "Creating source dir $dir_src as $user"
sudo mkdir -p $dir_src
sudo chown $user.$user $dir_src
sudo echo "export NINJAQPCR_SRC=$dir_src" >> /etc/profile

echo "Creating data dir $dir_data as $user"
sudo mkdir -p $dir_data
sudo chown $user.$user $dir_data
sudo echo "export NINJAQPCR_DATA=$dir_data" >> /etc/profile

#sudo mkdir /usr/local/ninjaqpcr
#sudo chown pi /usr/local/ninjaqpcr
#mkdir ~/ninjaqpcr
