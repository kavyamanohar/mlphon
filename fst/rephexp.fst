#include "alphabets.fst"
ALPHABET = [#allsymbols#]

% ക്ര: <BoS>k<plosive><voiceless><unaspirated><velar><virama>r<trill><alveolar>a<inherentvowel><EoS> 
% ഗ്ര: <BoS>ɡ<plosive><voiced><unaspirated><velar><virama>ɾ<flapped><alveolar>a<inherentvowel><EoS>

$reph_exp1$ =  {r<trill>}:{ɾ<flapped>} ^-> (ɡ<plosive><voiced><unaspirated><velar><virama>__ )
$reph_exp2$ =  {r<trill>}:{ɾ<flapped>} ^-> (d̪<plosive><voiced><unaspirated><dental><virama>__ )


$rephexp$ =  $reph_exp1$ || $reph_exp2$
$rephexp$