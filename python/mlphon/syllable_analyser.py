import sfst
from pkg_resources import resource_filename, resource_exists
from .utilities import parse_syllabletags

class SyllableAnalyser:

    RESOURCE_PATH = "data/syllablizer.a"

    def __init__(self):
        """Construct Syllable Analyser"""
        self.fsa: str = None
        if resource_exists(__name__, SyllableAnalyser.RESOURCE_PATH):
            self.fsa: str = resource_filename(__name__, SyllableAnalyser.RESOURCE_PATH)
        if not self.fsa:
            raise ValueError("Could not read the fsa.")
        sfst.init(self.fsa)

    def analyse(self, word):
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

        syllablizer_results = sfst.generate(word)
        if not len(syllablizer_results):
            raise ValueError("Could not split " + word + " into syllables")
        else:
            syllables = parse_syllabletags(syllablizer_results[0]) # Among the results of words involving dotreph, only zeroth result is valid. eg: ['<BoS>സ്വ<EoS><BoS>ൎണം<EoS>', '<BoS>സ്വ<EoS><BoS>ൎ<EoS><BoS>ണം<EoS>']
            return syllables
