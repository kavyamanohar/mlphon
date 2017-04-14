#include "alphabets.fst"

ALPHABET =  [#ml##spl-char#]

$inputfilter1$ = .*
$inputfilter$ = <>:<BoW> $inputfilter1$ <>:<EoW>
$inputfilter$ >> "inputfilter.a"
