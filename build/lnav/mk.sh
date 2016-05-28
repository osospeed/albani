apt-get install libpcre++-dev sqlite ncurses-base zlibc libbz2-dev libgpm-dev
./autogen.sh
./configure
make
mkdir /tmp/build
cp mk.sh src/lnav /tmp/build
rm -rf ./*
cp /tmp/build/* ./
