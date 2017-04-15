ALPHABET = [#spl-char##IPA##misc-tags##boundarytag##phonetags#]
$removetags$ = ([#spl-char#]|[#IPA#]|[#misc-tags#]:<>|[#phonetags#]:<>|[#boundarytag#]:<>)*
$removetags$ >> "removetags.a"
