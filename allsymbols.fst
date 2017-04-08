#include "alphabets.fst"

ALPHABET = [#allsymbols#]

$inputfilter$ = .*
$inputfilter$ >> "inputfilter.a"
