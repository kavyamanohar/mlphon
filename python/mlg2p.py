#!/usr/bin/env python

"""
Simple python interface for ml-phonetic-analyser using libhfst-python. Consider this
class as a standard python interface to ml-phonetic-analyser and standard reference for
scientific studies, as far as python use goes.
"""

import argparse
from sys import stderr, stdin

import hfst


class Mlg2p:

    def __init__(self, fsa, verbosity=False):
        """Construct Mlg2p with given verbosity for printouts."""
        self._verbosity = verbosity
        self.fsa = fsa
        self.transducer = None
        self.analyser = None
        self.generator = None

    def load_filename(self, fsa):
        istr = hfst.HfstInputStream(fsa)
        transducers = []
        transducers.append(istr.read())
        istr.close()
        self.transducer = transducers[0]

    def getGenerator(self):
        if not self.transducer:
            self.load_filename(self.fsa)
        generator = hfst.HfstTransducer(self.transducer)
        generator.remove_epsilons()
        generator.lookup_optimize()
        self.generator = generator

    def getAnalyser(self):
        if not self.transducer:
            self.load_filename(self.fsa)
        analyser = hfst.HfstTransducer(self.transducer)
        analyser.invert()
        analyser.remove_epsilons()
        analyser.lookup_optimize()
        self.analyser = analyser

    def analyse(self, token):
        """Perform IPA&tags to ml-script conversion """
        if not self.analyser:
            self.getAnalyser()
        return self.analyser.lookup(token)

    def generate(self, token):
        """Perform ml-script to IPA and tags conversion"""
        if not self.generator:
            self.getGenerator()
        return self.generator.lookup(token)


def main():
    """Invoke a simple CLI analyser or generator."""
    a = argparse.ArgumentParser()
    a.add_argument('-f', '--fsa', metavar='FSAPATH',
                   help="Path to directory of HFST format automata")
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
    if options.fsa:
        mlg2p = Mlg2p(options.fsa, options.verbose)
    if not options.infile:
        options.infile = stdin
    if options.verbose:
        print("reading from", options.infile.name)
    for line in options.infile:
        line = line.strip()
        if not line or line == '':
            continue
        if options.analyse:
            anals = mlg2p.analyse(line)
            if not anals:
                print(line, "\t?")
                if options.outfile:
                    options.outfile.write("?"+"\n")
            for anal in anals:
                print(line, "\t", anal[0])
                if options.outfile:
                    options.outfile.write(anal[0] +"\n")
        if options.generate:
            gens = mlg2p.generate(line)
            if not gens:
                print(line, "\t?")
                if options.outfile:
                    options.outfile.write("?"+"\n")
            for gen in gens:
                print(line, "\t",  gen[0])
                if options.outfile:
                    options.outfile.write(gen[0] +"\n" )
    print()
    exit(0)

if __name__ == "__main__":
    main()
