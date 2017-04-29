#CLI for generating IPA
import argparse
from sys import stderr, stdin, stdout
from fsa import Fsa
import os

def main():
	a = argparse.ArgumentParser()
	a.add_argument('-i', '--input', metavar="INFILE", type=open,
					dest="infile", help="source of malayalam text to be analysed")
	a.add_argument('-o', '--output', metavar="OUTFILE", type=argparse.FileType('w+', encoding='UTF-8'),
					dest="outfile", help="target of generated IPA")
	options = a.parse_args()
	fsa = os.path.dirname(os.path.realpath(__file__))+'/../IPAGenerator.a'
	IPA_generator = Fsa(fsa)
	if not options.infile:
		options.infile = stdin
	if not options.outfile:
		options.outfile = stdout
	for line in options.infile:
		line = line.strip()
		if not line or line == '':
			continue
		gens = IPA_generator.generate(line)
		if not gens:
			options.outfile.write(line+"\t"+"?"+"\n")
		for gen in gens:
			options.outfile.write(line+"\t"+gen[0]+"\n")
	print()
	exit(0)
if __name__ == "__main__":
	main()
