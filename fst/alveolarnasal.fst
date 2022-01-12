#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$nasaltoalveolar$ = {n̪<nasal><dental>} : {n<nasal><alveolar>}

$alveolar1$ = $nasaltoalveolar$ ^-> (<BoS> __ <virama>[jʋm]) %ന്യായം, ന്യൂനം, അന്വേഷണം, മേന്മ
$alveolar2$ = $nasaltoalveolar$ ^-> (<EoS><BoS> __ [#IPAvowels##schwa#]) % പനി, ആന, മുന, മനോഹരം
$alveolar3$ = $nasaltoalveolar$ ^-> ([kɡʱpmʃs][#consonanttags#]*<virama>__) % പ്രശ്നം, ക്നാനായ, സ്നേഹം, വിഘ്നം, സ്വപ്നം, നിമ്നം

% Gemination ന്ന becomes alveolar in the contexts
% അന്നം, ഉൽപ്പന്നം, ഉന്നതം, ഉന്നം, എന്നെ, കന്നഡ, കന്നാസ്, കന്നി
% ചെന്നി, പൊന്ന്, പുന്നപ്ര, പിന്നണി, ഭിന്നം,  മുന്നറിയിപ്പ്,  മന്നൻ, മുന്നണി, മുന്നോക്കം,
% സമ്പന്നം,  സന്നദ്ധം, സാന്നിദ്ധ്യം, സന്നിധാനം,
$gemination$ = {n̪<nasal><dental><virama>n̪<nasal><dental>} : {n<nasal><alveolar><virama>n<nasal><alveolar>}

$alveolar_gem1$ = $gemination$ ^-> ( <BoS>s<fricative><alveolar>a<inherentvowel><EoS><BoS>__ [#IPAvowels#]) % സന്നി, സന്നിധാനം, പ്രസന്ന
$alveolar_gem2$ = $gemination$ ^-> ( <BoS>s<fricative><alveolar>aː<v_sign><EoS><BoS>__ [#IPAvowels#])  % സാന്നിദ്ധ്യം
$alveolar_gem3$ = $gemination$ ^-> ( <BoS>u<vowel><EoS><BoS>__ [#IPAvowels#]) % ഉന്നതി, ഉന്നം
$alveolar_gem4$ = $gemination$ ^-> ( <BoS>bʱ<plosive><voiced><aspirated><labial>i<v_sign><EoS><BoS>__ [#IPAvowels#]) % ഭിന്നം, വിഭിന്ന
$alveolar_gem5$ = $gemination$ ^-> ( m<nasal><labial>i<v_sign><EoS><BoS> __ [#IPAvowels##schwa#] ) % മിന്ന്, മിന്നൽ. Fails for പോകാമിന്നലെ 
$alveolar_gem6$ = $gemination$ ^-> ( m<nasal><labial><virama>p<plosive><voiceless><unaspirated><labial>a<inherentvowel><EoS><BoS> __ [#IPAvowels#] ) % സമ്പന്നൻ
$alveolar_gem7$ = $gemination$ ^-> ( <BoW><BoS>k<plosive><voiceless><unaspirated><velar>a<inherentvowel><EoS><BoS>__ i) %കന്നി കന്നിക്കൊയ്ത്ത്
%note that അകന്നിരിക്കുക, കന്ന്, ചുകന്നത്  etc. has geminated dental nasal
$alveolar_gem8$ = $gemination$ ^-> (<BoW><BoS>k<plosive><voiceless><unaspirated><velar>i<v_sign><EoS><BoS>__) %കിന്നാരം, not എനിക്കിന്ന്
$alveolar_gem9$ = $gemination$ ^-> (<BoS>kʰ<plosive><voiceless><aspirated><velar>i<v_sign><EoS><BoS>__) % ഖിന്നം

$gemination_dual$ =  {n̪<nasal><dental><virama>n̪<nasal><dental>} : {n<nasal><alveolar><virama>n<nasal><alveolar>} | n̪<nasal><dental><virama>n̪<nasal><dental>

$alveolar_dual1$ = $gemination_dual$ ^-> (<BoS>e<vowel><EoS><BoS>__aː<v_sign>[#boundarytags#]*l) % എന്നാൽ, എന്നാലാകും
$alveolar_dual2$ = $gemination_dual$ ^-> (<BoS>n̪<nasal><dental>i<v_sign><EoS><BoS>__aː<v_sign>[#boundarytags#]*l) % നിന്നാൽ, നിന്നാലാകുമോ

$alveolarnasal$ = $alveolar1$ || $alveolar2$ || $alveolar3$ || $alveolar_gem1$ || $alveolar_gem2$ ||  $alveolar_gem3$ || $alveolar_gem4$ || $alveolar_gem5$  || $alveolar_gem6$ || $alveolar_gem7$  || $alveolar_gem8$ || $alveolar_gem9$ || $alveolar_dual1$ || $alveolar_dual2$
    
$alveolarnasal$