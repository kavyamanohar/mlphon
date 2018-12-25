import argparse
from sys import stderr, stdin, stdout
import os
import libhfst
from pkg_resources import resource_filename, resource_exists

def getTransducer(fsa):
    istr = libhfst.HfstInputStream(fsa)
    transducers = []
    while not (istr.is_eof()):
        transducers.append(istr.read())
    istr.close()
    return transducers[0]

class G2P:

    def __init__(self):
        self.fsa = None
        resource_path = 'data/g2p.a'
        if resource_exists(__name__, resource_path):
            self.fsa = resource_filename(__name__, resource_path)
        if not self.fsa:
            raise ValueError('Could not read the fsa.')
        self.transducer = None
        self.analyser = None
        self.generator = None

    def getAnalyser(self):
        if not self.transducer:
            self.transducer = getTransducer(self.fsa)
        analyser = libhfst.HfstTransducer(self.transducer)
        analyser.remove_epsilons()
        analyser.lookup_optimize()
        return analyser

    def getGenerator(self):
        if not self.transducer:
            self.transducer = getTransducer(self.fsa)
        generator = libhfst.HfstTransducer(self.transducer)
        generator.invert()
        generator.remove_epsilons()
        generator.lookup_optimize()
        return generator

    def analyse(self, token):
        """Perform a simple analysis lookup. """
        if not self.analyser:
            self.analyser = self.getAnalyser()
        analysis_results = self.analyser.lookup(token)
        return analysis_results

    def generate(self, token):
        """Perform a simple generator lookup. """
        if not self.generator:
            self.generator = self.getGenerator()
        generator_results = self.generator.lookup(token)
        return generator_results

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
    g2p = G2P()
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
            anals = g2p.analyse(line)
            if not anals:
                options.outfile.write(line+"\t"+"?"+"\n")
            for anal in anals:
                options.outfile.write(line+"\t"+anal[0]+"\n")
        if options.generate:
            gens = g2p.generate(line)
            if not gens:
                options.outfile.write(line+"\t"+"?"+"\n")
            for gen in gens:
                options.outfile.write(line+"\t"+gen[0]+"\n")
    print()
    exit(0)

if __name__ == "__main__":
    main()
