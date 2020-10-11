import argparse
from sys import stderr, stdin, stdout
import os
import libhfst
from pkg_resources import resource_filename, resource_exists
from .utilities import parse_syllabletags, parse_phonemetags


def getTransducer(fsa):
    """Returns transducer from finite state automata"""
    istr = libhfst.HfstInputStream(fsa)
    transducers = []
    while not (istr.is_eof()):
        transducers.append(istr.read())
    istr.close()
    return transducers[0]


class PhoneticAnalyser:
    """
    A class used to represent a Phonetic Analyser

    Attributes
    ----------
    fsa_syl : fsa
        finite state automata for syllablizing
    fsa_ptags : fsa
        finite state automata for phonetic tag analysis
    fsa_g2p : fsa
        finite state automata for grapheme-phoneme correspondence system
    syllabletransducer :
        transducer derived from fsa_syl
    self.syllablizer :
        optimized syllable transducer
    phonetictransducer :
        transducer derived from fsa_ptags
    phoneticanalyser :
        optimized phonetic analyser as a transducer
    g2ptransducer :
        transducer derived from fsa_g2p
    g2pconverter :
        optimized grapheme to phoneme transducer
    p2gconverter :
        optimized phoneme to grapheme transducer


    Methods
    -------
    getSyllableAnalyser()
    getPhoneticAnalyser()
    getG2PConverter()
    getP2GConverter()
    split_to_syllables()
    analyse()
    grapheme_to_phoneme()
    phoneme_to_grapheme()

    """

    def __init__(self):
        self.fsa_syl = None
        self.fsa_ptags = None
        self.fsa_g2p = None
        # Set resource path for syllable splitting
        resource_path_syllables = "data/syllablizer.a"
        # Set resource path for phonetic analysis
        resource_path_phonetictag = "data/g2p.a"
        # Set resource path for g2p conversion
        resource_path_g2p = "data/ml2ipa.a"
        if resource_exists(__name__, resource_path_syllables):
            self.fsa_syl = resource_filename(__name__, resource_path_syllables)
        if not self.fsa_syl:
            raise ValueError("Could not read the fsa.")
        if resource_exists(__name__, resource_path_phonetictag):
            self.fsa_ptags = resource_filename(__name__, resource_path_phonetictag)
        if not self.fsa_ptags:
            raise ValueError("Could not read the fsa.")
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

    def getPhoneticAnalyser(self):
        if not self.phonetictransducer:
            self.phonetictransducer = getTransducer(self.fsa_ptags)
        phoneticanalyser = libhfst.HfstTransducer(self.phonetictransducer)
        phoneticanalyser.remove_epsilons()
        phoneticanalyser.lookup_optimize()
        return phoneticanalyser

    def getSyllableAnalyser(self):
        if not self.syllabletransducer:
            self.syllabletransducer = getTransducer(self.fsa_syl)
        syllablizer = libhfst.HfstTransducer(self.syllabletransducer)
        syllablizer.remove_epsilons()
        syllablizer.lookup_optimize()
        return syllablizer

    def getG2PConverter(self):
        if not self.g2ptransducer:
            self.g2ptransducer = getTransducer(self.fsa_g2p)
        g2pconverter = libhfst.HfstTransducer(self.g2ptransducer)
        g2pconverter.remove_epsilons()
        g2pconverter.lookup_optimize()
        return g2pconverter

    def getP2GConverter(self):
        if not self.g2ptransducer:
            self.g2ptransducer = getTransducer(self.fsa_g2p)
        p2gconverter = libhfst.HfstTransducer(self.g2ptransducer)
        # p2gconverter is obtained by inverting the g2ptransducer
        p2gconverter.invert()
        p2gconverter.remove_epsilons()
        p2gconverter.lookup_optimize()
        return p2gconverter

    def split_to_syllables(self, word):
        """Split Malayalam word to syllables

        Parameters
        ----------
        word : str
            A word in Malayalam, example : 'കേരളം'

        Raises
        ------
        ValueError
            If the word passed in not a valid Malayalam word

        Returns
        -------
        list
            a list of strings

        Example
        -------
        mlphon.syllablize('കേരളം') Returns

        ['കേ', 'ര', 'ളം']
        """
        if not self.syllabletransducer:
            self.syllablizer = self.getSyllableAnalyser()
        syllablizer_results = self.syllablizer.lookup(word)
        if not syllablizer_results:
            raise ValueError("Could not split " + word + " into syllables")
        else:
            for result in syllablizer_results:
                syllables = parse_syllabletags(result[0])
            return syllables

    def analyse(self, word):
        """Split Malayalam word to syllables

        Parameters
        ----------
        word : str

            A word in Malayalam, example: 'കേരളം'

        Raises
        ------
        ValueError

            If the word passed in not a valid Malayalam word

        Returns
        -------
        list
            a list of dict items. Each element in the list is a dict. See example

        Example
        -------
        mlphon.analyse('കേരളം')

        [{'phonemes': [{'ipa': 'k',
                        'tags': ['plosive', 'voiceless', 'unaspirated', 'velar']},
                       {'ipa': 'eː',
                        'tags': ['v_sign']}]},
        {'phonemes': [{'ipa': 'ɾ',
                       'tags': ['flapped', 'alveolar']},
                       {'ipa': 'a',
                        'tags': ['schwa']}]},
        {'phonemes': [{'ipa': 'ɭ',
                       'tags': ['lateral', 'retroflex']},
                      {'ipa': 'a',
                       'tags': ['schwa']},
                     {'ipa': 'm',
                      'tags': ['anuswara']}]}]
        """
        if not self.phoneticanalyser:
            self.phoneticanalyser = self.getPhoneticAnalyser()
        analysis_results = self.phoneticanalyser.lookup(word)
        if not analysis_results:
            raise ValueError("Could not analyse " + word)
        else:
            for result in analysis_results:
                phonemedetails = parse_phonemetags(result[0])
            return phonemedetails

    def grapheme_to_phoneme(self, word):
        """Convert Malayalam grapheme to phonemes in IPA

        Parameters
        ----------
        word : str
            A word in Malayalam, example: 'കാറ്റ്'

        Raises
        ------
        ValueError
            If the word passed in not a valid Malayalam word and can not be transcribed

        Returns
        -------
        list
            a list of strings. Each string represents a valid pronunciation of input string in IPA format

        Example
        -------
        mlphon.grapheme_to_phoneme('കാറ്റ്')

        Returns

        ['kaːṯṯ']
        """
        if not self.g2pconverter:
            self.g2pconverter = self.getG2PConverter()
        g2p_results = self.g2pconverter.lookup(word)
        if not g2p_results:
            raise ValueError("Could not perform g2p on " + word)
        else:
            phonemes = []
            for result in g2p_results:
                phonemes.append(result[0])
            return phonemes

    def phoneme_to_grapheme(self, ipa_sequence):
        """Convert IPA to Malayalam grapheme if possible

        Parameters
        ----------
        ipa_sequence : str
            An IPA sequence, example: 'kaːṯṯ'

        Raises
        ------
        ValueError
            If the word passed in not an IPA sequence with valid Malayalam pronunciation

        Returns
        -------
        list
            a list of strings. Each string is a possible Malayalam word, corresponding to given IPA sequence
        Example
        -------
        mlphon.phoneme_to_grapheme('kaːṯṯ')

        Returns

        ['കാറ്റ്', 'കാഺ്ഺ്']
        """
        if not self.p2gconverter:
            self.p2gconverter = self.getP2GConverter()
        p2g_results = self.p2gconverter.lookup(ipa_sequence)
        if not p2g_results:
            raise ValueError("Could not perform p2g on " + ipa_sequence)
        else:
            graphemes = []
            for result in p2g_results:
                graphemes.append(result[0])
            return graphemes
