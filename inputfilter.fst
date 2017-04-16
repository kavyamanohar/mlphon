#include "alphabets.fst"

ALPHABET =  [#ml##spl-char#]

$inputfilter1$ = .*
$inputfilter$ = <>:<BoW> $inputfilter1$ <>:<EoW> %Adding beginning and end tags
$inputfilter$
