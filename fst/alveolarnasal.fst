#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$alveolar1$ = {n̪<nasal><dental>}:{n<nasal><alveolar>} ^-> (<BoS> __ <virama>[jʋm]) %ന്യായം, ന്യൂനം, അന്വേഷണം, മേന്മ
$alveolar2$ = {n̪<nasal><dental>}:{n<nasal><alveolar>} ^-> (<EoS><BoS> __ [#IPAvowels#]) % പനി, ആന, മുന, മനോഹരം

% Gemination ന്ന becomes alveolar is the contexts
% അന്നം, ഉൽപ്പന്നം, ഉന്നതം, ഉന്നം, എന്നെ, കന്നഡ, കന്നാസ്, കന്നി
% ചെന്നി, പൊന്ന്, പുന്നപ്ര, പിന്നണി, ഭിന്നം,  മുന്നറിയിപ്പ്,  മന്നൻ, മുന്നണി, മുന്നോക്കം,
% സമ്പന്നം,  സന്നദ്ധം, സാന്നിദ്ധ്യം, സന്നിധാനം,

$alveolar3$ = {n̪<nasal><dental><virama>n̪<nasal><dental>} : {n<nasal><alveolar><virama>n<nasal><alveolar>} ^-> (<BoS>s<fricative><alveolar>a<inherentvowel><EoS><BoS> __ [#IPAvowels#]) % സന്നി, സന്നിധാനം
$alveolar4$ = {n̪<nasal><dental><virama>n̪<nasal><dental>} : {n<nasal><alveolar><virama>n<nasal><alveolar>} ^-> (<BoS>s<fricative><alveolar>aː<v_sign><EoS><BoS> __ [#IPAvowels#]) % സാന്നിദ്ധ്യം
$alveolar5$ = {n̪<nasal><dental><virama>n̪<nasal><dental>} : {n<nasal><alveolar><virama>n<nasal><alveolar>} ^-> (<BoS>u<vowel><EoS><BoS> __ [#IPAvowels#]) % ഉന്നതി, ഉന്നം


$alveolarnasal$ = $alveolar1$ || $alveolar2$ || $alveolar3$ || $alveolar4$ || $alveolar5$
$alveolarnasal$
