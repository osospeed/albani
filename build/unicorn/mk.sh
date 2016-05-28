sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
apt-get install libglib2.0-dev
#UNICORN_ARCHS="aarch64" ./make.sh
./make.sh
find ./bindings/* | xargs -Ixxx touch xxx
touch -h libunicorn.*
rm -rf ./qemu ./*.d ./*.o ./*.log
