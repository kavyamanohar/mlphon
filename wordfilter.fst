#include "alphabets.fst"

% Adding beginning and end tags for words
$wordfilter$ = <>:<BoW> ([#letters#])* <>:<EoW>

% It does not identify words.
% For now it simply assumes words are entered one by one
$test$ = കല | അൻവർ | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | അംബുജം | ദുഃഖം |അതിനു് | വാൖവേമായം | എനിക്കു് | എനിയ്ക്കു് | ആൔലെറ്റ് 
$test$ || $wordfilter$ >> "wordfilter.test.a"

$wordfilter$
