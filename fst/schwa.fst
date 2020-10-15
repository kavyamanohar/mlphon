#include "alphabets.fst"

ALPHABET = [#allsymbols#]

% Add inherent vowel to consonants if it is
% -  At the end of Syllable 
% eg: വ -> [{'phonemes': [{'ipa': 'ʋ', 'tags': ['approximant', 'labiodental']}, {'ipa': 'a', 'tags': ['inherentvowel']}]}]
% - Followed by anuswara 
%  eg: വം -> [{'phonemes': [{'ipa': 'ʋ', 'tags': ['approximant', 'labiodental']}, {'ipa': 'a', 'tags': ['inherentvowel']}, {'ipa': 'm', 'tags': ['anuswara']}]}]
% - Followed by visarga
%  eg: വഃ: [{'phonemes': [{'ipa': 'ʋ', 'tags': ['approximant', 'labiodental']}, {'ipa': 'a', 'tags': ['inherentvowel', 'visarga']}]}]
% - Followed by chillu 
% eg: വർ [{'phonemes': [{'ipa': 'ʋ', 'tags': ['approximant', 'labiodental']}, {'ipa': 'a', 'tags': ['inherentvowel']}, {'ipa': 'r', 'tags': ['chil']}]}]


#inherentvowelcontext# = #chiltag# #anuswaratag# #visargatag# <EoS>
$inherentvowel-addition$ = [#IPAconsonants#] [#consonanttags#]+ <>:{a<schwa>} ^-> (__ [#IPAconsonants#]? [#inherentvowelcontext#])

$schwa$ =  $inherentvowel-addition$
$schwa$
