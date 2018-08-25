$wordfilter$ = "<wordfilter.a>"
$syllable$ = "<syllable.a>"
$IPAmap$ = "<IPAmap.a>"
$schwa$ = "<schwa.a>"
$tta_nta$ = "<tta_nta.a>"
$removetags$ = "<removetags.a>"

$g2p$ = $wordfilter$ || $syllable$ || $IPAmap$ || $schwa$ || $tta_nta$ || $removetags$
$test$ = കല | അൻവർ | ഹയ്യോ\! | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | എന്റമ്മ | കാറ്റ് | അംബുജം | ദുഃഖം
$test$ || $g2p$ >> "g2p.test.a"

$g2p$
