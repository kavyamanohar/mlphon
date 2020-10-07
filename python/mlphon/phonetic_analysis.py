import argparse
from sys import stderr, stdin, stdout
import os
import libhfst
from pkg_resources import resource_filename, resource_exists
from .tagparse import parse_syllabletags, parse_phonemetags


def getTransducer(fsa):
    istr = libhfst.HfstInputStream(fsa)
    transducers = []
    while not (istr.is_eof()):
        transducers.append(istr.read())
    istr.close()
    return transducers[0]

class Phonetic_analyser:

    def __init__(self):
        self.fsa_ptags = None
        # Set resource path for phonetic analysis
        resource_path_phonetictag = 'data/g2p.a'
        if resource_exists(__name__, resource_path_phonetictag):
            self.fsa_ptags = resource_filename(__name__, resource_path_phonetictag)
        if not self.fsa_ptags:
            raise ValueError('Could not read the fsa.')
        # Set resource path for syllable splitting
        resource_path_syllables = 'data/syllablizer.a'
        if resource_exists(__name__, resource_path_syllables):
            self.fsa_syl = resource_filename(__name__, resource_path_syllables)
        if not self.fsa_syl:
            raise ValueError('Could not read the fsa.')
        self.phonetictransducer = None
        self.phoneticanalyser = None
        self.g2ptransducer = None
        self.g2p = None
        self.p2g = None
        self.syllabletransducer = None
        self.syllablizer = None

    def getPhoneticanalyser(self):
        if not self.phonetictransducer:
            self.phonetictransducer = getTransducer(self.fsa_ptags)
        phoneticanalyser = libhfst.HfstTransducer(self.phonetictransducer)
        phoneticanalyser.remove_epsilons()
        phoneticanalyser.lookup_optimize()
        return phoneticanalyser

    def getSyllableanalyser(self):
        if not self.syllabletransducer:
            self.syllabletransducer = getTransducer(self.fsa_syl)
        syllablizer = libhfst.HfstTransducer(self.syllabletransducer)
        syllablizer.remove_epsilons()
        syllablizer.lookup_optimize()
        return syllablizer

    def split2syllables(self, token):
        if not self.syllabletransducer:
            self.syllablizer = self.getSyllableanalyser()
        syllablizer_results = self.syllablizer.lookup(token)
        if not syllablizer_results:
            raise ValueError('Could not split '+ token + ' into syllables')
        else:
            for result in syllablizer_results:
                syllables= parse_syllabletags(result[0])
            return syllables

    def analyse(self, token):
        """Perform a simple analysis lookup. """
        if not self.phoneticanalyser:
            self.phoneticanalyser = self.getPhoneticanalyser()
        analysis_results = self.phoneticanalyser.lookup(token)
        if not analysis_results:
            raise ValueError('Could not analyse '+ token )
        else:
            for result in analysis_results:
                phonemedetails= parse_phonemetags(result[0])
            return phonemedetails

def main():
    """Invoke a simple CLI analyser or generator."""
    a = argparse.ArgumentParser()
    a.add_argument('-a', '--analyse', action='store_true',
                help="Phonetically analyse the input file strings")
    a.add_argument('-s', '--syllablize', action='store_true',
                help="Syllablize the input file strings")
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
        if options.analyse:
            try:
                phonemedetails = phonetic_analyser.analyse(line)
            except ValueError as error_instance:
                print(error_instance)
                options.outfile.write(line+"\t"+"?"+"\n")
            else:
                options.outfile.write(line+"\t"+str(phonemedetails)+"\n")
        if options.syllablize:
            try:
                syllables = phonetic_analyser.split2syllables(line)
            except ValueError as error_instance:
                print(error_instance)
                options.outfile.write(line+"\t"+'?'+"\n")
            else:
                options.outfile.write(line+"\t"+str(syllables)+"\n")
    exit(0)

if __name__ == "__main__":
    main()
