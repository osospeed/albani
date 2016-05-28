sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
set -x
homePath=`pwd`
# lVer=`curl -L http://http.kali.org/kali/dists/sana/main/binary-amd64/Packages | grep -P '/valgrind_.*\.deb' | sed -r 's/.*_([0-9]+\.[0-9]+\.[0-9]+).*/\1/gi'`
lVer='3.11.0'
mkdir /tmp/bldx/
cd /tmp/bldx/
curl http://valgrind.org/downloads/valgrind-${lVer}.tar.bz2 | tar xvj
cd ./valgrind*
./autogen.sh
./configure --prefix=`pwd`/inst
make

export CC=clang
export CXX=clang++
cp -a $homePath ./
cd taintgrind
../autogen.sh
./configure --prefix=`pwd`/../inst
make

mv /tmp/bldx/valgrind-${lVer}/taintgrind/taintgrind-* /tmp/taintgrind/
find /tmp/bldx/* | grep -P '.*so$' | xargs -Ixxx cp xxx /tmp/taintgrind/