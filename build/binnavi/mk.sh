# sudo add-apt-repository ppa:openjdk-r/ppa
# sudo apt-get update
# sudo apt-get install openjdk-8-jdk

add-apt-repository ppa:webupd8team/java
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get install oracle-java8-installer oracle-java8-set-default maven2

mvn dependency:copy-dependencies
ant build-binnavi-fat-jar

cp -a ./target/binnavi-all.jar ./
find ./prebuilt/* | xargs -Ixxx touch xxx	# touch
rm -rf ./target ./prebuilt/binnavi-all.jar
# ./gradlew clean jar

#find ./* | grep -v 'binnavi-all.jar' | grep -v 'mk.sh' | xargs -I xxx rm -rf xxx
