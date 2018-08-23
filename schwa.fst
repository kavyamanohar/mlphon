#include "alphabets.fst"

ALPHABET = [#allsymbols#]

% ADD inherent vowel to a consonant if followed by <EoS> tag
$schwa-addition$ = [#IPAconsonants#] <>:a ^-> (__[<EoS>])
$schwa$ =  $schwa-addition$
$schwa$
