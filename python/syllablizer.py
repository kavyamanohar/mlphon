#CLI for generating IPA
import argparse
from sys import stderr, stdin, stdout
from fsa import Fsa
import os
import regex

def main():
	a = argparse.ArgumentParser()
	a.add_argument('-i', '--input', metavar="INFILE", type=open,
					dest="infile", help="source of malayalam text to be analysed")
	a.add_argument('-o', '--output', metavar="OUTFILE", type=argparse.FileType('w+', encoding='UTF-8'),
					dest="outfile", help="target of splitted syllables")
	options = a.parse_args()
	fsa = os.path.dirname(os.path.realpath(__file__))+'/../syllablizer.a'
	syllablizer = Fsa(fsa)
	if not options.infile:
		options.infile = stdin
	if not options.outfile:
		options.outfile = stdout
	for line in options.infile:
		line = line.strip()
		if not line or line == '':
			continue
		syllables = syllablizer.analyse(line)
		if not syllables:
			options.outfile.write(line+"\t"+"?"+"\n")
		for syl in syllables:
			options.outfile.write(line+"\t"+syl[0]+"\n")
			syls = regex.findall('<BoS>([‍ം-ൿ‌]+)<EoS>', syl[0])
			print(syls)

	print()
	exit(0)
if __name__ == "__main__":
	main()
