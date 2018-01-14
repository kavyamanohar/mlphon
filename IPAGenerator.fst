%Removes all the phonetic and miscellaneous tags. Never use this in analysis mode
#include "alphabets.fst"
ALPHABET = [#spl-char##IPA#] [#phonetags##misc-tags#]:<>
"<PhoneAnalyser.a>" || .* 
