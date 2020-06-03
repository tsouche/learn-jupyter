#!/bin/bash

echo "======================================================================="
echo "|  Jupyter configuration (from Ubuntu 20.04 fresh)                    |"
echo "======================================================================="
echo "..."

# to be run as root (sudo)

# refresh the packages
apt-get update
#apt-get upgrade -y
apt-get install curl
apt-get install git

# create the user 'tuto' with 'tuto' as password, with sudo privilege using
# open SSL to create the password hash which will be fed into useradd
apt-get install -y libssl-dev
PWD_HASH=$(echo 'tuto' | openssl passwd -1 -stdin)
useradd --home /home/tuto/ --create-home --shell /bin/bash \
	--password $PWD_HASH tuto
usermod -aG sudo tuto

# install docker and run it as a service
apt-get update
apt-get install -y docker.io
systemctl enable docker
systemctl start docker

groupadd docker
usermod -aG docker tuto

# install docker-compose
apt-get install docker-compose

# install docker-machine
base=https://github.com/docker/machine/releases/download/v0.16.0
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine
sudo mv /tmp/docker-machine /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine

# install jupyter
apt-get install -y python3-pip
pip install jupyterlab notebook
export PATH=$PATH+":/home/thierry/.local/bin"

# install bash kernel for jupyter
pip install bash_kernel
python3 -m bash_kernel.install

echo "======================================================================="
echo " The END"
echo "======================================================================="
