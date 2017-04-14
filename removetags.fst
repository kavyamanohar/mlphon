ALPHABET = [#space##spl-char##IPA##misc-tags##boundarytag##phonetags#]
$removetags$ = ([#space#]|[#spl-char#]|[#IPA#]|[#misc-tags#]:<>|[#phonetags#]:<>|[#boundarytag#]:<>)*
$removetags$ >> "removetags.a"
