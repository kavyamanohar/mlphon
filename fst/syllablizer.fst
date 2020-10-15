$wordfilter$ = "<wordfilter.a>"
$syllable$ = "<syllable.a>"
$removeWordBoundary$ = "<removeWordBoundary.a>"


$test$ =  കല | അൻവർ | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | എന്റമ്മ | കാറ്റ് | അംബുജം | അതിനു് | എനിക്കു് | എനിയ്ക്കു് | ദുഃഖം | ആക്റ്റ് | ആക്‌റ്റ് | ആൔലെറ്റ് | വാൖവേമായം
$syllablizer$ = $wordfilter$ || $syllable$ || $removeWordBoundary$
$test$ || $syllablizer$ >> "syllablizer.test.a"

$syllablizer$
