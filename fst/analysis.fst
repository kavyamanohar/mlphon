$wordfilter$ = "<wordfilter.a>"
$syllable$ = "<syllable.a>"
$IPAmap$ = "<IPAmap.a>"
$inherentvowel$ = "<inherentvowel.a>"
$tta_nta$ = "<tta_nta.a>"
$reph$ = "<reph.a>"
$rephexp$ = "<rephexp.a>"
$alveolarnasal$ = "<alveolarnasal.a>"
$schwa$ = "<schwa.a>"
$removeWordBoundary$ = "<removeWordBoundary.a>"

$analysis$ = $wordfilter$ || $syllable$ || $IPAmap$ || $inherentvowel$ || $tta_nta$ || $reph$ || $rephexp$ || $schwa$ || $alveolarnasal$ ||$removeWordBoundary$

$test$ =   കല | അൻവർ | സന്നി | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | എന്റമ്മ | കാറ്റ് | അംബുജം | ദുഃഖം |അതിനു |അതിനു് | എനിക്കു് | എനിയ്ക്കു് | ക്രമം | ന്യായം
$test$ || $analysis$ >> "analysis.test.a"

$analysis$
