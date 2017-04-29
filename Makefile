include Makefile.inc

all: IPAGenerator.a
IPAGenerator.a: inputfilter.a phoneticmap.a phoneticreplace.a inherentvoweladd.a removetags.a PhoneAnalyser.a

clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt

test: PhoneAnalyser.a
	python3 test/mlg2p-test.py
