echo "Provisioning virtual machine..."  
sudo apt-get update -y
sudo apt-get upgrade -y

sudo ex +"%s@DPkg@//DPkg" -cwq /etc/apt/apt.conf.d/70debconf
sudo dpkg-reconfigure debconf -f noninteractive -p critical

echo "Install vim..."
sudo apt-get install vim -y

echo "Install git..."
sudo apt-get install git -y > /dev/null
git --version

echo "Install java..."
apt-get install openjdk-8-jdk -y > /dev/null
java -version

echo "Install unzip..."
sudo apt-get install unzip -y > /dev/null
unzip -v

echo "Install maven..."
sudo apt-cache search maven
sudo apt-get install maven -y > /dev/null
mvn -v

echo "Install sshpass..."
sudo apt-get install sshpass -y > /dev/null
sshpass
