#mlvowels# = അ ആ ഇ ഈ ഉ ഊ ഋ ൠ ഌ ൡ എ ഏ ഐ ഒ ഓ ഔ അ ം അഃ
#mlvirama# = ്
#mlvowelsign# = ാിീൢൢുൂൃൄൢൣെേൈൊോൗൌംഃ
#mlvelar# = കഖഗഘങ
#mlpalatal# = ച ഛ ജ ഝ ഞ
#mlretroflex# = ട ഠ ഡ ഢ ണ
#mldental# = ത ഥ ദ ധ ന
#mllabial# = പ ഫ ബ ഭ മ
#mlother# = യ ര ല വ ശ ഷ സ ഹ ള ഴ റ
#mlchilluatomic# =ൺൻർൽൾൿ
#mlchillu# = ണ്‍ന്‍ര്‍ല്‍ള്‍ക്‍
#mlspace# = {\ }
#ml-misc# = {\!}{\,}{\.}{\?}{\:}{\;}
#ml# = #mlvowels##mlvirama##mlvowelsign##mlvelar# #mlpalatal##mlretroflex##mldental##mllabial##mlother##mlchillu##ml-misc#
#IPAvowels# = {a} {aː} {i} {iː} {u} {uː} {rɨ} {rɨː} {lɨ} {lɨː} {e} {eː} {ai̯} {o} {oː} {au̯} {am} {ah}
#IPAvelar# = ka kʰa ɡa ɡʱa ŋa
#IPApalatal# = t͡ʃa t͡ʃʰa ɟa ɟʱa ɲa
#IPAretroflex# = ʈa ʈʰa ɖa ɖʱa ɳa
#IPAdental# = t̪a t̪ʰa d̪a d̪ʱa na
#IPAlabial# = pa pʰa ba bʱa ma
#IPAother# = ja ɾa la ʋa ʃa ʂa sa ɦa ɭa ɽa ra
#IPA# = #IPAvowels##IPAvelar# #IPApalatal##IPAretroflex# #IPAdental# #IPAlabial##IPAother#
#viramatag# = <virama>
#purevoweltag#  = <purevowel>
#vowelsigntag# = <vowelsign>
#velarconsonanttag# = <velarconsonant>
#palatalconsonanttag# = <palatalconsonant>
#retroflexconsonanttag# = <retroflexconsonant>
#dentalconsonanttag# = <dentalconsonant>
#labiaalconsonanttag# = <labialconsonant>
#otherconsonanttag# = <otherconsonant>
#misc-tags# = <space> <exclamation> <comma> <period><questionmark><colon><semocolon>
%#phonecharacteristic# = <unaspirated><voiceless><aspirated><voiced><nasal>

#consonantstag# = #velarconsonanttag# #palatalconsonanttag# #retroflexconsonanttag##dentalconsonanttag# #labiaalconsonanttag# #otherconsonanttag#
#phonetags# = #purevoweltag# #vowelsigntag# #consonantstag##viramatag# %#phonecharacteristic#

#letters# = #mlvowels##mlvirama##mlvowelsign##mlvelar##mlpalatal##mlretroflex##mldental# #mllabial##mlother##mlchillu##mlspace# #ml-misc#%for remove chillu atomic
ALPHABET = [#ml# #phonetags# #IPA# #misc-tags#]
$space$ = [\ ]:<space>
$MISC$ = [\!]:<exclamation>|\
         [\,]:<comma>|\
         [\.]:<period>|\
         [\?]:<questionmark>|\
         [\:]:<colon>|\
         [\;]:<semocolon>
$virama$ = ്:<virama>
$vowel$ = {അ}:{a}<>:<purevowel>|\
          {ആ}:{aː}<>:<purevowel>|\
          {ഇ}:{i}<>:<purevowel>|\
          {ഈ}:{iː}<>:<purevowel> |\
          {ഉ}:{u}<>:<purevowel>|\
          {ഊ}:{uː}<>:<purevowel>|\
          {ഋ}:{rɨ}<>:<purevowel>|\
          {ൠ}:{rɨː}<>:<purevowel>|\
          {ഌ}:{lɨ}<>:<purevowel>|\
          {ൡ}:{lɨː}<>:<purevowel>|\
          {എ}:{e}<>:<purevowel>|\
          {ഏ}:{eː}<>:<purevowel>|\
          {ഐ}:{ai̯}<>:<purevowel>|\
          {ഒ}:{o}<>:<purevowel>|\
          {ഓ}:{oː}<>:<purevowel>|\
          {ഔ}:{au̯}<>:<purevowel>|\
          {അം}:{am}<>:<purevowel>|\
          {അഃ}:{ah}<>:<purevowel>
$vowelsign$ = {ാ}:{aː}<>:<vowelsign>|\
              {ി}:{i}<>:<vowelsign>|\
              {ീ}:{iː}<>:<vowelsign>|\
              {ു}:{u}<>:<vowelsign>|\
              {ൂ}:{uː}<>:<vowelsign>|\
              {ൃ}:{rɨ}<>:<vowelsign>|\
              {ൄ}:{rɨː}<>:<vowelsign>|\
              {ൢ}:{lɨ}<>:<vowelsign>|\
              {ൣ}:{lɨː}<>:<vowelsign>|\
              {െ}:{e}<>:<vowelsign>|\
              {േ}:{eː}<>:<vowelsign>|\
              {ൈ}:{ai̯}<>:<vowelsign>|\
              {ൊ}:{o}<>:<vowelsign>|\
              {ോ}:{oː}<>:<vowelsign>|\
              {ൗ}:{au̯}<>:<vowelsign>|\
              {ൌ}:{au̯}<>:<vowelsign>|\
              {ം}:{am}<>:<vowelsign>|\
              {ഃ}:{ah}<>:<vowelsign>
$velar$ = {ക}:{ka}<>:<velarconsonant>|\
          {ഖ}:{kʰa}<>:<velarconsonant>|\
          {ഗ}:{ɡa}<>:<velarconsonant>|\
          {ഘ}:{ɡʱa}<>:<velarconsonant>|\
          {ങ}:{ŋa}<>:<velarconsonant>
$palatal$ = {ച}:{t͡ʃa}<>:<palatalconsonant>|\
            {ഛ}:{t͡ʃʰa}<>:<palatalconsonant>|\
            {ജ}:{ɟa}<>:<palatalconsonant>|\
            {ഝ}:{ɟʱa}<>:<palatalconsonant>|\
            {ഞ}:{ɲa}<>:<palatalconsonant>
$retroflex$ = {ട}:{ʈa}<>:<retroflexconsonant>|\
              {ഠ}:{ʈʰa}<>:<retroflexconsonant>|\
              {ഡ}:{ɖa}<>:<retroflexconsonant>|\
              {ഢ}:{ɖʱa}<>:<retroflexconsonant>|\
              {ണ}:{ɳa}<>:<retroflexconsonant>
$dental$ = {ത}:{t̪a}<>:<dentalconsonant>|\
           {ഥ}:{t̪ʰa}<>:<dentalconsonant>|\
           {ദ}:{d̪a}<>:<dentalconsonant>|\
           {ധ}:{d̪ʱa}<>:<dentalconsonant>|\
           {ന}:{n̪a}<>:<dentalconsonant>
$labial$ = {പ}:{pa}<>:<labialconsonant>|\
           {ഫ}:{pʰa}<>:<labialconsonant>|\
           {ബ}:{ba}<>:<labialconsonant>|\
           {ഭ}:{bʱa}<>:<labialconsonant>|\
           {മ}:{ma}<>:<labialconsonant>
$otherconsonants$ = {യ}:{ja}<>:<otherconsonant>|\
                    {ര}:{ɾa}<>:<otherconsonant>|\
                    {ല}:{la}<>:<otherconsonant>|\
                    {വ}:{ʋa}<>:<otherconsonant>|\
                    {ശ}:{ʃa}<>:<otherconsonant>|\
                    {ഷ}:{ʂa}<>:<otherconsonant>|\
                    {സ}:{sa}<>:<otherconsonant>|\
                    {ഹ}:{ɦa}<>:<otherconsonant>|\
                    {ള}:{ɭa}<>:<otherconsonant>|\
                    {ഴ}:{ɽa}<>:<otherconsonant>|\
                    {റ}:{ra}<>:<otherconsonant>
% $replace-chillu$ = ([#letters#] | {ൺ}:{ണ്} | {ൻ}:{ന്} |{ർ}:{ര്} |{ൽ}:{ല്} | {ൾ}:{ള്}| {ൿ}:{ക്} )*
$IPAandTAGS$ = ($MISC$|$space$|$virama$|$vowel$|$velar$|$palatal$|$retroflex$|$dental$|$labial$|$otherconsonants$|$vowelsign$)*
$removeimplicitvowel1$ = ({ka}:{k}|{kʰa}:{kʰ}|{ɡa}:{ɡ}|{ɡʱa}:{ɡʱ}|{ŋa}:{ŋ} |\
                         {t͡ʃa}:{t͡ʃ}| {t͡ʃʰa}:{t͡ʃʰ}|{ɟa}:{ɟ}|{ɟʱa}:{ɟʱ}|{ɲa}:{ɲ} |\
                         {ʈa}:{ʈ}|{ʈʰa}:{ʈʰ}|{ɖa}:{ɖ}|{ɖʱa}:{ɖʱ}|{ɳa}:{ɳ} |\
                         {t̪a}:{t̪}|{t̪ʰa}:{t̪ʰ}|{d̪a}:{d̪}|{d̪ʱa}:{d̪ʱ}|{n̪a}:{n̪} |\
                         {pa}:{p}|{pʰa}:{pʰ}|{ba}:{b}|{bʱa}:{bʱ}|{ma}:{m} |\
                         {ja}:{j}|{ɾa}:{ɾ}|{la}:{l}|{ʋa}:{ʋ}|{ʃa}:{ʃ}|{ʂa}:{ʂ}|\
                         {sa}:{s}|{ɦa}:{ɦ}|{ɭa}:{ɭ}|{ɽa}:{ɽa} |{ra}:{ra}) ^-> ( __[#consonantstag#][#viramatag#])
$removeimplicitvowel2$ = ({ka}:{k}|{kʰa}:{kʰ}|{ɡa}:{ɡ}|{ɡʱa}:{ɡʱ}|{ŋa}:{ŋ} |\
                          {t͡ʃa}:{t͡ʃ}| {t͡ʃʰa}:{t͡ʃʰ}|{ɟa}:{ɟ}|{ɟʱa}:{ɟʱ}|{ɲa}:{ɲ} |\
                          {ʈa}:{ʈ}|{ʈʰa}:{ʈʰ}|{ɖa}:{ɖ}|{ɖʱa}:{ɖʱ}|{ɳa}:{ɳ} |\
                          {t̪a}:{t̪}|{t̪ʰa}:{t̪ʰ}|{d̪a}:{d̪}|{d̪ʱa}:{d̪ʱ}|{n̪a}:{n̪} |\
                          {pa}:{p}|{pʰa}:{pʰ}|{ba}:{b}|{bʱa}:{bʱ}|{ma}:{m} |\
                          {ja}:{j}|{ɾa}:{ɾ}|{la}:{l}|{ʋa}:{ʋ}|{ʃa}:{ʃ}|{ʂa}:{ʂ}|\
                          {sa}:{s}|{ɦa}:{ɦ}|{ɭa}:{ɭ}|{ɽa}:{ɽa} |{ra}:{r}) ^-> ( __[#consonantstag#][#IPAvowels#]+[#vowelsigntag#])
$removeimplicitvowel$ = $removeimplicitvowel2$ || $removeimplicitvowel1$
$removetag$ = ([#IPA#]|[#phonetags#]:<>|[#misc-tags#])*
% $tests$ = കവി | കി | ജിയ

% $replace-chillu$ >> "replace-chillu.a"
$IPAandTAGS$ >> "IPAandTAGS.a"
$removeimplicitvowel$ >> "removeimplicitvowel.a"
% $removetag$ >> "removetag.a"
% $tests$ >> "tests.a"

% $tests$ ||
$IPAandTAGS$ || $removeimplicitvowel$ || $removetag$
