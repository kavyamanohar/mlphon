#include "alphabets.fst"
ALPHABET =  [#ml_letter##spl-char##boundarytag#]

#=V# = #vowel#
#=C# = #consonant#
#=VS# = #vowelsign#
#=visarga# = #visarga#
#=anuswara# = #anuswara#
#=virama# = #virama#
#=chil# = #chillu#
$MISC$ = [#spl-char##boundarytag#]

$lettertag$ = {[#=V#]}:{[#=V#]<vowel>} | {[#=C#]}:{[#=C#]<consonant>} | {[#=VS#]}:{[#=VS#]<vowelsign>} |  {[#=visarga#]}:{[#=visarga#]<visarga>}| {[#=anuswara#]}:{[#=anuswara#]<anuswara>}| {[#=virama#]}:{[#=virama#]<virama>} | {[#=chil#]}:{[#=chil#]<chil>}
($MISC$|$lettertag$)*
