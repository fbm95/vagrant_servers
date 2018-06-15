#Update the apt package index:
echo ".............step 1"
sudo apt-get update -y

#Reconfigure dpkg to avoid unpacking errors and warnings
echo ".............step 2"
sudo ex +"%s@DPkg@//DPkg" -cwq /etc/apt/apt.conf.d/70debconf
sudo dpkg-reconfigure debconf -f noninteractive -p critical

#Install packages to allow apt to use a repository over HTTPS:
echo ".............step 3"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

#Add Docker’s official GPG key:
echo ".............step 4"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Check if the key is valid
echo ".............step 5"
sudo apt-key fingerprint 0EBFCD88

#Add docker repository to ubuntu, to be able to download docker
echo ".............step 6"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#Install Docker CE
echo ".............step 7"
sudo apt-get update -y
sudo apt-get install docker-ce -y

#Add vagrant user to docker group
echo ".............step 8"
sudo usermod -a -G docker vagrant 
