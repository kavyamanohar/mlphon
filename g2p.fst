$wordfilter$ = "<wordfilter.a>"
$syllable$ = "<syllable.a>"
$IPAmap$ = "<IPAmap.a>"
$schwa$ = "<schwa.a>"
%$phoneticreplace$ = "<phoneticreplace.a>"

$test$ = കല | അൻവർ | ഹയ്യോ\! | കരിഷ്മ | സന്തോഷ് | ആപ്പ്
$test$ || $wordfilter$ || $syllable$ || $IPAmap$ || $schwa$ >> "g2p.test.a"

$wordfilter$ || $syllable$ || $IPAmap$ || $schwa$% || $phoneticreplace$
