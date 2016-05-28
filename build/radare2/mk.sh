./sys/install.sh
find ./doc/* | xargs -Ixxx touch xxx	# touch
find ./* | grep -P '\.(_?[doh])' | xargs -I xxx rm -rf xxx
find ./* -name '*.so' | xargs -Ixxx mv xxx ./libr/
find ./* -empty | xargs -Ixxx rm -rf xxx	# rm empty folders
