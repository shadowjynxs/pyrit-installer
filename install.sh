install_pyrit() {
git clone https://github.com/JPaulMora/Pyrit.git && cd Pyrit
python setup.py clean
python setup.py build
python setup.py install
}
banner="\033[0m[\033[32m+\033[0m]"
echo -e "$banner Adding source to sources.list"
echo deb http://ftp.debian.org/debian/ stretch main contrib non-free >> /etc/apt/sources.list

echo -e "$banner Updating and Upgrading"
apt-get update && apt-get upgrade -y

echo -e "\033[0m[\033[32m+\033[0m] Installing required packages"
apt-get install python2.7-dev libssl-dev zlib1g-dev libpcap-dev -y

echo -e "\033[0m[\033[32m+\033[0m] Removing pyrit and cpyrit"
apt-get remove --purge pyrit -y && rm -r /usr/local/lib/python2.7/dist-packages/cpyrit/
echo -e "$banner Installing psycopg2 and scapy"
pip install psycopg2 scapy

echo -e "$banner Installing python-scapy"
apt-get install python-scapy -y
echo -e "$banner Downloading and Installing Pyrit"
printf '\033]2;Downloading Pyrit\a'
git clone https://github.com/JPaulMora/Pyrit.git && cd Pyrit
python setup.py clean
python setup.py build
python setup.py install
echo "Installation finished"
printf '\033]2; Installation finished\a'
