#!/usr/bin/env bash
homePath=`pwd`
url="http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz"

if [[ $1 == 'ver' ]]; then
	date -d "$(curl --head $url 2>/dev/null | grep 'Last' | cut -d':' -f2-)" "+%Y%m%d"
	exit
else
  apt-get install bison
  
  wget $url
  tar xvf afl-latest.tgz; rm -rf ./afl-latest.tgz
  cd afl-*
  make
  cd qemu_mode; nice -n -20 ./build_qemu_support.sh; cd ..
  mkdir ${homePath}/afl-latest
  PREFIX=${homePath}/afl_latest make install
  rm -rf ${homePath}/afl-*
  mv ${homePath}/afl_latest ${homePath}/afl-latest
fi
