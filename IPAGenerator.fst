%Removes all the phonetic and miscellaneous tags. Never use this in analysis mode
#include "alphabets.fst"
ALPHABET = [#spl-char##IPA##misc-tags##phonetags#]
$IPAandTags$ = "<g2p.a>"
$remove_phonetictags$ = {[#phonetags##misc-tags#]}:{<>} ^-> ([#IPA##misc-tags##phonetags#] __)
$IPAandTags$ || $remove_phonetictags$
