#include "alphabets.fst"

ALPHABET =[#IPA##phonetags##spl-char##misc-tags##boundarytag#]
$phonetic-special-replace$ = {r<otherconsonant><virama>r}:{ṯṯ} |{n̪<dentalconsonant><virama>r}:{nṯ}
$phoneticreplace$ = $phonetic-special-replace$ ^-> (__ [<otherconsonant>])
$phoneticreplace$
