#include "alphabets.fst"

$vowel$ = [#vowels#][#anuswara##visarga##chillus#]? % അ അം ഇം അഃ അൻ
$cv$ = [#consonants#] [#vowelsigns#]?[#anuswara##visarga##chillus#]? %ക കി ദുഃ ജം വൈ സ്കർ
$c_virama$ = [#consonants#][#virama#] %ക്, ച്: Can be a syllable at word ends. Or part of a syllable
$samvruthokaram$ = $c_virama$* [#consonants#][ു][#virama#] % യ്ക്കു്, അതിനു്: : Can be a syllable at word ends
$conjunct$ = [#dotreph#]? $c_virama$* $cv$  % ക്ഷ ഗ്ദ്ധ ന്നു ദ്ധി  ഭ്രം ക കി ദുഃ ജം വൈ സ്കർ : Stand-alone syllable at any word positions
$zwnjboundary$ = $c_virama$+ [#zerowidth#] % ക്‌റ്റ്

% Word-end Virama indicated by adding an end marker tag <em>
$virama_endmark$ = <BoW> [#letters#]+ [#virama#] <>:<em> <EoW> % eg സന്തോഷ് -> സന്തോഷ്<em>, ആപ്പ് -> ആപ്പ്<em>
% Vowels at word begin indicated by <bm> tag
$vowel_beginmark$ = <BoW> <>:<bm> [#vowels#][#letters#]* <em>? <EoW> % eg അമ്മ -> <bm>അമ്മ, അ -> <bm>അ, 

$c_virama_wordend$ = $c_virama$+ <em>:<> % removes <em> tag from conjuntcs with virama word ends
$samvruthokaram_wordend$ = $samvruthokaram$ <em>:<> % removes <em> tag from conjuncts with  samvruthokaram at word ends
$vowel_wordbegin$ = <bm>:<> $vowel$ % removes <bm> tag from beginning of words with vowel

% Passes കല കരിഷ്മ as it is
% Passes സന്തോഷ്<em> <bm>ആപ്പ്<em> <bm>എനിയ്ക്കു്<em> <bm>അതിനു്<em> after removing <em> and <bm> tags
% Does not pass സന്തോഷ് ആപ്പ് എനിയ്ക്കു് അതിനു്
$syllable1$ = ($vowel_wordbegin$ | $conjunct$ | $zwnjboundary$ | $c_virama_wordend$ | $samvruthokaram_wordend$)

% Set of syllables(between word tags) are passed afer adding syllable tag
$word$ = <BoW> (<>:<BoS> $syllable1$ <>:<EoS>)* <EoW>

% കല pass only through $word$
% ആപ്പ് അതിനു്, അവയ്ക്കു് pass only through $virama_endmark$ || $vowel_beginmark$ || $word$
% പാല്, സന്തോഷ് pass only through $virama_endmark$ || $word$
% എന്റെ, അവിടെ pass only through $vowel_beginmark$ || $word$
$syllable$ = $word$ | ($virama_endmark$ || $vowel_beginmark$ || $word$) | ($vowel_beginmark$ || $word$) | ($virama_endmark$ || $word$)

$tests$ = <BoW> (കല | അ | അൻവർ | കരിഷ്മ | സന്തോഷ് | ആപ്പ് | അംബുജം |അതിന് |അതിനു |അതിനു് | എനിക്കു് | എനിയ്ക്കു് |ദുഃഖം | വാൖവേമായം | ആക്റ്റ് | ആക്‌റ്റ് | ആൔലെറ്റ്) <EoW>
$tests$ ||  $syllable$  >> "syllable.test.a"

$syllable$
