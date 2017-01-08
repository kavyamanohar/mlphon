#vowels#= അആഇഈഉഊഋൠഌൡഎഏഐഒഓഔഅംഅഃ
#virama#=്
#velar#=കഖഗഘങ
ALPHABET = [#vowels##virama##velar#]
$vowels2IPA$ ={a}:{അ}<purevowel>:<>|\
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
$velar2IPA$ = {ka}:{ക}<velarconsonant>:<><unaspirated>:<><voiceless>:<>|\
              {kʰa}:{ഖ}<velarconsonant>:<><aspirated>:<><voiceless>:<>|\
              {ɡa}:{ഗ}<velarconsonant>:<><unaspirated>:<><voiced>:<>|\
              {ɡʱa}:{ഘ}<velarconsonant>:<><aspirated>:<><voiced>:<>|\
              {ŋa}:{ങ}<velarconsonant>:<><nasal>:<><voiced>:<>
$g2p$ = ($vowels2IPA$|$velar2IPA$ )*
%uncomment to test
$tests$ = അ|\
         ക|\
         അക|\
         ങഖ|\
         ഗ
$g2p$ \
|| $tests$
