# sudo apt-get update
# sudo apt-get install python3-pyqt4 python3-pyqt4.qtopengl python3-opengl
# sudo apt-get upgrade python3
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python3.4
sudo apt-get install python3-setuptools
sudo easy_install3 pip
sudo pip3 install pyqtgraph numpy
sudo python3 setup.py install

find ./* | grep binglide | xargs -I xxx mv xxx ./
