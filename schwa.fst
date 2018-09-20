#include "alphabets.fst"
ALPHABET = [#allsymbols#]

% ADD inherent vowel to a consonant
% if followed by <EoS> tag or virama or visaraga
$schwa-addition1$ = [#IPAconsonants#] [#consonanttags#]+ <>:{a<schwa>} ^-> (__ <EoS>)
$schwa-addition2$ = [#IPAconsonants#] [#consonanttags#]+ <>:{a<schwa>} ^-> (__ m <anuswara>)
$schwa-addition3$ = [#IPAconsonants#] [#consonanttags#]+ <>:{a<schwa>} ^-> (__ <visarga>)

$schwa$ =  $schwa-addition1$ || $schwa-addition2$ || $schwa-addition3$
$schwa$
