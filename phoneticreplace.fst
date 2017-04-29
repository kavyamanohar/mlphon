#include "alphabets.fst"

ALPHABET =[#IPA##phonetags##spl-char##misc-tags##boundarytag#]
$phonetic-special-replace$ = {r<c_other><virama>r}:{ṯṯ} |{n̪<c_dental><virama>r}:{nṯ}
$phoneticreplace$ = $phonetic-special-replace$ ^-> (__ [<c_other>])
$phoneticreplace$
