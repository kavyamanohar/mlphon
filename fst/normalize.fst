#include "alphabets.fst"
ALPHABET = [#letters#]

$replacements$ = {ണ്‍}:{ൺ} | {ന്‍}:{ൻ} | {ല്‍}:{ൽ} | {ള്‍}:{ൾ}  | {ര്‍}: {ർ} | {ൻ്റ} :{ന്റ}
$normalize$ = $replacements$ ^-> ([#letters#]?__)

$test$ = ആണ്‍ | ആൺ | കല്‍ | അകലം | അൻവർ | കോള്‍പ്പാടം
$test$ || $normalize$  >> "normalize.test.a"
$normalize$
