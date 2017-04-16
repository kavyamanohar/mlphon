#include "alphabets.fst"

ALPHABET = [#spl-char##IPA##misc-tags##phonetags##boundarytag#]
$removetag_bow$ = {<BoW>}:{<>} ^-> (__[#spl-char##IPA##misc-tags##phonetags#])
$removetag_eow$ = {<EoW>}:{<>} ^-> ([#spl-char##IPA##misc-tags##phonetags#]__)
$removeBoundaryMarks$ = $removetag_bow$ || $removetag_eow$
$removeBoundaryMarks$
