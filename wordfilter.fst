#include "alphabets.fst"

$wordfilter$ = <>:<BoW> ([#ml_letter##punct#])* <>:<EoW> %Adding beginning and end tags for words
%It does not identify words. For now it simply assumes words are entered one by one
$test$ = കല | അൻവർ | ഹയ്യോ\! | കരിഷ്മ | സന്തോഷ് | ആപ്പ്
$test$ || $wordfilter$ >> "wordfilter.test.a"

$wordfilter$
