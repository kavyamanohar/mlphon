#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$tta$ = {r<virama>r}:{ṯ<virama>ṯ} ^-> (<BoS>__)
$nta$ = {n̪<virama>r}:{n‍<virama>ṯ} ^-> (<BoS>__)

$tta_nta$ = $tta$ || $nta$
$tta_nta$
