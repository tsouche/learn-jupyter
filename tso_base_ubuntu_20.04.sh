#!/bin/bash

echo "======================================================================="
echo "|  Initial configuration of the VM (tso_base_ubuntu_20.04.sh)         |"
echo "======================================================================="
echo "..."


# refresh the packages

echo "======================================================================="
echo "Refresh all packages lists"
echo "======================================================================="
echo "..."

apt-get update
#apt-get upgrade -y

echo "..."
echo "done"
echo "..."

# create the use 'tuto' with 'tutorial' as password, and grant him sudo 
# privilege

echo "======================================================================="
echo "Create user 'tuto'"
echo "======================================================================="
echo "..."

echo "install open SSL"
apt-get install -y libssl-dev
# use open SSL to create the password hash which will be fed into useradd
PWD_HASH=$(echo 'tutorial' | openssl passwd -1 -stdin)
useradd --home /home/tuto/ --create-home --shell /bin/bash \
	--password $PWD_HASH tuto
# useradd --home /home/tuto/ --create-home --shell /bin/bash --password $1$DCAWy5p7$NuOQUajtuxa5yQqHQa6iU.  tuto
usermod -aG sudo tuto

echo "..."
echo "done"
echo "..."

# install docker and run it as a service

echo "======================================================================="
echo "Install docker"
echo "======================================================================="
echo "..."

apt-get update
apt-get install -y docker.io
systemctl enable docker && systemctl start docker

groupadd docker
usermod -aG docker tuto

echo "..."
echo "done"
echo "..."

# switch to user 'tuto' (pwd='tutorial') with sudo privilege
su tuto

echo "======================================================================="
echo " The END (tso_base_ubuntu_20.04.sh)"
echo "======================================================================="
