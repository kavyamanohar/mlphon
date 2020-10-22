% DEFINING ALL POSSIBLE INPUT AND OUTPUT ALPHABET SETS

#vowels# = അ ആ ഇ ഈ ഉ ഊ ഋ ൠ ഌ ൡ എ ഏ ഐ ഒ ഓ ഔ
#vowelsigns# =  ാ ി ീ ൢ ൢ ു ൂ ൃ ൄ ൢ ൣ െ േ ൈ ൊ ോ ൗ ൌ
#anuswara# = ം
#visarga# = ഃ
#virama# = ്
#signs# = #vowelsigns# #anuswara# #visarga# #virama#

#velars# = ക ഖ ഗ ഘ ങ
#palatals# = ച ഛ ജ ഝ ഞ
#retroflexes# = ട ഠ ഡ ഢ ണ
#alveolars# = ഺ ഩ
#dentals# = ത ഥ ദ ധ ന
#labials# = പ ഫ ബ ഭ മ
#others# = യ ര ല വ ശ ഷ സ ഹ ള ഴ റ
#consonants# = #velars# #palatals# #retroflexes# #dentals# #alveolars# #labials# #others#

#chillus# = ൺ ൻ ർ ൽ ൾ ൿ ൔ ൕ ൖ
% invisible characters zwj and zwnj
#zerowidth# = ‌‍
#letters# = #vowels# #signs# #consonants# #chillus# #zerowidth#

#voweltag#  = <vowel>
#vowelsigntag# = <v_sign>
#viramatag# = <virama>
#visargatag# = <visarga>
#anuswaratag# = <anuswara>

#velarconsonanttag# = <velar>
#palatalconsonanttag# = <palatal>
#retroflexconsonanttag# = <retroflex>
#dentalconsonanttag# = <dental>
#alveolarcosonanttag# = <alveolar>
#labiaalconsonanttag# = <labial>
#labiodentalconsonanttag# = <labiodental>
#glottalconsonanttag# = <glottal>
#otherconsonanttag# = <other>

#plosivetag# = <plosive> <voiceless> <unaspirated> <voiced><aspirated>
#nasaltag# = <nasal>
#fricativetag# = <fricative>
#flappedtag# = <flapped>
#lateraltag# = <lateral>
#approximanttag# = <approximant>
#glidetag# = <glide>
#trilltag# = <trill>


#consonanttags# = #velarconsonanttag# #palatalconsonanttag# #retroflexconsonanttag# #dentalconsonanttag# #alveolarcosonanttag# #labiaalconsonanttag# #labiodentalconsonanttag# #glottalconsonanttag# #otherconsonanttag# #plosivetag# #nasaltag# #fricativetag# #flappedtag# #lateraltag# #approximanttag# #glidetag# #trilltag#

#chiltag# = <chil>
#zerowidthtag# = <zwj> <zwnj>
#inherentvoweltag# = <inherentvowel>
#boundarytags# = <BoW> <EoW> <BoS> <EoS> <B>
% #phonecharacteristic# = <unaspirated><voiceless><aspirated><voiced><nasal>
#lettertags# = #voweltag# #vowelsigntag# #consonanttags# #viramatag# #visargatag# #anuswaratag# #chiltag# #inherentvoweltag# #zerowidthtag#

% #space# = {\ }
% #punct# ={\ } {\!}{\,}{\.}{\?}{\:}{\;}
% #misc-tags# = <space> <exclamation> <comma> <period> <questionmark> <colon> <semocolon> <chil> <digits> <inherentvowel>

#IPAvowels# = {a} {aː} {i} {iː} {u} {uː} {rɨ} {rɨː} {lɨ} {lɨː} {e} {eː} {ai̯} {o} {oː} {au̯}
#IPAvelar# = {k} {kʰ} {ɡ} {ɡʱ} {ŋ}
#IPApalatal# = {t͡ʃ} {t͡ʃʰ} {ɟ} {ɟʱ} {ɲ}
#IPAretroflex# = {ʈ} {ʈʰ} {ɖ} {ɖʱ} {ɳ}
#IPAdental# = {t̪} {t̪ʰ} {d̪} {d̪ʱ} {n̪}
#IPAalveolar# = {ṯ} {n}
#IPAlabial# = {p} {pʰ} {b} {bʱ} {m}
#IPAother# = {j} {ɾ} {l} {ʋ} {ʃ} {ʂ} {s} {ɦ} {ɭ} {ɻ} {r}
#IPAconsonants# = #IPAvelar# #IPApalatal# #IPAretroflex# #IPAdental# #IPAalveolar# #IPAlabial# #IPAother#

#IPAs# = #IPAvowels# #IPAconsonants#

%  #digitsarabic# = 0 1 2 3 4 5 6 7 8 9
% #digitsmalayalam# = ൦ ൧	൨ ൩ ൪	൫ ൬	൭	൮ ൯
% #digits# = #digitsarabic# #digitsmalayalam#
#allsymbols# = #letters# #IPAs# #lettertags# #boundarytags# %#punct#  #digitsarabic# #digitsmalayalam#
