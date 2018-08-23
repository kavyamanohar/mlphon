include Makefile.inc

all: syllablizer.a phoneanalyser.a
#IPAGenerator.a: inputfilter.a phoneticmap.a lettertag.a phoneticreplace.a inherentvoweladd.a removetags.a PhoneAnalyser.a
phonenalyser.a: wordfilter.a syllable.a phoneticmap.a inherentvoweladd.a
syllablizer.a: wordfilter.a syllable.a
clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt

test: phoneanalyser.a
	python3 test/phoneanalyser-test.py
