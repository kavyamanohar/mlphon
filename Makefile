include Makefile.inc

all: g2p.a
g2p.a: inputfilter.a phoneticmap.a phoneticreplace.a inherentvoweladd.a removetags.a

clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt

test: g2p.a
	python3 test/mlg2p-test.py
