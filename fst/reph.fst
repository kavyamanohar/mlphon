#include "alphabets.fst"
ALPHABET = [#allsymbols#]

% ്ര assumes r<trill> everywhere except at ഗ്ര, ദ്ര (exception file is rephexp.fst)
% ക്ര: <BoS>k<plosive><voiceless><unaspirated><velar><virama>r<trill><alveolar>a<schwa><EoS> 
% ഗ്ര: <BoS>ɡ<plosive><voiced><unaspirated><velar><virama>ɾ<flapped><alveolar>a<schwa><EoS>

$rephrule$ = {ɾ<flapped>}:{r<trill>} ^-> (<virama> __)

$reph$ =  $rephrule$
$reph$