VEX_DIR=/tmp/openreil/VEX
LIBASMIR_CXXFLAGS=-I/tmp/openreil/VEX/pub -I/tmp/openreil/src/include -g -O2
LIBASMIR_LDFLAGS=-L/tmp/openreil/VEX -L/tmp/openreil/src 
LIBASMIR_LIBS=-lasmir -lvex
CLIBS=asmir vex stdc++
