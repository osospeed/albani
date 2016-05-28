set -x
echo "deb http://repo.kali.org/kali sana main non-free contrib" > /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6
apt-get update
sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
apt-get install libc6-dev-i386 lynx g++-4.8-multilib build-essential libboost-all-dev
source ~/.bashrc
url=`lynx -dump -listonly https://software.intel.com/en-us/articles/pintool-downloads | grep -P '\-linux' | cut -d' ' -f3 | sort -nr | head -n 1`
urlZ3="https://github.com/Z3Prover/bin/raw/master/releases/z3-4.4.0-x64-ubuntu-14.04.zip"

homePath=`pwd`

# z3
mkdir /tmp/z3; cd $_
wget $urlZ3
unzip ./z3*
rm -rf ./z3*.zip
cd ./z3*
export Z3_INCLUDE_DIR="`pwd`/include/"
export Z3_LIBRARY="`pwd`/bin/"

# pin
mkdir /tmp/pin; cd $_
curl -L $url | tar xvz
cd pin-*; export PIN_ROOT=`pwd`
cd ./source/tools/
mv $homePath ./

cd ./triton
mkdir build; cd $_
cmake -DZ3_INCLUDE_DIR=$Z3_INCLUDE_DIR -DZ3_LIBRARY=$Z3_LIBRARY -DBOOST_INCLUDEDIR=/usr/include/boost/ ..
cd ..
make -j $(nproc) PIN_ROOT=$PIN_ROOT TARGET=intel64
# make PIN_ROOT=$PIN_ROOT TARGET=ia32
rm -rf ./obj-intel64/*.o
cd ..
mv ./triton /tmp/