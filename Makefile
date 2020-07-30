include Makefile.inc
SUBDIRS = python

.PHONY: all subdirs $(SUBDIRS)

all: syllablizer.a g2p.a ml2ipa.a python
g2p.a: wordfilter.a syllable.a IPAmap.a schwa.a tta_nta.a reph.a rephexp.a removeWordBoundary.a
syllablizer.a: wordfilter.a syllable.a removeWordBoundary.a
ml2ipa.a: g2p.a tagfilter.a
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt

test: g2p.a python
	python3 test/syllablizer-test.py
	python3 test/g2p-test.py
