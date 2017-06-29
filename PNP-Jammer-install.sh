apt-get update
apt-get autoremove libnl-3-dev
echo "**************** Installing libpcap-dev libnl-dev python-dev gcc g++ make *******************"
apt-get install libpcap-dev python-dev gcc g++ make git subversion libssl-dev libpcap-dev libpcre3-dev libsqlite3-dev pkg-config python-dev
echo "********************choosing machine architecture******************"

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
	wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl1_1.1-7+deb7u1_amd64.deb
	dpkg -i libnl1_1.1-7+deb7u1_amd64.deb	
	wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl-dev_1.1-7+deb7u1_amd64.deb
	dpkg -i libnl-dev_1.1-7+deb7u1_amd64.deb
	rm libnl1_1.1-7+deb7u1_amd64.deb
	rm libnl-dev_1.1-7+deb7u1_amd64.deb
elif [ ${MACHINE_TYPE} == 'i686' ]; then
	wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl1_1.1-7+deb7u1_i386.deb
	dpkg -i libnl1_1.1-7+deb7u1_i386.deb	
	wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl-dev_1.1-7+deb7u1_i386.deb
	dpkg -i libnl-dev_1.1-7+deb7u1_i386.de
	rm libnl1_1.1-7+deb7u1_i386.deb
	rm libnl-dev_1.1-7+deb7u1_i386.de
elif [ ${MACHINE_TYPE} == 'armv71' ]; then
	wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl1_1.1-7+deb7u1_armhf.deb

	dpkg -i libnl1_1.1-7+deb7u1_armhf.deb

	wget http://security.debian.org/debian-security/pool/updates/main/libn/libnl/libnl-dev_1.1-7+deb7u1_armhf.deb 

	dpkg -i  libnl-dev_1.1-7+deb7u1_armhf.deb

	rm libnl1_1.1-7+deb7u1_armhf.deb

	rm libnl-dev_1.1-7+deb7u1_armhf.deb
else
	echo "System architecture not found."
fi

apt-get update
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
git clone https://github.com/PNPtutorials/lorcon-1.git
#(original creator)git clone https://github.com/lunixbochs/lorcon.git
mv "lorcon-1" "lorcon"
cd lorcon && ./configure &&make && sudo make install
cd pylorcon2
echo "*************** Setting up pylorcon2 ***********************"
python setup.py build
python setup.py install
#svn co http://svn.aircrack-ng.org/trunk/scripts/airdrop-ng #via aircrack-ng
echo "*************** Cloning aircrack-ng ***********************"
cd ~
git clone https://github.com/PNPtutorials/aircrack-ng.git
sudo ln -s /usr/local/lib/liborcon2-2.0.0.so /usr/lib
cd ~/aircrack-ng/scripts/airdrop-ng/old-installers
mv "install.py" "install-1.py"
#pip install urllib
wget "https://drive.google.com/uc?export=download&id=0ByKtlN4NOMLeV0JfbTU1YUo0Qmc"
mv "uc?export=download&id=0ByKtlN4NOMLeV0JfbTU1YUo0Qmc" "install.py"
echo "*************** Setting up airdrop-ng ***********************"
python install.py #replace install file link expired
cd ~/aircrack-ng/scripts/airdrop-ng/
sudo python setup.py install



