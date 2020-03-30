#include "alphabets.fst"

$vowel$ = [#vowels#][#anuswara##visarga#]? % അ അം ഇം അഃ .
$chillu$ = [#chillus#] %ൽ ൻ ൾ
$cv$ = [#consonants#] [#vowelsigns#]?[#anuswara##visarga#]? %ക കി ദുഃ ജം വൈ

% It is not a syllable but a part of many conjunts and word end syllables.
$c_virama$ = [#consonants#][#virama#]
$samvruthokaram1$ = [#consonants#][ു][#virama#] % അതിനു്
$samvruthokaram2$ = $c_virama$+ [#consonants#][ു][#virama#] % അവയ്ക്കു്
$conjunct$ = $c_virama$+ $cv$  % ക്ഷ ഗ്ദ്ധ ന്നു ദ്ധി  ഭ്രം
$zwnjboundary$ = $c_virama$+ [#zerowidth#]


% Word-end Virama indicated by adding an end marker tag <em>
% eg സന്തോഷ് -> സന്തോഷ്<em>, ആപ്പ് -> ആപ്പ്<em>
$word_with_virama_at_end$ = [<BoW>] [#letters#]+ [#virama#] <>:<em> [<EoW>]

% Select those conjuntcs with virama at word ends and  samvruthokaram,  removes <em> tag
$c_virama_wordend$ = $c_virama$+ <em>:<>
$samvruthokaram1_wordend$ = $samvruthokaram1$ <em>:<>
$samvruthokaram2_wordend$ = $samvruthokaram2$ <em>:<>

% Passes കല അൻവർ കരിഷ്മ as it is
% Passes സന്തോഷ്<em> ആപ്പ്<em> എനിയ്ക്കു്<em> അതിനു്<em> after removing <em>
% Does not pass സന്തോഷ് ആപ്പ്
$syllable1$ = ($vowel$ | $chillu$ | $cv$ | $conjunct$ | $zwnjboundary$ | $c_virama_wordend$ | $samvruthokaram1_wordend$ | $samvruthokaram2_wordend$ )

% Set of syllables(between word tags) are passed afer adding syllable tag
$word$ = [<BoW>] (<>:<BoS> $syllable1$ <>:<EoS>)* [<EoW>]

% കല pass through $word$
% ആപ്പ്, അതിനു്, അവയ്ക്കു് does not pass through $word$
% But ആപ്പ് അതിനു്, അവയ്ക്കു് passes through $word_with_virama_at_end$ || $word$
$syllable$ = $word$ | ($word_with_virama_at_end$ || $word$  )
$tests$ = <BoW> (കല | അൻവർ | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | അംബുജം |അതിന് |അതിനു |അതിനു് | എനിക്കു് | എനിയ്ക്കു് |ദുഃഖം | സന്തോഷ് ) <EoW>
$tests$ ||  $syllable$  >> "syllable.test.a"
$syllable$
