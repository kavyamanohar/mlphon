#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$alveolar1$ = {n̪<nasal><dental>}:{n<nasal><alveolar>} ^-> (<BoS> __ <virama>[jʋm]) %ന്യായം, ന്യൂനം, അന്വേഷണം, മേന്മ
$alveolar2$ = {n̪<nasal><dental>}:{n<nasal><alveolar>} ^-> (<EoS><BoS> __ [#IPAvowels##schwa#]) % പനി, ആന, മുന, മനോഹരം

% Gemination ന്ന becomes alveolar is the contexts
% അന്നം, ഉൽപ്പന്നം, ഉന്നതം, ഉന്നം, എന്നെ, കന്നഡ, കന്നാസ്, കന്നി
% ചെന്നി, പൊന്ന്, പുന്നപ്ര, പിന്നണി, ഭിന്നം,  മുന്നറിയിപ്പ്,  മന്നൻ, മുന്നണി, മുന്നോക്കം,
% സമ്പന്നം,  സന്നദ്ധം, സാന്നിദ്ധ്യം, സന്നിധാനം,
$gemination$ = {n̪<nasal><dental><virama>n̪<nasal><dental>} : {n<nasal><alveolar><virama>n<nasal><alveolar>}

$alveolar3$ = $gemination$ ^-> ( <BoS>s<fricative><alveolar>a<inherentvowel><EoS><BoS>__ [#IPAvowels#]) % സന്നി, സന്നിധാനം, പ്രസന്ന
$alveolar4$ = $gemination$ ^-> ( <BoS>s<fricative><alveolar>aː<v_sign><EoS><BoS>__ [#IPAvowels#])  % സാന്നിദ്ധ്യം
$alveolar5$ = $gemination$ ^-> ( <BoS>u<vowel><EoS><BoS>__ [#IPAvowels#]) % ഉന്നതി, ഉന്നം
$alveolar6$ = $gemination$ ^-> ( <BoS>bʱ<plosive><voiced><aspirated><labial>i<v_sign><EoS><BoS>__ [#IPAvowels#]) % ഭിന്നം, വിഭിന്ന
$alveolar7$ = $gemination$ ^-> ( m<nasal><labial>i<v_sign><EoS><BoS> __ [#IPAvowels##schwa#] ) % മിന്ന്, മിന്നൽ. Fails for പോകാമിന്നലെ 
$alveolar8$ = $gemination$ ^-> ( m<nasal><labial><virama>p<plosive><voiceless><unaspirated><labial>a<inherentvowel><EoS><BoS> __ [#IPAvowels#] ) % സമ്പന്നൻ

$alveolarnasal$ = $alveolar1$ || $alveolar2$ || $alveolar3$ || $alveolar4$ ||  $alveolar5$ || $alveolar6$ || $alveolar7$  || $alveolar8$
$alveolarnasal$