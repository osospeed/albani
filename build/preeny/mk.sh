apt-get update
apt-get install libini-config-dev libcollection-dev
make
mkdir 64; mv ./x86_64-linux-gnu/* ./64/
make clean
apt-get install libini-config-dev:i386 libcollection-dev:i386 libc6-dev-i386
make CFLAGS=-m32
mkdir 32; mv ./x86_64-linux-gnu/* ./32/
make clean
