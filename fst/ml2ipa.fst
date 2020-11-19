$analysis$ = "<analysis.a>"
$tagfilter$ = "<tagfilter.a>"

$ml2ipa$ = $analysis$ || $tagfilter$

$test$ = കല | അൻവർ | ഹയ്യോ\! | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | എന്റമ്മ | കാറ്റ് | അംബുജം | ദുഃഖം |അതിനു |അതിനു് | എനിക്കു് | എനിയ്ക്കു് 
$test$ || $ml2ipa$ >> "ml2ipa.test.a"

$ml2ipa$
