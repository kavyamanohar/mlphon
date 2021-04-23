#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$nasaltoalveolar$ = {n̪<nasal><dental>} : {n<nasal><alveolar>}

$alveolar1$ = $nasaltoalveolar$ ^-> (<BoS> __ <virama>[jʋm]) %ന്യായം, ന്യൂനം, അന്വേഷണം, മേന്മ
$alveolar2$ = $nasaltoalveolar$ ^-> (<EoS><BoS> __ [#IPAvowels##schwa#]) % പനി, ആന, മുന, മനോഹരം
$alveolar0$ = $nasaltoalveolar$ ^-> (s<fricative><alveolar><virama>__) % സ്നാനം


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
$alveolar9$ = $gemination$ ^-> ( <BoW><BoS>k<plosive><voiceless><unaspirated><velar>a<inherentvowel><EoS><BoS>__ i) %കന്നി കന്നിക്കൊയ്ത്ത്
%note that അകന്നിരിക്കുക, കന്ന്, ചുകന്നത്  etc. has geminated dental nasal


$alveolarnasal$ = $alveolar1$ || $alveolar2$ || $alveolar3$ || $alveolar4$ ||  $alveolar5$ || $alveolar6$ || $alveolar7$  || $alveolar8$ || $alveolar9$ || $alveolar0$
$alveolarnasal$