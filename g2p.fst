#include "allsymbols.fst"
#include "phoneticmap.fst"
%#include "phoneticreplace.fst"
#include "inherentvoweladd.fst"

$inputfilter$ || $phoneticmap$ || $inherentvoweladd$
