#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$tta$ = {r<other><virama>r<other>}:{ṯ<plosive><voiceless><unaspirated><alveolar><virama>ṯ<plosive><voiceless><unaspirated><alveolar>} ^-> ([<BoS><virama>] __)
$nta$ = {n̪<nasal><dental><virama>r<other>}:{n‍<nasal><alveolar><virama>ṯ<alveolar>} ^-> (<BoS> __ )

$tta_nta$ = $tta$ || $nta$
$tta_nta$
