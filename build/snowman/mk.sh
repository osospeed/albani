apt-get -y install libboost-dev cmake libqt4-dev
INST_DIR=$PWD
mkdir build; cd build
cmake -D CMAKE_INSTALL_PREFIX=$INST_DIR ../src
cmake --build .
cmake --build . --target install
mkdir ./out
mv ./build/snowman/snowman ./build/nocode/nocode ./out
find ./* | grep -v -P '(mk.sh|./out)' | xargs -Ixxx rm -rf xxx
mv ./out/* ./bin/* ./
rm -rf ./out ./bin/
