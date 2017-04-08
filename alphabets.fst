%DEFINING ALL POSSIBLE INPUT AND OUTPUT ALPHABET SETS

#mlvowel# = അ ആ ഇ ഈ ഉ ഊ ഋ ൠ ഌ ൡ എ ഏ ഐ ഒ ഓ ഔ അം അഃ
#mlvowelsign# =  ാ ി ീ ൢ ൢ ു ൂ ൃ ൄ ൢ ൣ െ േ ൈ ൊ ോ  ൗ ൌ ം ഃ
#mlvirama# = ്

#mlvelar# = ക ഖ ഗ ഘ ങ
#mlpalatal# = ച ഛ ജ ഝ ഞ
#mlretroflex# = ട ഠ ഡ ഢ ണ
#mldental# = ത ഥ ദ ധ ന
#mlalveolar# = ഺ ഩ
#mllabial# = പ ഫ ബ ഭ മ
#mlother# = യ ര ല വ ശ ഷ സ ഹ ള ഴ റ
#mlconsonant# = #mlvelar# #mlpalatal# #mlretroflex# #mldental# #mlalveolar# #mllabial# #mlother#

#mlchilluatomic# =ൺ ൻ ർ ൽ ൾ ൿ
#mlchilluregular# = ണ്‍ ന്‍ ര്‍ ല്‍ ള്‍ ക്‍
#mlchillu# = #mlchilluatomic# #mlchilluregular#

#ml# = #mlvowel#  #mlvowelsign# #mlvirama#  #mlconsonant# #mlchillu#

#space# = {\ }
#spl-char# = {\!}{\,}{\.}{\?}{\:}{\;}

#IPAvowels# = {a} {aː} {i} {iː} {u} {uː} {rɨ} {rɨː} {lɨ} {lɨː} {e} {eː} {ai̯} {o} {oː} {au̯} {am} {ah}

#IPAvelar# = k kʰ ɡ ɡʱ ŋ
#IPApalatal# = t͡ʃ t͡ʃʰ ɟ ɟʱ ɲ
#IPAretroflex# = ʈ ʈʰ ɖ ɖʱ ɳ
#IPAdental# = t̪ t̪ʰ d̪ d̪ʱ n̪
#IPAalvolar# = t n
#IPAlabial# = p pʰ b bʱ m
#IPAother# = j ɾ l ʋ ʃ ʂ s ɦ ɭ ɽ r {ṯṯ} {n‍ṯ}

#IPAconsonants# = #IPAvelar# #IPApalatal##IPAretroflex# #IPAdental# #IPAalvolar##IPAlabial##IPAother#

#IPA# = #IPAvowels# #IPAconsonants#


#purevoweltag#  = <purevowel>
#vowelsigntag# = <vowelsign>
#viramatag# = <virama>

#velarconsonanttag# = <velarconsonant>
#palatalconsonanttag# = <palatalconsonant>
#retroflexconsonanttag# = <retroflexconsonant>
#dentalconsonanttag# = <dentalconsonant>
#alveolarcosonanttag# = <alveolarcosonant>
#labiaalconsonanttag# = <labialconsonant>
#otherconsonanttag# = <otherconsonant>

#consonanttag# = #velarconsonanttag# #palatalconsonanttag# #retroflexconsonanttag##dentalconsonanttag##alveolarcosonanttag# #labiaalconsonanttag# #otherconsonanttag#

#misc-tags# = <space> <exclamation> <comma> <period> <questionmark> <colon> <semocolon> <chil> <digits> <inherentvowel> 
#boundarytag# = <BoW> <EoW>
%#phonecharacteristic# = <unaspirated><voiceless><aspirated><voiced><nasal>


#phonetags# = #purevoweltag# #vowelsigntag# #consonanttag# #viramatag# %#phonecharacteristic#

%#digitsarabic# = 0 1 2 3 4 5 6 7 8 9
%#digitsmalayalam# = ൦ ൧	൨ ൩ ൪	൫ ൬	൭	൮ ൯
%#digits# = #digitsarabic# #digitsmalayalam#
#allsymbols# = #ml# #IPA# #phonetags# #misc-tags# #space# #spl-char# #boundarytag# %#digitsarabic# #digitsmalayalam#
