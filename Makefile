include Makefile.inc

all: syllablizer.a g2p.a ml2ipa.a
g2p.a: wordfilter.a syllable.a IPAmap.a schwa.a tta_nta.a removeWordBoundary.a
syllablizer.a: wordfilter.a syllable.a removeWordBoundary.a
ml2ipa.a: g2p.a tagfilter.a
clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt

test: g2p.a
	python3 test/syllablizer-test.py
	python3 test/g2p-test.py
