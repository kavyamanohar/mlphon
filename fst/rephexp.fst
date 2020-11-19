#include "alphabets.fst"
ALPHABET = [#allsymbols#]

% ക്ര: <BoS>k<plosive><voiceless><unaspirated><velar><virama>r<trill><reph><alveolar>a<inherentvowel><EoS> 
% ഗ്ര: <BoS>ɡ<plosive><voiced><unaspirated><velar><virama>ɾ<flapped><reph><alveolar>a<inherentvowel><EoS>

% Reph exception is added for ഗ്ര, ദ്ര only. 
% Keralapanineeyam says it is to be applied for ജ്ര, ബ്ര, ഡ്ര.
% But author chooses not to, as the modern usages of these conjuncts are mostly in foreign words where pronunciation is close to റ.

$reph_exp1$ =  {r<trill><reph>}:{ɾ<flapped><reph>} ^-> (ɡ<plosive><voiced><unaspirated><velar><virama>__ )
$reph_exp2$ =  {r<trill><reph>}:{ɾ<flapped><reph>} ^-> (d̪<plosive><voiced><unaspirated><dental><virama>__ )


$rephexp$ =  $reph_exp1$ || $reph_exp2$
$rephexp$