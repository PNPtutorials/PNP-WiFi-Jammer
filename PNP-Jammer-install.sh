#!/bin/bash
sudo apt-get update
sudo apt-get autoremove libnl-3-dev
echo "**************** Installing libpcap-dev libnl-dev python-dev gcc g++ make *******************"
sudo apt-get install libnl1 libnl-dev libpcap-dev python-dev gcc g++ make git subversion libssl-dev libpcap-dev libpcre3-dev libsqlite3-dev pkg-config python-dev
echo "********************choosing machine architecture******************"

#arch=$(uname -m)
#arch1=$(uname -n)

#if ["$arch" == 'x86_64' ] 
#then
	#sudo wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl1_1.1-7+deb7u1_amd64.deb
	#sudo dpkg -i libnl1_1.1-7+deb7u1_amd64.deb	
	#wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl-dev_1.1-7+deb7u1_amd64.deb
	#sudo dpkg -i libnl-dev_1.1-7+deb7u1_amd64.deb
	#sudo rm libnl1_1.1-7+deb7u1_amd64.deb
	#sudo rm libnl-dev_1.1-7+deb7u1_amd64.deb
#elif ["$arch" == 'i686' ] 
#then
	#sudo wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl1_1.1-7+deb7u1_i386.deb
	#sudo dpkg -i libnl1_1.1-7+deb7u1_i386.deb	
	#sudo wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl-dev_1.1-7+deb7u1_i386.deb
	#sudo dpkg -i libnl-dev_1.1-7+deb7u1_i386.deb
	#sudo rm libnl1_1.1-7+deb7u1_i386.deb
	#sudo rm libnl-dev_1.1-7+deb7u1_i386.deb
#elif ["$arch1" == 'raspberrypi3' ] 
#then
	#sudo wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl1_1.1-7+deb7u1_armhf.deb
	#sudo dpkg -i libnl1_1.1-7+deb7u1_armhf.deb
	#sudo wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl-dev_1.1-7+deb7u1_armhf.deb 
	#sudo dpkg -i  libnl-dev_1.1-7+deb7u1_armhf.deb
	#sudo rm libnl1_1.1-7+deb7u1_armhf.deb
	#sudo rm libnl-dev_1.1-7+deb7u1_armhf.deb
#else
	#echo "System architecture not found."
#fi

sudo apt-get update
#wget https://drive.google.com/uc?export=download&id=0ByKtlN4NOMLeSXoxTjU4Q3Fiems
#cp liborcon2-2.0.0.so /usr/local/lib/liborcon2-2.0.0.so
#sudo ln -s /usr/local/lib/liborcon2-2.0.0.so /usr/lib
#echo "***************Cloning https://github.com/PNPtutorials/lorcon-old.git ***********************"
#git clone https://github.com/PNPtutorials/lorcon-old.git #install lorcon-old
#cd lorcon-old
#echo "*************** Configuring lorcon-old ***********************"
#./configure --libdir=/usr/lib
#make
#make install
#svn co http://pylorcon2.googlecode.com/svn/trunk pylorcon2
echo "***************Cloning git clone https://github.com/lunixbochs/lorcon.git ***********************"
sudo git clone https://github.com/PNPtutorials/lorcon-1.git
#(original creator)git clone https://github.com/lunixbochs/lorcon.git
sudo mv "lorcon-1" "lorcon"
cd lorcon && sudo ./configure &&sudo make && sudo make install
cd pylorcon2
echo "*************** Setting up pylorcon2 ***********************"
sudo python setup.py build
sudo python setup.py install
#svn co http://svn.aircrack-ng.org/trunk/scripts/airdrop-ng #via aircrack-ng
echo "*************** Cloning aircrack-ng ***********************"
cd ~
sudo git clone https://github.com/PNPtutorials/aircrack-ng.git
sudo ln -s /usr/local/lib/liborcon2-2.0.0.so /usr/lib
cd ~/aircrack-ng/scripts/airdrop-ng/old-installers
sudo mv "install.py" "install-1.py"
#pip install urllib
sudo wget "https://drive.google.com/uc?export=download&id=0ByKtlN4NOMLednZVUWJObnVkdEk"
sudo mv "uc?export=download&id=0ByKtlN4NOMLednZVUWJObnVkdEk" "install.py"
echo "*************** Setting up airdrop-ng ***********************"
sudo python install.py #replace install file link expired
cd ~/aircrack-ng/scripts/airdrop-ng/
sudo python setup.py install



