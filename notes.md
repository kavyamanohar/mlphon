Planned Workflow
================
1. Define every ml unicode character
1. IPA mapping of every unicode character. Add tags for contextual identification.
1. Contextually modify the mapping (eg.virama or vowelsign after a consonant should remove the implicit അ property of consonants)
1. Contextually modify the mapping (ന്റ റ്റ ന ഹ്മ etc)
1. Contextually modify the mappings (ര at the beginning of a word may be replaced by re instead of ra)
1. Remove all temporary tags
1. return the IPA along with pronounciation information as tags if needded

TODO
====
1. Analyze/Generate all possible punctuation marks and their tags
1. Define rarely used ml code points like DOT REPH, ALVEOLAR NA, malayalam numerals, datemark etc
1. Contextual modification of above characters phonetic mapping
