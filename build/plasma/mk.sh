apt-get install -y python3-pip
pip3 install future
./requirements.sh
python3 setup.py build_ext --inplace
python3 setup.py install --record=out.txt
mkdir out
cat ./out.txt | xargs -Ivvv cp --parents vvv ./out
rm -rf ./out.txt
find ./* | grep -v -P '(mk.sh|\bout\b)' | xargs -Ixxx rm -rf xxx
