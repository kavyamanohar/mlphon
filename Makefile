FSTFILESOURCE = g2p.fst
FSTCOMPILED = g2p.a
all: clean compile
default: clean compile

compile:
	fst-compiler-utf8 $(FSTFILESOURCE) $(FSTCOMPILED)

clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt
