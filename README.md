# Finite State Transducer Based Malayalam Phonetic Analyser

## Introduction
‘Phoneme’ is the fundamental unit in the the speech system of the language. ‘Grapheme’ is the fundamental unit in the writing system. From one or more graphemes a phoneme can be synthesized.  A phonetic analyser analyses the written form of the text to give the phonetic characteristics of the grapheme sequence.

Understanding the phonetic characteristics of a word is helpful in many computational linguistic problems. For instance, translating a word into its phonetic representation is needed in the synthesis of a text to speech (TTS) system. The phonetic representation is needed to transliterate the word to a different script. It will be more useful if the phonetic representation can be converted back to the grapheme sequence. A finite state transducer (FST) helps us to achieve this.

Finite State Transducers provide a method for performing mathematical operations on ordered collections of context-sensitive rewrite rules such as those commonly used to implement fundamental natural language processing tasks. Multiple rules may be composed into a single pass, mega rule, significantly increasing the efficiency of rule-based systems.   An FST consists of a finite number of states which are linked by transitions labeled with an input/output pair. The FST starts out in a designated start state and jumps to different states depending on the input, while producing output according to its transition table.

In this project we try to develop a phonetic analyser for malayalam script. A specific application of transliterating malayalam script to international phonetic alphabet (IPA) is demonstrated. Specifically, the system is developed using Stuttgart Finite State Toolkit(SFST) formalism and uses Helsinki Finite-State Technology(HFST) as Toolkit.

## Grapheme Phoneme Correspondence(GPC) System

FSTs when applied to GPC systems, the mapping is between the graphemes of the writing system of of a language and phonemes of the speech of that language. This transducer can be implemented as the composition of different transducers, each performing a specific mapping task. The whole task can be implemented by FST chains- One FST for rule based grapheme-phoneme mapping, another FST for implementing schwa addition depending on the context and so on.

Grapheme to phoneme (g2p) correspondence may not be always one-to-one. If the orthography (writing system) of a language is phonemic, then its g2p conversion would have been straightforward. Malayalam, like other indic languages has mostly phonemic orthography unlike English which is non-phonemic. The g2p mapping of malayalam requires  certain contextual rules to be applied to handle schwa addition at beginning/end/middle of words depending on the presence of chillus and virama, phonetic changes that occur in the context of certain sequence of consonants, contextual nasalisation etc. It is usually required that the process is bidirectional. Ie., the grapheme to phoneme correspondence (GPC) system should be able to retrieve the orthographic representation of the language in the native script from the  phonetic sequence.
Malayalam GPC using FST

The chain of transducers used din this system and their function are listed below:

### Syllablizer

`$wordfilter$`

This is the first level transducer which accepts malayalam scripts and add <BoW> and <EoW> word wrapping tags before further processing. Special characters are passed as such through this first stage transducer.

_TODO:Provisions to accept malayalam/arabic numerals, archaic malayalam characters, latin text etc. Currently it assumes what is given as input is a word. It will act as word splitter in future_

`$syllable$`

It splits syllables with <BoS> <EoS> tags to indicate beginning and end of syllables respectively for words input to it with <BoW> and <EoW> tags

*`$syllablizer$` is a composition of `$wordfilter$` and `$syllable$`*

### FST for g2p mapping

*g2p mapping is done on syllable splitted words. So `$syllablizer$` is a prerequisite for g2p processing.`$g2p$` is composed of the followings FSTs*

`$IPAmap$`

This transducer accepts inputs from the output of  previous transducer and performs the IPA mapping. During this process along with associating graphemes to phonemes, tags are added to indicate if it is a pure vowel, a vowel sign or a consonant. The tags added by this transducer are:
`<virama>` `<vowel>` `<v_sign>` `<visaraga>` `<anuswara>` `<c_velar>` `<c_palatal>` `<c_retroflex>` `<c_dental>` `<c_alveolar>` `<c_labial>` `<c_other>` `<chil>`


The malayalam script assumes every consonant if not followed by a virama, has the inherent vowel associated with it. But this FST **does not** associate the inherent vowel to every consonant. But presence of a virama is clearly indicated using a tag `<virama>` for further processing. Only atomic chillus are accepted by the system and `<chil>` tag added.

`$schwa$`

Inherent vowel has to be added to all consonants if it is at `<EoS>` or when it is followed by `<anuswara>` or `<visarga>`.

This context is identified and schwa addition is done along with a `<schwa>` tag.

_TODO: Presence of any special character including space, period, comma, exclamation mark etc to be identified and schwa addition to be done. Inherent vowel takes a special for certain graphemes at the `<BoW>`. This has to be handled.Eg- രമ്യ - രെമ്യ , ഇല - എല_

`$tta_nta$`

The unicode sequence `റ+ ് + റ` has a special phonetic mapping `(ṯṯ)` which is different from the phonetic representation `(r)` of `റ` .

Similar is the case with `ന + ് + റ` . Its phonetic mapping is `(nṯ)` which is much different from the mapping of `ന(n̪)` or `റ(r)`.

This stage of FST replaces the already mapped റ+ ് + റ `r<c_other><virama>r<c_other>` to `ṯṯ<c_other>` and  ന + ് + റ `<c_dental><virama>r<c_other>` to `nṯ<c_other>`.

*TODO:ന in malayalam script is a special character which may behave as dental or alveolar consonat depending on the context. As of now it is mapped to dental `n̪<c_dental>`. Contextual rule has to be added to replace it with `n<c_alveolar>` whenever needed.*

### FST for contextual nasalisation( അനുനാസികാതിപ്രസരം)

_TODO: ഭംഗി -> ഭങ്ങി , ചിഹ്നം -> ചിന്നം_

### Overall FST chain

`$g2p$` represents the overall FST which combines each of the above FSTs in a chain.

# Installation
You need Helsinki Finite-State Transducer Technology (HFST) (http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/) to compile and use this analyzer. The Makefile provided compiles all the sources and produces the binary FSA `PhoneAnalyser.a`.

In a debian/ubuntu based GNU/Linux, SFST can be installed as follows

```$ sudo apt install hfst```

Clone or download this git repository to your machine.

```$ make```

# Examples

## Syllablize a Malayalam Word

The following command will generate IPA sequence from malayalam script

`python3 syllablizer.py`

For the input

`സഫലമീയാത്ര`

the output would be

`<BoS>സ<EoS><BoS>ഫ<EoS><BoS>ല<EoS><BoS>മീ<EoS><BoS>യാ<EoS><BoS>ത്ര<EoS>`

This command can take input from a text file and write the generated IPA to another text file

`python3 syllablizer.py -i path/to/inputfile.txt -o path/to/outputfile.txt`

## g2p conversion for Malayalam. Malayalam script would be turned to syllablized IPA sequence along with detailed phonetic feature tag

To **generate** the phonetic mapping of malayalam script in IPA along with the details of all vowels, vowelsigns, type of consonant etc. as tags, use the following command:

`$ python3 python/g2p.py -g`

Give your input in malayalam script and press Enter key.

`കാവ്യ!`

It will give you the result

`<BoS>k<velar>aː<v_sign><EoS><BoS>ʋ<other><virama>j<other>a<schwa><EoS>!`


To **analyse** the phonetic script along with the tags to obtain malayalam script represenatation use the command:

`python3 python/g2p.py -a`

Give the input and press Enter.

`BoS>p<labial>aː<v_sign><EoS><BoS>l<chil><EoS>`

It will return you the corresponding malayalam script

`പാൽ`

The command line interface allows to read from a text file and write the result of analysis or generation to a text file.

`python3 python/g2p.py -a -i path/to/inputfile.txt -o path/to/outputfile.txt`

Here `path/to/outputfile.txt` contains the IPA along with tags. The result of its analysis is written to `path/to/outputfile.txt`


# References
1. Open morphology for Finnish https://github.com/flammie/omorfi
1. Malyalam morphological analyser using finite state transducers https://github.com/santhoshtr/mlmorph
1. The Festvox Indic Frontend for Grapheme-to-Phoneme Conversion  https://www.parlikar.com/files/aup_wildre_2016.pdf
1. Malayalam Phonetic Archive by THUNCHATH EZHUTHACHAN MALAYALAM UNIVERSITY http://www.cmltemu.in/phonetic/#/
1. IPA and sounds http://www.internationalphoneticalphabet.org/ipa-sounds/ipa-chart-with-sounds/
