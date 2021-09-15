#include "alphabets.fst"
ALPHABET = [#allsymbols#]

% $plosivetofricative$ = {pʰ<plosive><voiceless><aspirated><labial>} : {f<fricative><labiodental>}

$fricativetoplosive$ = {f<fricative><labiodental>} : {pʰ<plosive><voiceless><aspirated><labial>}

$labiodentalfricative1$ = $fricativetoplosive$ ^-> (<BoW><BoS>__a<inherentvowel><EoS><EoW>) %ഫ

$labiodentalfricative2$ = $fricativetoplosive$ ^-> (__a<inherentvowel><EoS><BoS>l) %ഫലം, നിഷ്ഫലം, ഫലിതം. fails for യൂസഫലി
$labiodentalfricative3$ = $fricativetoplosive$ ^-> (s<fricative><alveolar><virama>__) %സ്ഫോടനം, സ്ഫടികം, സ്ഫുടം. fails for ട്രാൻസ്ഫർ

$labiodentalfricative$ = $labiodentalfricative1$ || $labiodentalfricative2$ || $labiodentalfricative3$
$labiodentalfricative$