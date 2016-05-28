make
cp -a ./hash_extender /tmp/hash_extender_bin
cp -a ./hash_extender_test /tmp/hash_extender_test
make clean
cp -a /tmp/hash_extender_bin ./hash_extender
cp -a /tmp/hash_extender_test ./hash_extender_test
