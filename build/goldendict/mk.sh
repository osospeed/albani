apt-get install -y pkg-config build-essential qt4-qmake libvorbis-dev zlib1g-dev libhunspell-dev x11proto-record-dev libqt4-dev libqtwebkit-dev libxtst-dev liblzo2-dev libbz2-dev libao-dev libavutil-dev libavformat-dev libtiff5-dev libeb16-dev
qmake-qt4 && make
find ./* | grep -v -P '(mk.sh|./goldendict)' | xargs -Ixxx rm -rf xxx
