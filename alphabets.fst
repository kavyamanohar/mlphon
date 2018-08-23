%DEFINING ALL POSSIBLE INPUT AND OUTPUT ALPHABET SETS

#vowel# = അ ആ ഇ ഈ ഉ ഊ ഋ ൠ ഌ ൡ എ ഏ ഐ ഒ ഓ ഔ
#vowelsign# =  ാ ി ീ ൢ ൢ ു ൂ ൃ ൄ ൢ ൣ െ േ ൈ ൊ ോ  ൗ ൌ
#anuswara# = ം
#visarga# = ഃ
#virama# = ്
#sign# = #vowelsign# #anuswara# #visarga# #virama#

#velar# = ക ഖ ഗ ഘ ങ
#palatal# = ച ഛ ജ ഝ ഞ
#retroflex# = ട ഠ ഡ ഢ ണ
#alveolar# = ഺ ഩ
#dental# = ത ഥ ദ ധ ന
#labial# = പ ഫ ബ ഭ മ
#other# = യ ര ല വ ശ ഷ സ ഹ ള ഴ റ
#consonant# = #velar# #palatal# #retroflex# #dental# #alveolar# #labial# #other#

#chillu# =ൺ ൻ ർ ൽ ൾ ൿ

#ml_letter# = #vowel# #sign# #consonant# #chillu#

#voweltag#  = <vowel>
#vowelsigntag# = <v_sign>
#viramatag# = <virama>
#visargatag# = <visarga>
#anuswaratag# = <anuswara>

#velarconsonanttag# = <c_velar>
#palatalconsonanttag# = <c_palatal>
#retroflexconsonanttag# = <c_retroflex>
#dentalconsonanttag# = <c_dental>
#alveolarcosonanttag# = <c_alveolar>
#labiaalconsonanttag# = <c_labial>
#otherconsonanttag# = <c_other>

#consonanttag# = #velarconsonanttag# #palatalconsonanttag# #retroflexconsonanttag##dentalconsonanttag##alveolarcosonanttag# #labiaalconsonanttag# #otherconsonanttag#

%#misc-tags# = <space> <exclamation> <comma> <period> <questionmark> <colon> <semocolon> <chil> <digits> <schwa>
#chiltag# = <chil>
#misc-tags# = <schwa>
#boundarytag# = <BoW> <EoW> <BoS> <EoS>
%#phonecharacteristic# = <unaspirated><voiceless><aspirated><voiced><nasal>
#lettertags# = #voweltag# #vowelsigntag# #consonanttag# #viramatag# #visargatag# #anuswaratag#

%#space# = {\ }
#spl-char# ={\ } {\!}{\,}{\.}{\?}{\:}{\;}

#IPAvowels# = {a} {aː} {i} {iː} {u} {uː} {rɨ} {rɨː} {lɨ} {lɨː} {e} {eː} {ai̯} {o} {oː} {au̯} {am} {ah}

#IPAvelar# = k kʰ ɡ ɡʱ ŋ
#IPApalatal# = t͡ʃ t͡ʃʰ ɟ ɟʱ ɲ
#IPAretroflex# = ʈ ʈʰ ɖ ɖʱ ɳ
#IPAdental# = t̪ t̪ʰ d̪ d̪ʱ n̪
#IPAalvolar# = ṯ n
#IPAlabial# = p pʰ b bʱ m
#IPAother# = j ɾ l ʋ ʃ ʂ s ɦ ɭ ɽ r {ṯṯ} {n‍ṯ}
#IPAconsonants# = #IPAvelar# #IPApalatal##IPAretroflex# #IPAdental# #IPAalvolar##IPAlabial##IPAother#

#IPA# = #IPAvowels# #IPAconsonants#

%#digitsarabic# = 0 1 2 3 4 5 6 7 8 9
%#digitsmalayalam# = ൦ ൧	൨ ൩ ൪	൫ ൬	൭	൮ ൯
%#digits# = #digitsarabic# #digitsmalayalam#
#allsymbols# = #ml_letter# #IPA# #lettertags# #misc-tags# #spl-char# #boundarytag# %#digitsarabic# #digitsmalayalam#
