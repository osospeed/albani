git submodule update --init --recursive
make
rm -rf ./src
mv ./build/* ./; rm -rf ./build
