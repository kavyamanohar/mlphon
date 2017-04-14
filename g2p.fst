#include "allsymbols.fst"
#include "phoneticmap.fst"
#include "phoneticreplace.fst"
#include "inherentvoweladd.fst"
%#include "removetags.fst"

$inputfilter$  || $phoneticmap$ || $phoneticreplace$ || $inherentvoweladd$ % || $removetags$
