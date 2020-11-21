#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$alveolar1$ = {n̪<nasal><dental>}:{n<nasal><alveolar>} ^-> (<BoS> __ <virama>[jʋm]) %ന്യായം, ന്യൂനം, അന്വേഷണം, മേന്മ
$alveolar2$ = {n̪<nasal><dental>}:{n<nasal><alveolar>} ^-> (<EoS><BoS> __ [#IPAvowels##schwa#]) % പനി, ആന, മുന, മനോഹരം

% Gemination ന്ന becomes alveolar is the contexts
% അന്നം, ഉൽപ്പന്നം, ഉന്നതം, ഉന്നം, എന്നെ, കന്നഡ, കന്നാസ്, കന്നി
% ചെന്നി, പൊന്ന്, പുന്നപ്ര, പിന്നണി, ഭിന്നം,  മുന്നറിയിപ്പ്,  മന്നൻ, മുന്നണി, മുന്നോക്കം,
% സമ്പന്നം,  സന്നദ്ധം, സാന്നിദ്ധ്യം, സന്നിധാനം,
$gemination$ = {n̪<nasal><dental><virama>n̪<nasal><dental>} : {n<nasal><alveolar><virama>n<nasal><alveolar>}

$context1$ = <BoS>s<fricative><alveolar>a<inherentvowel><EoS><BoS> |\  % സന്നി, സന്നിധാനം
            <BoS>s<fricative><alveolar>aː<v_sign><EoS><BoS> |\ % സാന്നിദ്ധ്യം
            <BoS>u<vowel><EoS><BoS> |\ % ഉന്നതി, ഉന്നം
            <BoS>bʱ<plosive><voiced><aspirated><labial>i<v_sign><EoS><BoS> % ഭിന്നം, വിഭിന്ന
$alveolar3$ = $gemination$ ^-> ( $context1$__ [#IPAvowels#])

$context2$ = m<nasal><labial>i<v_sign><EoS><BoS> % മിന്ന്, മിന്നൽ
$alveolar4$ = $gemination$ ^-> ( __ [#IPAvowels##schwa#] ) 

$alveolarnasal$ = $alveolar1$ || $alveolar2$ || $alveolar3$ || $alveolar4$
$alveolarnasal$