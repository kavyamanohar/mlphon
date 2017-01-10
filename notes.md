Planned Workflow
================
1. Define every ml unicode character
2. IPA mapping of every unicode character. Add tags for contextual identification.
3. Contextually modify the mapping (eg.virama or vowelsign after a consonant should remove the implicit അ property of consonants)
4. Contextually modify the mapping (ന്റ റ്റ ന ഹ്മ etc)
5. Contextually modify the mappings (ര at the beginning of a word may be replaced by re instead of ra)
6. Remove all temporary tags
7. return the IPA along with pronounciation information as tags if needded

TODO
====
1. Punctuation
2. Chillu
