#!/usr/bin/env bash
homePath=`pwd`
url="http://sourceforge.net/projects/reveng/files/latest/download"

if [[ $1 == 'ver' ]]; then
	date -d "$(curl -L --head $url 2>/dev/null | grep 'Last' | cut -d':' -f2-)" "+%Y%m%d"
	exit
else
  wget -O ./down.zip $url
  unzip ./down.zip; rm -rf ./down.zip
  cd reveng-*
  sed -i -e "s/^#define BMP_BIT.*/#define BMP_BIT 64/" config.h
  sed -i -e "s/^#define BMP_SUB.*/#define BMP_SUB 32/" config.h
  make -j $(nproc)
  mv ./reveng $homePath
  rm -rf ./reveng-*
fi
