# Finite State Transducer Based Malayalam Phonetic Analyser

## Introduction
‘Phoneme’ is the fundamental unit in the the speech system of the language. ‘Grapheme’ is the fundamental unit in the writing system. From one or more graphemes a phoneme can be synthesized.  A phonetic analyser analyses the written form of the text to give the phonetic characteristics of the grapheme sequence.


## Usage

Using Virtual Environment (https://docs.python.org/3/library/venv.html) is recommended. 

To start using this python library

     pip install mlphon

### Syllablize a Malayalam Word

The following python snippet will split a word in Malayalam script into syllables.

    from mlphon import PhoneticAnalyser
    mlphon = PhoneticAnalyser()
    mlphon.split_to_syllables('കേരളം')

It will give the result

    ['കേ', 'ര', 'ളം']

### Phonetically analyse a Malayalam Word

    from mlphon import PhoneticAnalyser
    mlphon = PhoneticAnalyser()
    mlphon.analyse('കേരളം')

It gives the result as a sequence of ipa and associated phonetic tags.

    [{'phonemes': [{'ipa': 'k', 'tags': ['plosive', 'voiceless', 'unaspirated', 'velar']}, {'ipa': 'eː', 'tags': ['v_sign']}]}, {'phonemes': [{'ipa': 'ɾ', 'tags': ['flapped', 'alveolar']}, {'ipa': 'a', 'tags': ['schwa']}]}, {'phonemes': [{'ipa': 'ɭ', 'tags': ['lateral', 'retroflex']}, {'ipa': 'a', 'tags': ['schwa']}, {'ipa': 'm', 'tags': ['anuswara']}]}]

### Malayalam g2p : Grapheme to Phoneme conversion

    from mlphon import PhoneticAnalyser
    mlphon = PhoneticAnalyser()
    mlphon.grapheme_to_phoneme('കാറ്റ്')

It gives the ipa sequence as output.

    ['kaːṯṯ']

### Malayalam p2g : Phoneme to Grapheme conversion

    from mlphon import PhoneticAnalyser
    mlphon = PhoneticAnalyser()
    mlphon.phoneme_to_grapheme('kaːṯṯ')

It gives the corresponding grapheme sequences as output. See that it gives two possible sequences, one of which is obsolete.

    ['കാറ്റ്', 'കാഺ്ഺ്']


### Command Line Interface for the above operations: `mlphon`

    usage: 
    mlphon [-h] [-s] [-a] [-p] [-g] [-i INFILE] [-o OUTFILE] [-v]

    optional arguments:
    -h, --help            show this help message and exit
    -s, --syllablize      Syllablize the input Malayalam string
    -a, --analyse         Phonetically analyse the input Malayalam string
    -p, --tophoneme       Transcribe the input Malayalam grapheme to phoneme
                            sequence
    -g, --tographeme      Transcribe the input phoneme sequence to Malayalam
                            grapheme
    -i INFILE, --input INFILE
                            source of analysis data
    -o OUTFILE, --output OUTFILE
                            target of generated strings
    -v, --verbose         print verbosely while processing

For example to perform g2p operation on a set of words stored in input.txt with one Malayalam word per line,

    mlphon -p -i path/to/inputfile.txt -o path/to/outputfile.txt

Inputfile contents:

    cat path/to/inputfile.txt
    അകത്തുള്ളത്
    അകപ്പെട്ടത്
    അകലെ

Outputfile contents:

	അകത്തുള്ളത് akat̪t̪uɭɭat̪
	അകപ്പെട്ടത്        akappeʈʈat̪
	അകലെ    akale


### Application: Using `mlphon` to create a phonetic lexicon

A typical use case of phonetic analysis is to create a phonetic lexicon to be used in Automatic Speech Recognition or Text to Speech Synthesis. The phonetic representation with each phoneme separated by a space can be obtained as below:

    from mlphon import PhoneticAnalyser, split_as_phonemes
    mlphon = PhoneticAnalyser()
    split_as_phonemes(mlphon.analyse('ഇന്ത്യയുടെ'))

It results in the output:

    'i n̪ t̪ j a j u ʈ e'

The phonetic representation with each syllable separated by a space can be obtained as below:

    from mlphon import PhoneticAnalyser, split_as_syllables
    mlphon = PhoneticAnalyser()
    split_as_syllables(mlphon.analyse('ഇന്ത്യയുടെ'))

It results in the output:

    'i n̪t̪ja ju ʈe'

## For Developers


Understanding the phonetic characteristics of a word is helpful in many computational linguistic problems. For instance, translating a word into its phonetic representation is needed in the synthesis of a text to speech (TTS) system. The phonetic representation is needed to transliterate the word to a different script. It will be more useful if the phonetic representation can be converted back to the grapheme sequence. A finite state transducer (FST) helps us to achieve this.

Finite State Transducers provide a method for performing mathematical operations on ordered collections of context-sensitive rewrite rules such as those commonly used to implement fundamental natural language processing tasks. Multiple rules may be composed into a single pass, mega rule, significantly increasing the efficiency of rule-based systems.   An FST consists of a finite number of states which are linked by transitions labeled with an input/output pair. The FST starts out in a designated start state and jumps to different states depending on the input, while producing output according to its transition table.

In this project we try to develop a phonetic analyser for malayalam script. A specific application of transliterating malayalam script to international phonetic alphabet (IPA) is demonstrated. Specifically, the system is developed using Stuttgart Finite State Toolkit(SFST) formalism and uses Helsinki Finite-State Technology(HFST) as Toolkit.

### Grapheme Phoneme Correspondence(GPC) System

FSTs when applied to GPC systems, the mapping is between the graphemes of the writing system of of a language and phonemes of the speech of that language. This transducer can be implemented as the composition of different transducers, each performing a specific mapping task. The whole task can be implemented by FST chains- One FST for rule based grapheme-phoneme mapping, another FST for implementing schwa addition depending on the context and so on.

Grapheme to phoneme (g2p) correspondence may not be always one-to-one. If the orthography (writing system) of a language is phonemic, then its g2p conversion would have been straightforward. Malayalam, like other indic languages has mostly phonemic orthography unlike English which is non-phonemic. The g2p mapping of malayalam requires  certain contextual rules to be applied to handle schwa addition at beginning/end/middle of words depending on the presence of chillus and virama, phonetic changes that occur in the context of certain sequence of consonants, contextual nasalisation etc. It is usually required that the process is bidirectional. Ie., the grapheme to phoneme correspondence (GPC) system should be able to retrieve the orthographic representation of the language in the native script from the  phonetic sequence.
Malayalam GPC using FST

The chain of transducers used din this system and their function are listed below:

#### Syllablizer

`$wordfilter$`

This is the first level transducer which accepts malayalam scripts and add <BoW> and <EoW> word wrapping tags before further processing. 

_TODO:Provisions to accept punctuation marks, malayalam/arabic numerals, archaic malayalam characters, latin text etc. Currently it assumes what is given as input is a word. It will act as word splitter in future_

`$syllable$`

It splits syllables with <BoS> <EoS> tags to indicate beginning and end of syllables respectively for words input to it with <BoW> and <EoW> tags

*`$syllablizer$` is a composition of `$wordfilter$` and `$syllable$`*

#### FST for g2p mapping

*g2p mapping is done on syllable splitted words. So `$syllablizer$` is a prerequisite for g2p processing. `$g2p$` is composed of the followings FSTs*

`$IPAmap$`

This transducer accepts inputs from the output of  previous transducer and performs the IPA mapping. During this process along with associating graphemes to phonemes, tags are added to indicate if it is a pure vowel, a vowel sign or a consonant. The tags added by this transducer are:
`<virama>` `<vowel>` `<v_sign>` `<visaraga>` `<anuswara>` `<velar>` `<palatal>` `<retroflex>` `<dental>` `<alveolar>` `<labial>` `<labiodental>` ` <glottal>` `<chil>` `<plosive>` `<voiceless>` `<unaspirated>` `<voiced>` `<aspirated>` `<nasal>` `<fricative>` `<flapped>` `<lateral>` `<approximant>` `<glide>` `<trill>`


The malayalam script assumes every consonant if not followed by a virama, has the inherent vowel associated with it. But this FST **does not** associate the inherent vowel to every consonant. But presence of a virama is clearly indicated using a tag `<virama>` for further processing. Only atomic chillus are accepted by the system and `<chil>` tag added.

`$schwa$`

Inherent vowel has to be added to all consonants if it is at `<EoS>` or when it is followed by `<anuswara>` or `<visarga>`.

This context is identified and schwa addition is done along with a `<schwa>` tag.

_TODO: Presence of any special character including space, period, comma, exclamation mark etc to be identified and schwa addition to be done. Inherent vowel takes a special for certain graphemes at the `<BoW>`. This has to be handled.Eg- രമ്യ - രെമ്യ , ഇല - എല_

`$tta_nta$`

The unicode sequence `റ+ ് + റ` has a special phonetic mapping `(ṯṯ)` which is different from the phonetic representation `(r)` of `റ` .

Similar is the case with `ന + ് + റ` . Its phonetic mapping is `(nṯ)` which is much different from the mapping of `ന(n̪)` or `റ(r)`.

This stage of FST replaces the already mapped റ+ ് + റ `r<trill><alveolar><virama>r<trill><alveolar>` to `ṯ<plosive><voiceless><unaspirated><alveolar><virama>ṯ<plosive><voiceless><unaspirated><alveolar>` and  ന + ് + റ `n̪<nasal><dental><virama>r<trill><alveolar>` to `n<nasal><alveolar><virama>ṯ<plosive><voiceless><unaspirated><alveolar>`.


`$reph$`

The reph symbol in Malayalam corresponding to ് + ര (്ര) follows other consonants. But such conjuncts like ക്ര, ത്ര, സ്ര, ശ്ര etc. have the pronunciation which is closer to റ (alveolar trill) rather than ര (flapped trill). `reph.fst` has contextual rules to replace `<virama>ɾ<flapped>` with`<virama>r<trill>`.

`$rephexp$`

But there is an exception to the above rule for the conjuncts ഗ്ര and ദ്ര.

*TODO:ന in malayalam script is a special character which may behave as dental or alveolar consonat depending on the context. As of now it is mapped to dental `n̪<c_dental>`. Contextual rule has to be added to replace it with `n<c_alveolar>` whenever needed. The reph exception rule for ബ്ര is complicated and is currently set to `r<trill>`*

#### FST for contextual nasalisation( അനുനാസികാതിപ്രസരം)

_TODO: ഭംഗി -> ഭങ്ങി , ചിഹ്നം -> ചിന്നം_

#### Overall FST chain

`$g2p$` represents the overall FST which combines each of the above FSTs in a chain.

### Malayalam to IPA with no phonetic tags

`$ml2ipa$` is the fst that converts the Malayalam script to IPA in the analysis mode. It uses the `$g2p$` FST combined with a tag filter `$tagfilter$` to achieve this. But tags like `<anauswara>, <visarga>, <chillu> <zwnj>` are explicitly retained in the IPA analysis. 

## Installation
You need Helsinki Finite-State Transducer Technology (HFST) (http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/) to compile this analyzer. The Makefile provided compiles all the sources and produces the binary FSA `g2p.a`, `ml2ipa.a`, `syllablizer.a`.

In a debian/ubuntu based GNU/Linux, HFST can be installed as follows

```$ sudo apt install hfst```

Clone or download this git repository to your machine.

```$ make```




# References
1. Open morphology for Finnish https://github.com/flammie/omorfi
1. Malyalam morphological analyser using finite state transducers https://github.com/santhoshtr/mlmorph
1. The Festvox Indic Frontend for Grapheme-to-Phoneme Conversion  https://www.parlikar.com/files/aup_wildre_2016.pdf
1. Malayalam Phonetic Archive by THUNCHATH EZHUTHACHAN MALAYALAM UNIVERSITY http://www.cmltemu.in/phonetic/#/
1. IPA and sounds http://www.internationalphoneticalphabet.org/ipa-sounds/ipa-chart-with-sounds/
