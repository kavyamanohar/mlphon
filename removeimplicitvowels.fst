#mlvowels# = അ ആ ഇ ഈ ഉ ഊ ഋ ൠ ഌ ൡ എ ഏ ഐ ഒ ഓ ഔ അ ം അഃ
#mlvirama# = ്
#mlvowelsign# = ാിീൢൢുൂൃൄൢൣെേൈൊോൗൌംഃ
#mlvelar# = കഖഗഘങ
#mlpalatal# = ച ഛ ജ ഝ ഞ
#mlretroflex# = ട ഠ ഡ ഢ ണ
#mldental# = ത ഥ ദ ധ ന
#mllabial# = പ ഫ ബ ഭ മ
#mlother# = യ ര ല വ ശ ഷ സ ഹ ള ഴ റ
#ml# = #mlvowels##mlvirama##mlvowelsign##mlvelar# #mlpalatal##mlretroflex##mldental##mllabial##mlother#
#IPAvovels# = a aː i iː u uː rɨ rɨː lɨ lɨː e eː ai̯ o oː au̯ am ah
#IPAvelar# = ka kʰa ɡa ɡʱa ŋa
#IPApalatal# = t͡ʃa t͡ʃʰa ɟa ɟʱa ɲa
#IPAretroflex# = ʈa ʈʰa ɖa ɖʱa ɳa
#IPAdental# = t̪a t̪ʰa d̪a d̪ʱa na
#IPAlabial# = pa pʰa ba bʱa ma
#IPAother# = ja ɾa la ʋa ʃa ʂa sa ɦa ɭa ɽa ra
#IPA# = #IPAvovels##IPAvelar# #IPApalatal##IPAretroflex# #IPAdental# #IPAlabial##IPAother#
#viramatag# = <virama>
#purevoweltag#  = <purevowel>
#vowelsigntag# = <vowelsign>
#velarconsonanttag# = <velarconsonant>
#palatalconsonanttag# = <palatalconsonant>
#retroflexconsonanttag# = <retroflexconsonant>
#dentalconsonanttag# = <dentalconsonant>
#labiaalconsonanttag# = <labialconsonant>
#otherconsonanttag# = <otherconsonant>
%#phonecharacteristic# = <unaspirated><voiceless><aspirated><voiced><nasal>

#consonantstag# = #velarconsonanttag# #palatalconsonanttag# #dentalconsonanttag# #labiaalconsonanttag# #otherconsonanttag#
#phonetags# = #purevoweltag# #vowelsigntag# #consonantstag# #viramatag# %#phonecharacteristic#
ALPHABET = [#phonetags# #IPA#]
$removeimplicitvowel$ = ({k}:{ka}|{kʰ}:{kʰa}|{ɡ}:{ɡa}|{ɡʱ}:{ɡʱa}|{ŋ}:{ŋa}) ^-> ( __[#velarconsonanttag#][#viramatag##IPAvovels#])
%$test$ = ka<velarconsonant>ʋa<otherconsonant> | ɡa<velarconsonant><virama> | ɡ<velarconsonant><virama>
%$test$ ||
$removeimplicitvowel$
