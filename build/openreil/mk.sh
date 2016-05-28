sudo apt-get update
sudo apt-get install git gcc make python python-dev python-numpy cython
./autogen.sh
./configure
make

rm -rf ./capstone/capstone
find ./pyopenreil | xargs -I xxx touch xxx
