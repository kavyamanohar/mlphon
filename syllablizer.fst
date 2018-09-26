$wordfilter$ = "<wordfilter.a>"
$syllable$ = "<syllable.a>"
$removeWordBoundary$ = "<removeWordBoundary.a>"


$test$ =  കല | അൻവർ | ഹയ്യോ\! | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | എന്റമ്മ | കാറ്റ് | അംബുജം | ദുഃഖം

$syllablizer$ = $wordfilter$ || $syllable$ || $removeWordBoundary$
$test$ || $syllablizer$ >> "syllablizer.test.a"

$syllablizer$
