apt-get update
apt-get install build-essential git pkg-config zlib1g-dev libglib2.0-dev libpixman-1-dev libfdt-dev
git submodule update --init --recursive
cd libs/qemu
PYTHON=$(which python2) ./configure --target-list=x86_64-linux-user --disable-sparse --disable-strip --disable-werror --disable-sdl --disable-gtk --disable-virtfs --disable-vnc --disable-cocoa --disable-xen --disable-xen-pci-passthrough --disable-brlapi --disable-vnc-tls --disable-vnc-sasl --disable-vnc-jpeg --disable-vnc-png --disable-vnc-ws --disable-curses --disable-curl --disable-fdt --disable-bluez --disable-slirp --disable-kvm --disable-rdma --disable-system --disable-guest-base --disable-pie --disable-uuid --disable-vde --disable-netmap --disable-linux-aio --disable-cap-ng --disable-attr --disable-blobs --disable-docs --disable-vhost-net --disable-spice --disable-libiscsi --disable-libnfs --disable-smartcard-nss --disable-libusb --disable-usb-redir --disable-guest-agent --disable-seccomp --disable-coroutine-pool --disable-glusterfs --disable-libssh2 --disable-vhdx --disable-quorum --disable-bsd-user
patch -p1 < ../../patches/qemu.noprologet.patch
make -j32
patch -p1 < ../../patches/qemu.patch
cd ..

cd z3
python2 scripts/mk_make.py
cd build
make -j32
cd ../..

wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-2.13-65163-gcc.4.4.7-linux.tar.gz
tar xvzf pin-2.13-65163-gcc.4.4.7-linux.tar.gz
cp -r pin-2.13-65163-gcc.4.4.7-linux/extras/xed2-i* .
rm -rf pin-2.13-65163-gcc.4.4.7-linux*

sed -i 's/main/ma1n/g' qemu/x86_64-linux-user/linux-user/main.o
sed -i 's/use_icount/use_1count/g' qemu/stubs/cpu-get-icount.o

cd ..
make -j32
