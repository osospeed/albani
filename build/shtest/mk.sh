# export CFLAGS=-m32
apt-get update
apt-get install libc6-dev-i386 
# make
gcc -m32 -Wall shtest.c -o shtest
