include ../Makefile.inc

all: syllablizer.a g2p.a ml2ipa.a
g2p.a: wordfilter.a syllable.a IPAmap.a inherentvowel.a tta_nta.a reph.a rephexp.a schwa.a removeWordBoundary.a
syllablizer.a: wordfilter.a syllable.a removeWordBoundary.a
ml2ipa.a: g2p.a tagfilter.a

.PHONY: all 

