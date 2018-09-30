#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$tta$ = {r<flapped><alveolar><virama>r<flapped><alveolar>}:{ṯ<plosive><voiceless><unaspirated><alveolar><virama>ṯ<plosive><voiceless><unaspirated><alveolar>} ^-> ([<BoS><virama>] __)
$nta$ = {n̪<nasal><dental><virama>r<flapped><alveolar>}:{n<nasal><alveolar><virama>ṯ<plosive><voiceless><unaspirated><alveolar>} ^-> (<BoS> __ )

$tta_nta$ = $tta$ || $nta$
$tta_nta$
