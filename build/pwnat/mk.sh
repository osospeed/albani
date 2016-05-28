make
find ./* | grep -v -P '(mk.sh|pwnat$)' | xargs -Ixxx rm -rf xxx
