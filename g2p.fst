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
#phonetags# = #purevoweltag# #vowelsigntag# #consonantstag# %#phonecharacteristic#
ALPHABET = [#ml# #phonetags# #IPA#]
$space$ = \ <space>:<>
$MISC$ = [!]<exclamation>:<>|\
         [,]<comma>:<>|\
         [.]<period>:<>|\
         [?]<questionmark>:<>|\
         [:]<colon>:<>|\
         [;]<semocolon>:<>
$virama$ = <>:്<virama>:<>
$vowel$ = {a}:{അ}<purevowel>:<>|\
          {aː}:{ആ}<purevowel>:<>|\
          {i}:{ഇ}<purevowel>:<>|\
          {iː}:{ഈ}<purevowel>:<>|\
          {u}:{ഉ}<purevowel>:<>|\
          {uː}:{ഊ}<purevowel>:<>|\
          {rɨ}:{ഋ}<purevowel>:<>|\
          {rɨː}:{ൠ}<purevowel>:<>|\
          {lɨ}:{ഌ}<purevowel>:<>|\
          {lɨː}:{ൡ}<purevowel>:<>|\
          {e}:{എ}<purevowel>:<>|\
          {eː}:{ഏ}<purevowel>:<>|\
          {ai̯}:{ഐ}<purevowel>:<>|\
          {o}:{ഒ}<purevowel>:<>|\
          {oː}:{ഓ}<purevowel>:<>|\
          {au̯}:{ഔ}<purevowel>:<>|\
          {am}:{അം}<purevowel>:<>|\
          {ah}:{അഃ}<purevowel>:<>
$vowelsign$ = {aː}:{ാ}<vowelsign>:<>|\
              {i}:{ി}<vowelsign>:<>|\
              {iː}:{ീ}<vowelsign>:<>|\
              {u}:{ു}<vowelsign>:<>|\
              {uː}:{ൂ}<vowelsign>:<>|\
              {rɨ}:{ൃ}<vowelsign>:<>|\
              {rɨː}:{ൄ}<vowelsign>:<>|\
              {lɨ}:{ൢ}<vowelsign>:<>|\
              {lɨː}:{ൣ}<vowelsign>:<>|\
              {e}:{െ}<vowelsign>:<>|\
              {eː}:{േ}<vowelsign>:<>|\
              {ai̯}:{ൈ}<vowelsign>:<>|\
              {o}:{ൊ}<vowelsign>:<>|\
              {oː}:{ോ}<vowelsign>:<>|\
              {au̯}: {ൗ}<vowelsign>:<>|\
              {au̯}: {ൌ}<vowelsign>:<>|\
              {am}:{ം}<vowelsign>:<>|\
              {ah}:{ഃ}<vowelsign>:<>
$velar$ = {ka}:{ക}<velarconsonant>:<>|\
          {kʰa}:{ഖ}<velarconsonant>:<>|\
          {ɡa}:{ഗ}<velarconsonant>:<>|\
          {ɡʱa}:{ഘ}<velarconsonant>:<>|\
          {ŋa}:{ങ}<velarconsonant>:<>
$palatal$ = {t͡ʃa}:{ച}<palatalconsonant>:<>|\
            {t͡ʃʰa}:{ഛ}<palatalconsonant>:<>|\
            {ɟa}:{ജ}<palatalconsonant>:<>|\
            {ɟʱa}:{ഝ}<palatalconsonant>:<>|\
            {ɲa}:{ഞ}<palatalconsonant>:<>
$retroflex$ = {ʈa}:{ട}<retroflexconsonant>:<>|\
              {ʈʰa}:{ഠ}<retroflexconsonant>:<>|\
              {ɖa}:{ഡ}<retroflexconsonant>:<>|\
              {ɖʱa}:{ഢ}<retroflexconsonant>:<>|\
              {ɳa}:{ണ}<retroflexconsonant>:<>
$dental$ = {t̪a}:{ത}<dentalconsonant>:<>|\
           {t̪ʰa}:{ഥ}<dentalconsonant>:<>|\
           {d̪a}:{ദ}<dentalconsonant>:<>|\
           {d̪ʱa}:{ധ}<dentalconsonant>:<>|\
           {n̪a}:{ന}<dentalconsonant>:<>
$labial$ = {pa}:{പ}<labialconsonant>:<>|\
          {pʰa}:{ഫ}<labialconsonant>:<>|\
          {ba}:{ബ}<labialconsonant>:<>|\
          {bʱa}:{ഭ}<labialconsonant>:<>|\
          {ma}:{മ}<labialconsonant>:<>
$otherconsonants$ = {ja}:{യ}<otherconsonant>:<>|\
                    {ɾa}:{ര}<otherconsonant>:<>|\
                    {la}:{ല}<otherconsonant>:<>|\
                    {ʋa}:{വ}<otherconsonant>:<>|\
                    {ʃa}:{ശ}<otherconsonant>:<>|\
                    {ʂa}:{ഷ}<otherconsonant>:<>|\
                    {sa}:{സ}<otherconsonant>:<>|\
                    {ɦa}:{ഹ}<otherconsonant>:<>|\
                    {ɭa}:{ള}<otherconsonant>:<>|\
                    {ɽa}:{ഴ}<otherconsonant>:<>|\
                    {ra}:{റ}<otherconsonant>:<>
$IPAandTAGS$ = ($MISC$|$space$|$virama$|$vowel$|$velar$|$palatal$|$retroflex$|$dental$|$labial$|$otherconsonants$|$vowelsign$)*
$removetag$ = ([#IPA#]|<>:[#phonetags#])*
$tests$ = അമ്മ | ആന
$IPAandTAGS$ >> "IPAandTAGS.a"
$removetag$ >> "removetag.a"

%$tests$ ||
$IPAandTAGS$ || $removetag$
