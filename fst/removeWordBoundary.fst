#include "alphabets.fst"

$removetag_bow$ = <BoW>:<> [#allsymbols#]*
$removetag_eow$ = [#allsymbols#]*  <EoW>:<>

$removeWordBoundary$ = $removetag_bow$ || $removetag_eow$


$tests$ =   <BoW> (കല | അൻവർ | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | അംബുജം |അതിന് |അതിനു |അതിനു് | എനിക്കു് | എനിയ്ക്കു് |ദുഃഖം | വാൖവേമായം | ആക്റ്റ് | ആക്‌റ്റ് | ആൔലെറ്റ്) <EoW>
$tests$ ||  $removeWordBoundary$  >> "removeWordBoundary.test.a"


$removeWordBoundary$
