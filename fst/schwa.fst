#include "alphabets.fst"
ALPHABET = [#allsymbols#]

$schwa1$ = {u<v_sign><virama>}:{ə<schwa>} ^-> (__ <EoS>)
$schwa2$ = {<virama>}:{ə<schwa>} ^-> (__ <EoS>)

$schwa$ = $schwa1$ || $schwa2$
$schwa$
