#include "alphabets.fst"

ALPHABET = [#allsymbols#]
% ADD inherent vowel to a consonant if followed by another consonat or word end indicated by special characters or space
$schwa-addition$ =    {k}:{ka}|{kʰ}:{kʰa}|{ɡ}:{ɡa}|{ɡʱ}:{ɡʱa}|{ŋ}:{ŋa} |\
                      {t͡ʃ}:{t͡ʃa}| {t͡ʃʰ}:{t͡ʃʰa}|{ɟ}:{ɟa}|{ɟʱ}:{ɟʱa}|{ɲ}:{ɲa} |\
                      {ʈ}:{ʈa}|{ʈʰ}:{ʈʰa}|{ɖ}:{ɖa}|{ɖʱ}:{ɖʱa}|{ɳ}:{ɳa} |\
                      {ṯ}:{ṯa}|{n}:{na}|\
                      {t̪}:{t̪a}|{t̪ʰ}:{t̪ʰa}|{d̪}:{d̪a}|{d̪ʱ}:{d̪ʱa}|{n̪}:{n̪a} |\
                      {p}:{pa}|{pʰ}:{pʰa}|{b}:{ba}|{bʱ}:{bʱa}|{m}:{ma} |\
                      {j}:{ja}|{ɾ}:{ɾa}|{l}:{la}|{ʋ}:{ʋa}|{ʃ}:{ʃa}|{ʂ}:{ʂa}|\
                      {s}:{sa}|{ɦ}:{ɦa}|{ɭ}:{ɭa}|{ɽ}:{ɽa} |{r}:{ra}
$inherentvoweladd$ =  ($schwa-addition$) ^-> (__[<EoS>])
$inherentvoweladd$
