import sfst
from pkg_resources import resource_filename, resource_exists

class GraphemeToPhoneme:

    RESOURCE_PATH = "data/ml2ipa.a"

    def __init__(self):
        """Construct Syllable Analyser"""
        self.fsa: str = None
        if resource_exists(__name__, GraphemeToPhoneme.RESOURCE_PATH):
            self.fsa: str = resource_filename(__name__, GraphemeToPhoneme.RESOURCE_PATH)
        if not self.fsa:
            raise ValueError("Could not read the fsa.")
        sfst.init(self.fsa)

    def generate(self, word):
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

        ['kaːṯṯə']
        """
        g2p_results = sfst.generate(word)
        if not len(g2p_results):
            raise ValueError("Could not perform g2p on " + word)
        else:
            phonemes = []
            for result in g2p_results:
                phonemes.append(result)
            return phonemes

    def analyse(self, ipa_sequence):
        """Convert IPA to Malayalam grapheme if possible

        Parameters
        ----------
        ipa_sequence : str
            An IPA sequence, example: 'kaːṯṯə'

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
        mlphon.phoneme_to_grapheme('kaːṯṯə')

        Returns

        ['കാറ്റ്']
        """
        p2g_results = sfst.analyse(ipa_sequence)
        if not len(p2g_results):
            raise ValueError("Could not perform p2g on " + ipa_sequence)
        else:
            graphemes = []
            irrelevant_list = ['ഩ', 'ഺ', 'ൎ', 'ൿ', 'ൔ', 'ൕ', 'ൖ', 'ു്' , 'ംമ', 'മ്ബ', 'ൽല', 'ൾള', 'ൻന','ൺണ', '‍', 'ൻ്റ', 'ോ', 'ൊ', 'െെ']
            for result in p2g_results:
                if not(any(irrelevant in result for irrelevant in irrelevant_list)):
                    graphemes.append(result)
            return graphemes
