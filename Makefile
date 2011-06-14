CC=gcc
CPP=g++
CFLAGS=-Wall -O2 -DLINUX

BIN=pctx_test
PYTHON_DIR=/usr/include/python2.6

all:	$(BIN)

clean:
	@echo "Cleaning up directory."
	rm -rf *~ *.o *.so *_wrap.* pctx.py *.pyc *.pyd $(BIN) 

pctx_test: pctx_test.o pctx.o
	$(CPP) $(CFLAGS)  $^ -o $@ -lusb-1.0 

python-pctx: pctx.o pctx_wrap.o
	$(CPP) -shared $^ -o _pctx.so -lusb-1.0

# object files
pctx.o: pctx.cc
	$(CPP) -c $^ -o $@

pctx_test.o: pctx_test.cc
	$(CPP) -c $^ -o $@

pctx_wrap.o: pctx_wrap.cc
	$(CPP) -c $^ -o $@ -I$(PYTHON_DIR)

pctx_wrap.cc: pctx.i
	swig -o $@ -python -c++ $^

