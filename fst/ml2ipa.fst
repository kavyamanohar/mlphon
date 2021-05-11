$analysis$ = "<analysis.a>"
$tagfilter$ = "<tagfilter.a>"

$ml2ipa$ = $analysis$ || $tagfilter$

$test$ = ആണ്‍ | ആൺ | കല്‍ | അകലം | കോള്‍ ‍| അൻവർ 
$test$ || $ml2ipa$ >> "ml2ipa.test.a"

$ml2ipa$
