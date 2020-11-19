include Makefile.inc
SUBDIRS = python fst

.PHONY: all subdirs $(SUBDIRS)

all: syllablizer.a analysis.a ml2ipa.a python

analysis.a: fst
syllablizer.a: fst
ml2ipa.a: fst
subdirs: $(SUBDIRS)


$(SUBDIRS):
	$(MAKE) -C $@

clean: 
	# -rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt
	-rm -f fst/*.a 

test: analysis.a python
	python3 test/syllablizer-test.py
	python3 test/g2p-test.py
	python3 test/p2g-test.py	