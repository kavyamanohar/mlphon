# Finite State Transducer Based Malayalam Phonetic Analyser

## Introduction
‘Phoneme’ is the fundamental unit in the the speech system of the language. ‘Grapheme’ is the fundamental unit in the writing system. From one or more graphemes a phoneme can be synthesized.  A phonetic analyser analyses the written form of the text to give the phonetic characteristics of the grapheme sequence.


## Usage

Using Virtual Environment (https://docs.python.org/3/library/venv.html) is recommended. 

To start using this python library

    $ pip install mlphon

### Syllablize a Malayalam Word

The following python snippet will split a word in Malayalam script into syllables.

    from mlphon import Syllablizer
    syl = Syllablizer()
    syl.syllablize('കേരളം')

It will give the result

    (('<BoS>കേ<EoS><BoS>ര<EoS><BoS>ളം<EoS>', 0.0),)

The second item in this result is the weight. It is not relevant in the current implementation.

It can be invoked from the command line using the command

    $ mlsyllablize

For the input 

    സഫലമീയാത്ര

the output would be


    ['സ', 'ഫ', 'ല', 'മീ', 'യാ', 'ത്ര']

#### More details on using mlsyllablize

    $ mlsyllablize --help
    usage: mlsyllablize [-h] [-i INFILE] [-o OUTFILE]  optional arguments:
    -h, --help
                    show this help message and exit
    -i INFILE, --input INFILE
                    source of analysis data
    -o OUTFILE, --output OUTFILE
                    target of generated strings


This command can take input from a text file and write the generated IPA to another text file

    $mlsyllablize -i path/to/inputfile.txt -o path/to/outputfile.txt

## g2p conversion for Malayalam. Malayalam script would be turned to syllablized IPA sequence along with detailed phonetic feature tag

To **analyse** the Malayalam script into IPA along with the details of all vowels, vowelsigns, type of consonant etc. as tags, use the following python snippet:

    from mlphon import G2P
    analyser = G2P()
    analyser.analyse('കേരളം')

It would give the output

    [(('<BoS>k<plosive><voiceless><unaspirated><velar>eː<v_sign><EoS><BoS>ɾ<flapped><alveolar>a<schwa><EoS><BoS>ɭ<lateral><retroflex>a<schwa>m<anuswara><EoS>', 0.0),))]

To **generate** Malayalam script from the phonetic details, use the following python-snippet

    from mlphon import G2P
    generator = G2P()
    generator.generate('<BoS>k<plosive><voiceless><unaspirated><velar>eː<v_sign><EoS><BoS>ɾ<flapped><alveolar>a<schwa><EoS><BoS>ɭ<lateral><retroflex>a<schwa>m<anuswara><EoS>')

It would give the output

    (('കേരളം', 0.0),)


You can invoke the command below for the same purpose.

    $ mlg2p -a

Give the input 

    കാവ്യ

It will give you the result of g2p analysis as:

    <BoS>k<plosive><voiceless><unaspirated><velar>aː<v_sign><EoS><BoS>ʋ<approximant><labiodental><virama>j<glide><palatal>a<schwa><EoS>


To **generate** the Malayalam script from the phonetic script and the tags  use the command:

    $ mlg2p -g

Give the input and press Enter.

    <BoS>p<plosive><voiceless><unaspirated><labial>aː<v_sign><EoS><BoS>l<chil><EoS>

It will return you the corresponding malayalam script

    പാൽ

The command line interface allows to read from a text file and write the result of analysis or generation to a text file.

    $ mlg2p -g -i path/to/inputfile.txt -o path/to/outputfile.txt

Here `path/to/outputfile.txt` contains the IPA along with tags. The result of its analysis is written to `path/to/outputfile.txt`

#### More details on using `$ mlg2p`

    $ mlg2p --help
    usage: mlg2p [-h] [-i INFILE] [-o OUTFILE] [-a] [-g] [-v]
    optional arguments:
    -h, --help           
                        show this help message and exit
    -i INFILE, --input INFILE
                        source of analysis data
    -o OUTFILE, --output OUTFILE
                        target of generated strings
    -a, --analyse        Analyse the input file strings
    -g, --generate       Generate the input file strings
    -v, --verbose        print verbosely while processing

### IPA and Malayalam script Conversions

For grapheme to IPA analysis, use the code snippet:

    from mlphon import IPA
    analyser = IPA()
    analyser.analyse("കേരളം")

This would give the result

    (('keːɾaɭam<anuswara>', 0.0),)

`<anauswara>, <visarga>, <chillu> <zwnj>` tags are explicitly shown in the IPA analysis.

For Malayalam script grapheme generation from IPA

    from mlphon import IPA
    generator = IPA()
    generator.generate('keːɾaɭam<anuswara>')

The result would be:

    (('കേരളം', 0.0),)

There can be multiple results in this generation. Please ignore the irrelevant ones, if any.

The following command lets you do the same things

    $ mlipa

#### `mlipa` Command line usage

    $ mlipa --help
    usage: mlipa [-h] [-i INFILE] [-o OUTFILE] [-a] [-g] [-v]
    optional arguments:
    -h, --help           show this help message and exit
    -i INFILE, --input INFILE
                    source of analysis data
    -o OUTFILE, --output OUTFILE
                    target of generated strings
    -a, --analyse   Analyse the input file strings
    -g, --generate  Generate the input file strings
    -v, --verbose   print verbosely while processing

Tag Parse Functions
-------------------

The analysis function of G2P returns the output with tags in angle brackets.The following functions parses and separates tags, syllables and phoneme sequences.


Using getPhonemelist()
-----------

    from mlphon import G2P, getPhonemelist
    g2p = G2P()
    analysis = g2p.analyse('കേരളം')
    for item in analysis:
      getPhonemelist(item[0])

Gives

      'k eː ɾ a ɭ a m'



Using  getPhonemetaglist()
-----------


    from mlphon import G2P, getPhonemetaglist
    g2p = G2P()
    analysis = g2p.analyse('കേരളം')
    for item in analysis:
      getPhonemetaglist(item[0])

Gives a list of dictionary objects


    [{'phonemes': [{'ipa': 'k', 'tags': ['plosive', 'voiceless', 'unaspirated', 'velar']}, {'ipa': 'eː', 'tags': ['v_sign']}]}, {'phonemes': [{'ipa': 'ɾ', 'tags': ['flapped', 'alveolar']}, {'ipa': 'a', 'tags': ['schwa']}]}, {'phonemes': [{'ipa': 'ɭ', 'tags': ['lateral', 'retroflex']}, {'ipa': 'a', 'tags': ['schwa']}, {'ipa': 'm', 'tags': ['anuswara']}]}]

Using getSyllablelist()
------------------

    from mlphon import G2P, getSyllablelist
    g2p = G2P()
    analysis = g2p.analyse('കേരളം')
    for item in analysis:
      getSyllablelist(item[0])

It gives the syllable separated output as:

    ['k<plosive><voiceless><unaspirated><velar>eː<v_sign>', 'ɾ<flapped><alveolar>a<schwa>', 'ɭ<lateral><retroflex>a<schwa>m<anuswara>']

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
