#CLI for generating IPA
import argparse
from sys import stderr, stdin, stdout
import os
import regex
import libhfst
from pkg_resources import resource_filename, resource_exists


def getTransducer(fsa):
    istr = libhfst.HfstInputStream(fsa)
    transducers = []
    while not (istr.is_eof()):
        transducers.append(istr.read())
    istr.close()
    return transducers[0]


class Syllablizer:

    def __init__(self):
        self.fsa = None
        resource_path = 'data/syllablizer.a'
        if resource_exists(__name__, resource_path):
            self.fsa = resource_filename(__name__, resource_path)
        if not self.fsa:
            raise ValueError('Could not read the fsa.')
        self.transducer = None
        self.analyser = None

    def getAnalyser(self):
        if not self.transducer:
            self.transducer = getTransducer(self.fsa)
        analyser = libhfst.HfstTransducer(self.transducer)
        analyser.remove_epsilons()
        analyser.lookup_optimize()
        return analyser

    def syllablize(self, token):
        """Perform a simple analysis lookup. """
        if not self.analyser:
            self.analyser = self.getAnalyser()
        analysis_results = self.analyser.lookup(token)
        return analysis_results

def main():
	a = argparse.ArgumentParser()
	a.add_argument('-i', '--input', metavar="INFILE", type=open,
					dest="infile", help="source of malayalam text to be analysed")
	a.add_argument('-o', '--output', metavar="OUTFILE", type=argparse.FileType('w+', encoding='UTF-8'),
					dest="outfile", help="target of splitted syllables")
	options = a.parse_args()
	syllablizer = Syllablizer()
	if not options.infile:
		options.infile = stdin
	if not options.outfile:
		options.outfile = stdout
	for line in options.infile:
		line = line.strip()
		if not line or line == '':
			continue
		syllables = syllablizer.syllablize(line)
		if not syllables:
			options.outfile.write(line+"\t"+"?"+"\n")
		for syl in syllables:
			options.outfile.write(line+"\t"+syl[0]+"\n")
			syls = regex.findall('<BoS>([‍ം-ൿ‌]+)<EoS>', syl[0]) # Take the first element of ('<BoS>കാ<EoS><BoS>വ്യ<EoS>', 0.0)
			# and convert it to a sequence of syllables ['കാ','വ്യ']
			print(syls)

	print()
	exit(0)
if __name__ == "__main__":
	main()
