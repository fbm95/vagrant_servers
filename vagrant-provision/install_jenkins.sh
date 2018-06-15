wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

sudo apt-get update -y
sudo apt-get install jenkins -y

sudo cp /vagrant/vagrant-provision/jenkins /etc/default/jenkins

sudo systemctl start jenkins
sudo systemctl status jenkins

sudo ufw allow 8080
sudo ufw allow 50000
