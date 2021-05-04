#include "alphabets.fst"
ALPHABET = [#allsymbols#]

% $plosivetofricative$ = {pʰ<plosive><voiceless><aspirated><labial>} : {f<fricative><labiodental>}

$fricativetoplosive$ = {f<fricative><labiodental>} : {pʰ<plosive><voiceless><aspirated><labial>}

$labiodentalfricative1$ = $fricativetoplosive$ ^-> (<BoS>__a<inherentvowel><EoS><EoW>) %ഫ

$labiodentalfricative2$ = $fricativetoplosive$ ^-> (__a<inherentvowel><EoS><BoS>l) %ഫലം, നിഷ്ഫലം, ഫലിതം. fails for യൂസഫലി

$labiodentalfricative$ = $labiodentalfricative1$ || $labiodentalfricative2$
$labiodentalfricative$