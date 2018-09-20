#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$tta$ = {r<flapped><other><virama>r<flapped><other>}:{ṯ<plosive><voiceless><unaspirated><alveolar><virama>ṯ<plosive><voiceless><unaspirated><alveolar>} ^-> ([<BoS><virama>] __)
$nta$ = {n̪<nasal><dental><virama>r<flapped><other>}:{n‍<nasal><alveolar><virama>ṯ<plosive><voiceless><unaspirated><alveolar>} ^-> (<BoS> __ )

$tta_nta$ = $tta$ || $nta$
$tta_nta$
