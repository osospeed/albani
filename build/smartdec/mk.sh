apt-get install -y qt4-default libboost-all-dev
make
mkdir ./out
mv ./examples ./build/smartdec/smartdec ./build/nocode/nocode ./out
find ./* | grep -v -P '(mk.sh|./out)' | xargs -Ixxx rm -rf xxx
mv ./out/* ./
rm -rf ./out
