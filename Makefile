FSTFILESOURCE = g2p.fst
FSTCOMPILED = g2p.a
all: clean compile test
default: clean compile

compile:
	fst-compiler-utf8 $(FSTFILESOURCE) $(FSTCOMPILED)
test:
	fst-compiler-utf8 $(FSTFILESOURCE) $(FSTCOMPILED)
	fst-generate g2p.a
clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt
