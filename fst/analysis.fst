$wordfilter$ = "<wordfilter.a>"
$syllable$ = "<syllable.a>"
$IPAmap$ = "<IPAmap.a>"
$inherentvowel$ = "<inherentvowel.a>"
$tta_nta$ = "<tta_nta.a>"
$reph$ = "<reph.a>"
$rephexp$ = "<rephexp.a>"
$schwa$ = "<schwa.a>"
$removeWordBoundary$ = "<removeWordBoundary.a>"

$analysis$ = $wordfilter$ || $syllable$ || $IPAmap$ || $inherentvowel$ || $tta_nta$ || $reph$ || $rephexp$ || $schwa$ ||$removeWordBoundary$

$test$ = കല | അൻവർ | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | എന്റമ്മ | കാറ്റ് | അംബുജം | ദുഃഖം |അതിനു |അതിനു് | എനിക്കു് | എനിയ്ക്കു് | ക്രമം
$test$ || $analysis$ >> "analysis.test.a"

$analysis$
