#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$tta$ = {r<other><virama>r<other>}:{ṯ<alveolar><virama>ṯ<alveolar>} ^-> ([<BoS><virama>] __)
$nta$ = {n̪<dental><virama>r<other>}:{n‍<alveolar><virama>ṯ<alveolar>} ^-> (<BoS> __ )

$tta_nta$ = $tta$ || $nta$
$tta_nta$
