from sys import stderr, stdin, stdout
import sfst
from pkg_resources import resource_filename, resource_exists
from .utilities import parse_phonemetags
from .syllable_analyser import SyllableAnalyser
from .g2p import GraphemeToPhoneme

class PhoneticAnalyser:
    """
    A class used to represent a Phonetic Analyser

    Attributes
    ----------
    fsa_syl : fsa
        finite state automata for syllablizing
    fsa_analysis : fsa
        finite state automata for phonetic tag analysis
    self.syllablizer :
        optimized syllable transducer
    phonetictransducer :
        transducer derived from fsa_analysis
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
    split_to_syllables()
    analyse()
    grapheme_to_phoneme()
    phoneme_to_grapheme()

    """

    RESOURCE_PATH = "data/analysis.a"

    def __init__(self):
        """Construct Syllable Analyser"""
        self.fsa: str = None
        if resource_exists(__name__, PhoneticAnalyser.RESOURCE_PATH):
            self.fsa: str = resource_filename(__name__, PhoneticAnalyser.RESOURCE_PATH)
        if not self.fsa:
            raise ValueError("Could not read the fsa.")
        sfst.init(self.fsa)


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
                        'tags': ['inherentvowel']}]},
        {'phonemes': [{'ipa': 'ɭ',
                       'tags': ['lateral', 'retroflex']},
                      {'ipa': 'a',
                       'tags': ['inherentvowel']},
                     {'ipa': 'm',
                      'tags': ['anuswara']}]}]
        """
        analysis_results = sfst.generate(word)
        analysis_results = list(set(analysis_results)) #To choose unique results
        if not analysis_results:
            raise ValueError("Could not analyse " + word)
        else:
            analysis_phonemedetails = []
            for result in analysis_results:
                analysis_phonemedetails.append(parse_phonemetags(result))
            return analysis_phonemedetails

    def grapheme_to_phoneme(self, word):
        g2p = GraphemeToPhoneme()
        return g2p.generate(word)

    def phoneme_to_grapheme(self, ipa_sequence):
        g2p = GraphemeToPhoneme()
        return g2p.analyse(ipa_sequence)


    def split_to_syllables(self, word):
        syllableAnalyser = SyllableAnalyser()
        return syllableAnalyser.analyse(word)

