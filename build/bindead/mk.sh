sudo add-apt-repository ppa:openjdk-r/ppa		
sudo apt-get update		
sudo apt-get install openjdk-8-jdk		
./build.sh		
find ./* | grep -v 'mk.sh' | grep -v 'bindead.jar' | xargs -I xxx rm -rf xxx
