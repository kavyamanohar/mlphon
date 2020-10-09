Python Interface for Malayalam phonetic analyser
==================================================
.. image:: https://img.shields.io/pypi/v/mlphon.svg
    :target: https://pypi.python.org/pypi/mlphon
    :alt: PyPI Version

This is python interface for the `Malayalam phonetic analyser - mlphon`_.

Installation
------------

Using Virtual Environment (https://docs.python.org/3/library/venv.html) is recommended. 

  .. code-block:: console

    $ pip install mlphon


Syllablize a Malayalam Word
---------------------------

The following python snippet will split a word in Malayalam script into syllables.

  .. code-block:: python

    from mlphon import PhoneticAnalyser
    mlphon = PhoneticAnalyser()
    mlphon.split_to_syllables('കേരളം')

It will give the result

    ['കേ', 'ര', 'ളം']

Phonetically analyse a Malayalam Word
-------------------------------------

  .. code-block:: python

    from mlphon import PhoneticAnalyser
    mlphon = PhoneticAnalyser()
    mlphon.analyse('കേരളം')

It gives the result as a sequence of ipa and associated phonetic tags.

    [{'phonemes': [{'ipa': 'k', 'tags': ['plosive', 'voiceless', 'unaspirated', 'velar']}, {'ipa': 'eː', 'tags': ['v_sign']}]}, {'phonemes': [{'ipa': 'ɾ', 'tags': ['flapped', 'alveolar']}, {'ipa': 'a', 'tags': ['schwa']}]}, {'phonemes': [{'ipa': 'ɭ', 'tags': ['lateral', 'retroflex']}, {'ipa': 'a', 'tags': ['schwa']}, {'ipa': 'm', 'tags': ['anuswara']}]}]

Malayalam g2p : Grapheme to Phoneme conversion
----------------------------------------------

  .. code-block:: python

    from mlphon import PhoneticAnalyser
    mlphon = PhoneticAnalyser()
    mlphon.grapheme_to_phoneme('കാറ്റ്')

It gives the ipa sequence as output.

    ['kaːṯṯ']

Malayalam p2g : Phoneme to Grapheme conversion
----------------------------------------------
  .. code-block:: python

    from mlphon import PhoneticAnalyser
    mlphon = PhoneticAnalyser()
    mlphon.phoneme_to_grapheme('kaːṯṯ')

It gives the corresponding grapheme sequences as output. See that it gives two possible sequences, one of which is obsolete.

    ['കാറ്റ്', 'കാഺ്ഺ്']


Command Line Interface for the above operations: `mlphon`
----------------------------------------------------------
  .. code-block:: console


    usage: 
    mlphon [-h] [-s] [-a] [-p] [-g] [-i INFILE] [-o OUTFILE] [-v]

    optional arguments:
    -h, --help            show this help message and exit
    -s, --syllablize      Syllablize the input Malayalam string
    -a, --analyse         Phonetically analyse the input Malayalam string
    -p, --tophoneme       Transcribe the input Malayalam grapheme to phoneme
    -g, --tographeme      Transcribe the input phoneme to Malayalam grapheme
    -i INFILE, --input INFILE   source of analysis data
    -o OUTFILE, --output OUTFILE    target of generated strings
    -v, --verbose         print verbosely while processing

For example to perform g2p operation on a set of words stored in input.txt with one Malayalam word per line,
  .. code-block:: console

    mlphon -p -i path/to/inputfile.txt -o path/to/outputfile.txt

Inputfile contents:
  .. code-block:: console

    cat path/to/inputfile.txt
    അകത്തുള്ളത്
    അകപ്പെട്ടത്
    അകലെ

Outputfile contents:
  .. code-block:: console

	അകത്തുള്ളത് akat̪t̪uɭɭat̪
	അകപ്പെട്ടത്        akappeʈʈat̪
	അകലെ    akale

Application: Using `mlphon` to create a phonetic lexicon
--------------------------------------------------------

A typical use case of phonetic analysis is to create a phonetic lexicon to be used in Automatic Speech Recognition or Text to Speech Synthesis. The phonetic representation with each phoneme separated by a space can be obtained as below:

  .. code-block:: python

    from mlphon import PhoneticAnalyser, split_as_phonemes
    mlphon = PhoneticAnalyser()
    split_as_phonemes(mlphon.analyse('ഇന്ത്യയുടെ'))

It results in the output:

    'i n̪ t̪ j a j u ʈ e'

The phonetic representation with each syllable separated by a space can be obtained as below:

  .. code-block:: python

    from mlphon import PhoneticAnalyser, split_as_syllables
    mlphon = PhoneticAnalyser()
    split_as_syllables(mlphon.analyse('ഇന്ത്യയുടെ'))

It results in the output:

    'i n̪t̪ja ju ʈe'



.. _`Malayalam Phonetic Analyser - mlphon`: https://gitlab.com/smc/mlphon
.. _`venv`: https://docs.python.org/3/library/venv.html
