#include "alphabets.fst"

$removetag_bow$ = <BoW>:<> [#allsymbols#]*
$removetag_eow$ = [#allsymbols#]*  <EoW>:<>
$removeWordBoundary$ = $removetag_bow$ || $removetag_eow$
$removeWordBoundary$
