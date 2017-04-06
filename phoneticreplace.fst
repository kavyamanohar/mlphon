ALPHABET = [#allsymbols#]

$TTaconversion$ = {r<otherconsonant><virama>r}:{ṯṯ‍<otherconsonant>} ^->(__<otherconsonant>)
$NTaconversion$ = {n̪<dentalconsonant><virama>r}:{n‍ṯ<otherconsonant>} ^-> (__<otherconsonant>) %Note dental n̪a replace with alveolar n‍a
%$NTaconversion$ = {ൺ}: {ണ്} ^-> (__<chil>)

$TTaconversion$ >> "TTaconversion.a"
$NTaconversion$ >> "NTaconversion.a"
$phoneticreplace$ = $NTaconversion$ || $TTaconversion$
$phoneticreplace$ >> "phoneticreplace.a"
