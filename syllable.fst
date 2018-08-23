#include "alphabets.fst"

$vowel$ = [#vowel#][#anuswara##visarga#]? % അ അം ഇം അഃ .
$chillu$ = [#chillu#] %ൽ ൻ ൾ
$cv$ = [#consonant#] [#vowelsign#]?[#anuswara##visarga#]? %ക കി ദുഃ ജം വൈ

% It is not a syllable but a part of many conjunts and word end syllables.
$c_virama$ = [#consonant#][#virama#]
$conjunct$ = $c_virama$+ $cv$  % ക്ഷ ഗ്ദ്ധ ന്നു ദ്ധി  ഭ്രം

% Word-end Virama indicated by end marker tag <em>
% eg സന്തോഷ് -> സന്തോഷ്<em>, ആപ്പ് -> ആപ്പ്<em>
$word_with_virama_at_end$ = [<BoW>] [#ml_letter#]+ [#virama#] <>:<em> [<EoW>]

% Select those conjuntcs with virama at word ends and removes <em> tag
$c_virama_wordend$ = $c_virama$+ <em>:<>

$syllable$ = $vowel$ | $chillu$ | $cv$ | $conjunct$ | $c_virama_wordend$

$word$ = [<BoW>] (<>:<BoS> $syllable$ <>:<EoS>)*  [<EoW>]

$syllabalizer$ = $word$ | ($word_with_virama_at_end$ || $word$  )
$tests$ = <BoW> (കല | അൻവർ | ഹയ്യോ\! | കരിഷ്മ | സന്തോഷ് | ആപ്പ് ) <EoW>
$tests$ ||  $syllabalizer$  >> "syllable.test.a"

$syllabalizer$
