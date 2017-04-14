include Makefile.inc

all: g2p.a

clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt

test: g2p.a
	python3 test/mlg2p-test.py
