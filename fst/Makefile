include ../Makefile.inc

all: syllablizer.a analysis.a ml2ipa.a
analysis.a: wordfilter.a normalize.a syllable.a IPAmap.a inherentvowel.a tta_nta.a reph.a rephexp.a alveolarnasal.a labiodentalfricative.a schwa.a removeWordBoundary.a
syllablizer.a: wordfilter.a normalize.a syllable.a removeWordBoundary.a
ml2ipa.a: analysis.a tagfilter.a

.PHONY: all 

