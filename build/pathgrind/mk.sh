homePath=`pwd`
apt-get update
sudo apt-get install autoconf ia32-libs libc6-dev-i386 bzip2 autoconf make gcc python gawk gcc-multilib g++-multilib
./install.sh
find ./fuzz ./testcase ./stp/* | xargs -Ixxx touch xxx	# touch
find ./valgrind-*/build/lib/valgrind ./valgrind-*/*/bin -type f | grep -v -P '(fuzzgrind|lackey|valgrind$)' | xargs -Ixxx rm -rf xxx	# rm
rm -rf ./fuzz/*.pyc ./testcase/input/*.txt ./testcase/crash/*.txt ./valgrind-*/build/lib/pkgconfig ./valgrind*/*/{include,share}	# rm
cd valgrind*; find ./* | grep -P -v '\./build' | xargs -Ixxx rm -rf xxx
rm -rf ./
