#!/usr/bin/env python

"""
Simple python interface for ml-phonetic-analyser using libhfst-python. Consider this
class as a standard python interface to ml-phonetic-analyser and standard reference for
scientific studies, as far as python use goes.
"""

import argparse
from sys import stderr, stdin, stdout

import hfst


class Fsa:

    def __init__(self, fsa, verbosity=False):
        """Construct Fsa with given verbosity for printouts."""
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
        generator.invert()
        generator.remove_epsilons()
        generator.lookup_optimize()
        self.generator = generator

    def getAnalyser(self):
        if not self.transducer:
            self.load_filename(self.fsa)
        analyser = hfst.HfstTransducer(self.transducer)
        analyser.remove_epsilons()
        analyser.lookup_optimize()
        self.analyser = analyser

    def analyse(self, token):
        """Perform analysis operation on input string """
        if not self.analyser:
            self.getAnalyser()
        return self.analyser.lookup(token)

    def generate(self, token):
        """Perform generate operation on input string"""
        if not self.generator:
            self.getGenerator()
        return self.generator.lookup(token)
