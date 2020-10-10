import argparse
from sys import stderr, stdin, stdout
import os
import libhfst
from pkg_resources import resource_filename, resource_exists
from .utilities import parse_syllabletags, parse_phonemetags


def getTransducer(fsa):
    istr = libhfst.HfstInputStream(fsa)
    transducers = []
    while not (istr.is_eof()):
        transducers.append(istr.read())
    istr.close()
    return transducers[0]


class PhoneticAnalyser:
    def __init__(self):
        self.fsa_syl = None
        self.fsa_ptags = None
        self.fsa_g2p = None
        # Set resource path for syllable splitting
        resource_path_syllables = "data/syllablizer.a"
        if resource_exists(__name__, resource_path_syllables):
            self.fsa_syl = resource_filename(__name__, resource_path_syllables)
        if not self.fsa_syl:
            raise ValueError("Could not read the fsa.")
        # Set resource path for phonetic analysis
        resource_path_phonetictag = "data/g2p.a"
        if resource_exists(__name__, resource_path_phonetictag):
            self.fsa_ptags = resource_filename(__name__, resource_path_phonetictag)
        if not self.fsa_ptags:
            raise ValueError("Could not read the fsa.")
        # Set resource path for g2p splitting
        resource_path_g2p = "data/ml2ipa.a"
        if resource_exists(__name__, resource_path_g2p):
            self.fsa_g2p = resource_filename(__name__, resource_path_g2p)
        if not self.fsa_g2p:
            raise ValueError("Could not read the fsa.")
        self.syllabletransducer = None
        self.syllablizer = None
        self.phonetictransducer = None
        self.phoneticanalyser = None
        self.g2ptransducer = None
        self.g2pconverter = None
        self.p2gconverter = None

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

    def getG2Pconverter(self):
        if not self.g2ptransducer:
            self.g2ptransducer = getTransducer(self.fsa_g2p)
        g2pconverter = libhfst.HfstTransducer(self.g2ptransducer)
        g2pconverter.remove_epsilons()
        g2pconverter.lookup_optimize()
        return g2pconverter

    def getP2Gconverter(self):
        if not self.g2ptransducer:
            self.g2ptransducer = getTransducer(self.fsa_g2p)
        p2gconverter = libhfst.HfstTransducer(self.g2ptransducer)
        p2gconverter.invert()
        p2gconverter.remove_epsilons()
        p2gconverter.lookup_optimize()
        return p2gconverter

    def split_to_syllables(self, token):
        if not self.syllabletransducer:
            self.syllablizer = self.getSyllableanalyser()
        syllablizer_results = self.syllablizer.lookup(token)
        if not syllablizer_results:
            raise ValueError("Could not split " + token + " into syllables")
        else:
            for result in syllablizer_results:
                syllables = parse_syllabletags(result[0])
            return syllables

    def analyse(self, token):
        if not self.phoneticanalyser:
            self.phoneticanalyser = self.getPhoneticanalyser()
        analysis_results = self.phoneticanalyser.lookup(token)
        if not analysis_results:
            raise ValueError("Could not analyse " + token)
        else:
            for result in analysis_results:
                phonemedetails = parse_phonemetags(result[0])
            return phonemedetails

    def grapheme_to_phoneme(self, token):
        if not self.g2pconverter:
            self.g2pconverter = self.getG2Pconverter()
        g2p_results = self.g2pconverter.lookup(token)
        if not g2p_results:
            raise ValueError("Could not perform g2p on " + token)
        else:
            phonemes = []
            for result in g2p_results:
                phonemes.append(result[0])
            return phonemes

    def phoneme_to_grapheme(self, token):
        if not self.p2gconverter:
            self.p2gconverter = self.getP2Gconverter()
        p2g_results = self.p2gconverter.lookup(token)
        if not p2g_results:
            raise ValueError("Could not perform p2g on " + token)
        else:
            graphemes = []
            for result in p2g_results:
                graphemes.append(result[0])
            return graphemes


def main():
    exit(0)


if __name__ == "__main__":
    main()
