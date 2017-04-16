# Finite State Transducer Based Malayalam  Phonetic Analyser

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

### Entry level FST

`$inputfilter$`

This is the first level transducer which accepts malayalam scripts and add <BoW> and <EoW> word wrapping tags before further processing. Special characters are passed as such through this first stage transducer.

_TODO:Provisions to accept malayalam/arabic numerals, archaic malayalam characters, latin text etc._

### FST for fundamental phonetic map

`$phoneticmap$`

This transducer accepts inputs from the output of  previous transducer and performs the fundamental phonetic mapping. During this process along with associating graphemes to phonemes, tags are added to indicate if it is a pure vowel, a vowel sign or a consonant. The tags added by this transducer are:
`<virama>` `<purevowel>` `<vowelsign>` `<velarconsonant>` `<palatalconsonant>` `<retroflexconsonant>` `<dentalconsonant>` `<alveolarcosonant>` `<labialconsonant>` `<otherconsonant>` `<chil>`


The malayalam script assumes every consonant if not followed by a virama, has the inherent vowel associated with it. But this FST **does not** associate the inherent vowel to every consonant. But presence of a virama is clearly indicated using a tag <virama> for further processing. Both atomic and traditional chillu are accepted by the system and <chillu> tag added.

### FST for contextual phonetic replace

`$phoneticreplace$`

The unicode sequence `റ+ ് + റ` has a special phonetic mapping `(ṯṯ)` which is different from the phonetic representation `(r)` of `റ` .

Similar is the case with `ന + ് + റ` . Its phonetic mapping is `(nṯ)` which is much different from the mapping of `ന(n̪)` or `റ(r)`.

This stage of FST replaces the already mapped റ+ ് + റ `r<otherconsonant><virama>r<otherconsonant>` to `ṯṯ<otherconsonant>` and  ന + ് + റ `<dentalconsonant><virama>r<otherconsonant>` to `nṯ<otherconsonant>`.

_TODO:ന in malayalam script is a special character which may behave as dental or alveolar consonat depending on the context. As of now it is mapped to dental `n̪<dentalconsonant>`. Contextual rule has to be added to replace it with `n<alveolarcosonant>` whenever needed._

### FST for contextual nasalisation( അനുനാസികാതിപ്രസരം)

_TODO: ഭംഗി -> ഭങ്ങി , ചിഹ്നം -> ചിന്നം_

### FST for shwa addition

`$inherentvoweladd$`

Inherent vowel has to be added to all consonants if it is followed by another consonant or if it is at the end of word. End of word is identified by `<EoW>` tag or the presence of any special character including space, period, comma, exclamation mark etc. This context is identified and schwa addition is done along with an `<inherentvowel>` tag.

_TODO:Inherent vowel takes a special for certain graphemes at the <BoW>. This has to be handled.Eg- രമ്യ - രെമ്യ , ഇല - എല_

### FST for tag removal

`$removetags$`

Certain tags were added to identify the exact context for processing. Once all processing is done, the tags like `<BoW>` and `<EoW>` may be removed .
_TODO:The code has to be rewritten to ensure lossless untagging._

### Overall FST chain

`$ml-g2p$` represents the overall FST which combines each of the above FSTs in a chain.

# Installation
You need Helsinki Finite-State Transducer Technology (HFST) (http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/) to compile and use this analyzer. The Makefile provided compiles all the sources and produces the binary FSA ‘g2p.a'.

In a debian/ubuntu based GNU/Linux, SFST can be installed as follows

```$ sudo apt install hfst```

Clone or download this git repository to your machine.

```$ make```

# Examples

To **generate** the phonetic mapping of malayalam script in IPA, use the following command:

`$ python3 python/mlg2p.py -g -f g2p.a`

Give your input in malayalam script and press Enter key.

`കാവ്യ`

It will give you the result

`കാവ്യ   <BoW>k<velarconsonant>aː<vowelsign>ʋ<otherconsonant><virama>ja<inherentvowel><otherconsonant><EoW>`

If the input is:

`മലയാളം കേരളത്തിന്റെ മാതൃഭാഷ`

The result is:

`മലയാളം കേരളത്തിന്റെ മാതൃഭാഷ         <BoW>ma<inherentvowel><labialconsonant>la<inherentvowel><otherconsonant>j<otherconsonant>aː<vowelsign>ɭ<otherconsonant>am<vowelsign> k<velarconsonant>eː<vowelsign>ɾa<inherentvowel><otherconsonant>ɭa<inherentvowel><otherconsonant>t̪<dentalconsonant><virama>t̪<dentalconsonant>i<vowelsign>nṯ<otherconsonant>e<vowelsign> m<labialconsonant>aː<vowelsign>t̪a<inherentvowel><dentalconsonant>rɨ<vowelsign>bʱ<labialconsonant>aː<vowelsign>ʂa<inherentvowel><otherconsonant><EoW>`

To **analyse** the phonetic script along with the tags to obtain malayalam script represenatation use the command:
`python3 python/mlg2p.py -a  -f g2p.a`

Give the input and press Enter.

`<BoW>bʱ<labialconsonant>aː<vowelsign>ʋa<inherentvowel><otherconsonant>d̪<dentalconsonant>iː<vowelsign>p<labialconsonant><virama>t̪<dentalconsonant>i<vowelsign><EoW>`

It will return you the corresponding malayalam script

`<BoW>bʱ<labialconsonant>aː<vowelsign>ʋa<inherentvowel><otherconsonant>d̪<dentalconsonant>iː<vowelsign>p<labialconsonant><virama>t̪<dentalconsonant>i<vowelsign><EoW>	ഭാവദീപ്തി`



# References
1. Open morphology for Finnish https://github.com/flammie/omorfi
1. Malyalam morphological analyser using finite state transducers https://github.com/santhoshtr/mlmorph
1. The Festvox Indic Frontend for Grapheme-to-Phoneme Conversion  https://www.parlikar.com/files/aup_wildre_2016.pdf
