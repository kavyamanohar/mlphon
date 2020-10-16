# Nature of Malayalam Alphabets

Malayalam belongs to the family of [Brahmic](https://en.wikipedia.org/wiki/Brahmic_scripts) writing systems that is  [alphasyllabary](https://en.wikipedia.org/wiki/Abugida) in nature. In this writing system consonant–vowel sequences are written as a unit; each unit is based on a consonant letter, and vowel notation is secondary.

1. There are independent notations for vowels (eg: അ /a/, ഈ /iː/)
    - Short vowels (/a/ )
    - Long vowels (/iː/)
    - Diphthongs (/ai̯/)
2. Independent consonant *without* a vowel sign following them has the inherent vowel /a/ associated with them. (eg: ക /ka/ )
3. There are vowel signs (diacritics) following a consonant (eg: കി /ki/, കെ /ke/) to indicate the vowel sounds. These signs (eg: ി, െ) do not have independent existence without a consonant preceding them. A vowel sign automatically removes the inherent vowel associated with the consonant.
4. The special diacritic called 'chandrakkala' or 'virama' (്) following a consonant has the function of removing the inherent vowel.
    - Consonant clusters or conjuncts are formed by joining the consonants with virama in between. (eg: ക/ka/+്+ഷ/ʂa/ -> ക്ഷ /kʂa/. Note the removal of /a/ sound in /ka/). 
    - But virama at word ends, do not make abrupt consonantal ending to the word, instead introduces the medial vowel 'schwa'. (eg: വാക്ക് /ʋaːkkə/) and is called 'Samvruthokaram'. Native Malayalam speakers introduce this word end 'schwa', even when pronouncing English word like 'Bus' as /basə/.
5. There are special consonant characters in Malayalam, that have no inherent vowel associated with them. They are called 'Chillus'. ( eg: ൽ /l/, ൻ /n/, ർ /r/)
6. There are other diacritics like Anuswara, (ം) and Visarga (ഃ) with sounds of /m/ and /h/ respectively.

Consonantal Sounds in Malayalam and their IPA
=============================================

| Position→→ Manner↓|Bilabial|Labiodental|Dental|Alveolar|Postalveolar | Retroflex|Palatal|Velar|Glottal|
|---                 |---     |---        |---   |---     |---          |---       |---    |---  |---    |
|Unaspirated Plosives|p      b|           |t̪    d̪|t      d|             |ʈ        ɖ|c      ɟ|k   ɡ|       |
|Aspirated Plosives  |pʰ     bʰ|          |t̪ʰ   d̪ʰ|        |             |ʈʰ      ɖʰ|cʰ    ɟʰ|kʰ  ɡʰ|       |
|Nasals              |m       |          |n̪      |n       |             |ɳ         |ɲ      |ŋ    |       |
|Trill               |        |          |       |r       |             |          |       |     |       |
|Tap                 |        |          |       |ɾ       |             |          |       |     |       |
|Fricative           |        |f         |       |s       |             |ʂ         |ɕ      |     |h      |
|Approximant         |        |         ʋ|       |        |             |ɻ         |j      |     |       |
|Lateral Approximant |        |          |       |l       |             |ɭ         |       |     |       |


Vowel Sounds in Malayalam and their IPA
=======================================

## Short Vowels

|         |front|central|back|
|---      |---  |---    |--- |
|close    |i    |       |u   |
|close-mid|e    |       |o   |
|mid      |     |       |    |
|open     |a    |       |    |

## Long Vowels

|         |front|central|back|
|---      |---   |---    |--- |
|close    |iː    |       |uː  |
|close-mid|eː    |       |oː  |
|mid      |      |       |    |
|open     |aː    |       |    |

## Diphthongs

/ai/ /au/

## Vocalics

/rɨ/ /rɨː/ /lɨ/ /lɨː/

IPA mapping of all Malayalam characters
=====================================

Finite State Transducers for Phonetic Analysis
==================================

## Define Alphabets and Tags

## Identify Malayalam Words

## Identify and split to Malayalam Syllables

- Syllable definition in Malayalam

## Initial IPA mapping along with tags

- No inherent vowel added in this stage

## Contextual substitution 1: Adding Inherent Vowel, Schwa

- See മ: നമോ, നമഃ, നമ്മൾ, സമം
- അവന് 

## Contextual substitution 2: Conjuncts of alveolar plosives

- റ്റ, ന്റ

## Contextual substitution 3: Reph sign of ്ര

- ക്ര, ഗ്ര

## Contextual substitution 4: Dot Reph sign ൎ

- ചൎക്ക, ഭാൎയ

## Contextual substitution 5 : Word medial/end voicing

- കട, അകം
- തുടൽ, പന്തയം

## Contextual Substitution 6: അനുനാസികാതിപ്രസരം

- ബ്രഹ്മം , ചിഹ്നം, ഭംഗി, സന്ദിഗ്ധം, 

## Contextual Substitution 7 : /a/ -> /e/ transitions

- ജയ, ബലം, രമ്യ

## Alvelar and dental nasal disambiguation

- പന, നമ്മൾ, എന്നാൽ, നമ്പർ, നനഞ്ഞു, ന്യായം, സേനാനായകൻ

## Gemination after Visargam

- ദുഃഖം

## Non- native words and sounds

- ഫാൻ, ഫോൺ






<!-- ## Planned Workflow
1. Define every ml unicode character
1. IPA mapping of every ml unicode character. Add tags for contextual identification.
1. Contextually modify the mapping (eg.consonant or EoW after a consonant should add the implicit അ property of consonants)
1. Contextually modify the mapping (ന്റ റ്റ ന ഹ്മ etc)
1. Contextually modify the mappings (ര at the beginning of a word may be replaced by re instead of ra)
1. Remove all temporary tags
1. return the IPA along with pronounciation information as tags if needded -->
<!-- 

1. Analyze/Generate all possible punctuation marks and their tags
1. Define rarely used ml code points like DOT REPH, ALVEOLAR NA, malayalam numerals, datemark, malayalam numerals etc
1. Contextual modification of above characters phonetic mapping -->

<!-- 
## Graphical Visualization

hfst-fst2txt -i ml2ipa.test.a  -f dot -o ml2ipa.test.dot
dot -Tpng ml2ipa.test.dot -o ml2ipa.png

## HFST to string

```
hfst-fst2txt -i ml2ipa.test.a
``` -->