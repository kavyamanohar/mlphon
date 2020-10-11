import os
from sys import stderr, stdin, stdout
import regex
import argparse

def parse_syllabletags(sequence):
    """Parse a string with syllable tags to return the list of syllables

    Parameters
    ----------
    sequence : str
        String with syllable boundary tags <BoS> and <EoS>
        Example 1 : '<BoS>കേ<EoS><BoS>ര<EoS><BoS>ളം<EoS>'
        Example 2 : '<BoS>k<plosive><voiceless><unaspirated><velar>eː<v_sign><EoS>
                        <BoS>ɾ<flapped><alveolar>a<schwa><EoS>
                        <BoS>ɭ<lateral><retroflex>a<schwa>m<anuswara><EoS>'

    Returns
    -------
    list
        a list of strings, each representing a syllable

    Example
    -------
    parse_syllabletags('<BoS>കേ<EoS><BoS>ര<EoS><BoS>ളം<EoS>')
    returns : ['കേ', 'ര', 'ളം']

    parse_syllabletags('<BoS>k<plosive><voiceless><unaspirated><velar>eː<v_sign><EoS>
                        <BoS>ɾ<flapped><alveolar>a<schwa><EoS>
                        <BoS>ɭ<lateral><retroflex>a<schwa>m<anuswara><EoS>')
    returns: ['k<plosive><voiceless><unaspirated><velar>eː<v_sign>', '<ɾ<flapped><alveolar>a<schwa>', 'ɭ<lateral><retroflex>a<schwa>m<anuswara>']
    """
    sylBoundary_parser = regex.compile(r"<BoS>(.+?)<EoS>")
    syllables = sylBoundary_parser.findall(sequence)
    return syllables


def parse_phonemetags(sequence):
    """Parse a string with syllable and phoneme tags to return the list of dict

    Parameters
    ----------
    sequence : str
        String with syllable boundary tags and phonetic tags
        Example 1 : '<BoS>k<plosive><voiceless><unaspirated><velar>eː<v_sign><EoS>
                        <BoS>ɾ<flapped><alveolar>a<schwa><EoS>
                        <BoS>ɭ<lateral><retroflex>a<schwa>m<anuswara><EoS>'

    Returns
    -------
    list
        a list of dict in the following format

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
    phoneme_parser = regex.compile(r"((?P<phonemes>([^<])+)(?P<tags>(<[^>]+>)+))+")
    tag_parser = regex.compile(r"<([a-z_]+)>+?")
    syllables = parse_syllabletags(sequence)
    phonemedetails = []
    for sindex in range(len(syllables)):
        match = phoneme_parser.match(syllables[sindex])
        phonemes = match.captures("phonemes")
        tags = match.captures("tags")
        phonemetags = []
        for pindex in range(len(phonemes)):
            tagsequence = tag_parser.findall(tags[pindex])
            phonemetags.append({"ipa": phonemes[pindex], "tags": tagsequence})
        phonemedetails.append({"phonemes": phonemetags})
    return phonemedetails


def split_as_phonemes(phonemedetails):
    """Parse phoneme details in the form of list of dict and returns a string of phonemes in IPA separated by spaces

    Parameters
    ----------
    phonemedetails : list of dict

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
    Returns
    -------
    str
        phoneme sequence separated by spaces

        'k eː ɾ a ɭ a m'
    """
    phonemes = ""
    for sylindex in range(len(phonemedetails)):
        for phonemeindex in range(len(phonemedetails[sylindex]["phonemes"])):
            if len(phonemes) != 0:
                phonemes += " "
            phonemes += str(phonemedetails[sylindex]["phonemes"][phonemeindex]["ipa"])
    return phonemes


def split_as_syllables(phonemedetails):
    """Parse phoneme details in the form of list of dict and returns a string of syllables in IPA separated by spaces

    Parameters
    ----------
    phonemedetails : list of dict

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
    Returns
    -------
    str
        syllable sequence in IPA separated by spaces

        'keː ɾa ɭam'
    """
    phonemes = ""
    for sylindex in range(len(phonemedetails)):
        if len(phonemes) != 0:
            phonemes += " "
        for phonemeindex in range(len(phonemedetails[sylindex]["phonemes"])):
            phonemes += str(phonemedetails[sylindex]["phonemes"][phonemeindex]["ipa"])
    return phonemes


def main():
    exit(0)


if __name__ == "__main__":
    main()
