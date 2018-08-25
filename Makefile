include Makefile.inc

all: syllablizer.a g2p.a
g2p.a: wordfilter.a syllable.a IPAmap.a schwa.a tta_nta.a removetags.a
syllablizer.a: wordfilter.a syllable.a removetags.a
clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt

test: g2p.a
	python3 test/g2p-test.py
