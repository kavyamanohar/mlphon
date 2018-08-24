#include "alphabets.fst"

ALPHABET = [#allsymbols#]

% ADD inherent vowel to a consonant if followed by <EoS> tag
$schwa-addition1$ = [#IPAconsonants#] <>:{a<schwa>} ^-> (__ <EoS>)
$schwa-addition2$ = [#IPAconsonants#] <>:{a<schwa>} ^-> (__ m <anuswara>)
$schwa-addition3$ = [#IPAconsonants#] <>:{a<schwa>} ^-> (__ <visarga>)

$schwa$ =  $schwa-addition1$ || $schwa-addition2$ || $schwa-addition3$
$schwa$
