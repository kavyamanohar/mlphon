#include "alphabets.fst"

$vowel$ = [#vowel#][#anuswara##visarga#]? % അ അം ഇം അഃ .
$chillu$ = [#chillu#] %ൽ ൻ ൾ
$cv$ = [#consonant#] [#vowelsign#]?[#anuswara##visarga#]? %ക കി ദുഃ ജം വൈ

$c_virama$ = [#consonant#][#virama#] %It is not a syllable but a part of many conjunts and word end syllables.
$conjunct$ = $c_virama$+ $cv$  % ക്ഷ ഗ്ദ്ധ ന്നു ദ്ധി  ഭ്രം

$word_with_virama_at_end$ = [<BoW>] [#ml_letter#]+ [#virama#] <>:<em> [<EoW>] %Word-end Virama indicated by end marker tag <em>
% eg സന്തോഷ് -> സന്തോഷ്<em>, ആപ്പ് -> ആപ്പ്<em>
$c_virama_wordend$ = $c_virama$+ <em>:<>  %Select those conjuntcs with virama at word ends and removes <em> tag

$syllable$ = $vowel$ | $chillu$ | $cv$ | $conjunct$ |  $c_virama_wordend$

$word$ = [<BoW>] (<>:<BoS> $syllable$ <>:<EoS>)*  [<EoW>]

$tests$ = <BoW> (കല | അൻവർ | ഹയ്യോ\! | കരിഷ്മ | സന്തോഷ് | ആപ്പ് ) <EoW>
( $tests$ || $word_with_virama_at_end$ | $tests$ ) ||  $word$ >> "syllable.test.a"


$word$ = $word$ | ($word_with_virama_at_end$ || $word$  )
$word$
