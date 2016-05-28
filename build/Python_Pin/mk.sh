set -x
sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
apt-get update
apt-get install libc6-dev-i386 lynx g++-4.8-multilib build-essential
url=`lynx -dump -listonly https://software.intel.com/en-us/articles/pintool-downloads | grep -P '\-linux' | cut -d' ' -f3 | sort -nr | head -n 1`

homePath=`pwd`
mkdir /tmp/pin
cd /tmp/pin
curl -L $url | tar xvz
cd pin-*; export PIN_ROOT=`pwd`
cd $homePath
make PIN_ROOT=$PIN_ROOT TARGET=intel64
make PIN_ROOT=$PIN_ROOT TARGET=ia32
rm -rf ./obj-intel64/*.o
