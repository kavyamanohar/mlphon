Planned Workflow
================
1. Define every ml unicode character
1. IPA mapping of every ml unicode character. Add tags for contextual identification.
1. Contextually modify the mapping (eg.consonant or EoW after a consonant should add the implicit അ property of consonants)
1. Contextually modify the mapping (ന്റ റ്റ ന ഹ്മ etc)
1. Contextually modify the mappings (ര at the beginning of a word may be replaced by re instead of ra)
1. Remove all temporary tags
1. return the IPA along with pronounciation information as tags if needded

TODO
====
1. Analyze/Generate all possible punctuation marks and their tags
1. Define rarely used ml code points like DOT REPH, ALVEOLAR NA, malayalam numerals, datemark, malayalam numerals etc
1. Contextual modification of above characters phonetic mapping


Graphical Visualization
===============

hfst-fst2txt -i ml2ipa.test.a  -f dot -o ml2ipa.test.dot
dot -Tpng ml2ipa.test.dot -o ml2ipa.png
