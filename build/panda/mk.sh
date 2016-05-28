sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++

./panda_install.bash

for i in arm i386 x86_64; do
	mkdir -p /tmp/qemu/${i}-softmmu/
	mv {.,/tmp}/qemu/${i}-softmmu/qemu-system-${i}
	mv {.,/tmp}/qemu/${i}-softmmu/panda_plugins/
	mv ./qemu/${i}-softmmu/panda_plugins/ /tmp/qemu/${i}-softmmu/
	rm -rf /tmp/qemu/${i}-softmmu/panda_plugins/*.o
done

rm -rf ./qemu
mv /tmp/qemu ./
