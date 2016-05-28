#!/usr/bin/env bash
python setup.py install
cp /usr/local/lib/python2.7/dist-packages/amoco-*.egg ./amoco-py2.7.egg
find ./* | grep -v 'mk.sh' | grep -v 'egg' | xargs -I xxx rm -rf xxx
rm -rf ./amoco.egg-info
