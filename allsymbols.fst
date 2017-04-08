#include "alphabets.fst"

ALPHABET =  [#allsymbols#]

$inputfilter1$ = .*
$inputfilter$ = <>:<BoW> $inputfilter1$ <>:<EoW>
$inputfilter$ >> "inputfilter.a"
