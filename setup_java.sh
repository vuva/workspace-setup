#install java8
sudo apt-get install software-properties-common python-software-properties -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y
sudo update-java-alternatives -s java-8-oracle
sudo apt-get install oracle-java8-set-default -y