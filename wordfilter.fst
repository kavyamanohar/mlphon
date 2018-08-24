#include "alphabets.fst"

% Adding beginning and end tags for words
$wordfilter$ = <>:<BoW> ([#letters# #punct#])* <>:<EoW>

% It does not identify words.
% For now it simply assumes words are entered one by one
$test$ = കല | അൻവർ | ഹയ്യോ\! | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | അംബുജം | ദുഃഖം
$test$ || $wordfilter$ >> "wordfilter.test.a"

$wordfilter$
