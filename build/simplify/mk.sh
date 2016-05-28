add-apt-repository ppa:webupd8team/java
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get install -y oracle-java8-installer oracle-java8-set-default maven2
git submodule update --init --recursive
./gradlew fatjar
mv ./simplify/build/libs/*.jar ./
find ./* | grep -v -P '(mk.sh|jar)' | xargs -Ixxx rm -rf xxx
