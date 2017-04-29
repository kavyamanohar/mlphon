import argparse
from sys import stderr, stdin, stdout
from fsa import Fsa
import os

def main():
    """Invoke a simple CLI analyser or generator."""
    a = argparse.ArgumentParser()
    a.add_argument('-i', '--input', metavar="INFILE", type=open,
                   dest="infile", help="source of analysis data")
    a.add_argument('-o', '--output', metavar="OUTFILE", type=argparse.FileType('w+', encoding='UTF-8'),
                   dest="outfile", help="target of generated strings")
    a.add_argument('-a', '--analyse', action='store_true',
                   help="Analyse the input file strings")
    a.add_argument('-g', '--generate', action='store_true',
                   help="Generate the input file strings")
    a.add_argument('-v', '--verbose', action='store_true',
                   help="print verbosely while processing")
    options = a.parse_args()
    fsa = os.path.dirname(os.path.realpath(__file__))+'/../PhoneAnalyser.a'
    transducer = Fsa(fsa)
    if not options.infile:
        options.infile = stdin
    if not options.outfile:
        options.outfile = stdout
    if options.verbose:
        print("reading from", options.infile.name)
    for line in options.infile:
        line = line.strip()
        if not line or line == '':
            continue
        if options.analyse:
            anals = transducer.analyse(line)
            if not anals:
                options.outfile.write(line+"\t"+"?"+"\n")
            for anal in anals:
                options.outfile.write(line+"\t"+anal[0]+"\n")
        if options.generate:
            gens = transducer.generate(line)
            if not gens:
                options.outfile.write(line+"\t"+"?"+"\n")
            for gen in gens:
                options.outfile.write(line+"\t"+gen[0]+"\n")
    print()
    exit(0)

if __name__ == "__main__":
    main()
