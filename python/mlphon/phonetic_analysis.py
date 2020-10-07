import argparse
from sys import stderr, stdin, stdout
import os
import libhfst
from pkg_resources import resource_filename, resource_exists
from .tagparse import parse_phonemetags


def getTransducer(fsa):
    istr = libhfst.HfstInputStream(fsa)
    transducers = []
    while not (istr.is_eof()):
        transducers.append(istr.read())
    istr.close()
    return transducers[0]

class Phonetic_analyser:

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

    def analyse(self, token):
        """Perform a simple analysis lookup. """
        if not self.analyser:
            self.analyser = self.getAnalyser()
        analysis_results = self.analyser.lookup(token)
        if not analysis_results:
            raise ValueError('Could not analyse '+ token )
        else:
            for result in analysis_results:
                phonemedetails= parse_phonemetags(result[0])
            return phonemedetails

def main():
    """Invoke a simple CLI analyser or generator."""
    a = argparse.ArgumentParser()
    a.add_argument('-i', '--input', metavar="INFILE", type=open,
                   dest="infile", help="source of analysis data")
    a.add_argument('-o', '--output', metavar="OUTFILE", type=argparse.FileType('w+', encoding='UTF-8'),
                   dest="outfile", help="target of generated strings")
    a.add_argument('-v', '--verbose', action='store_true',
                   help="print verbosely while processing")
    options = a.parse_args()
    phonetic_analyser = Phonetic_analyser()
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
        try:
            phonemedetails = phonetic_analyser.analyse(line)
        except ValueError as error_instance:
            print(error_instance)
            options.outfile.write(line+"\t"+"?"+"\n")
        else:
            options.outfile.write(line+"\t"+str(phonemedetails)+"\n")
    exit(0)

if __name__ == "__main__":
    main()
