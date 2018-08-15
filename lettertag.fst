#include "alphabets.fst"
ALPHABET =  [#ml##spl-char#]

#=V# = #mlvowel#
#=C# = #mlconsonant#
#=VS# = #mlvowelsign#
#=visarga# = #visarga#
#=anuswara# = #anuswara#
#=virama# = #mlvirama#
#=Chil# = #mlchilluatomic#
$lettertag$ = {[#=V#]}:{[#=V#]<vowel>} | {[#=C#]}:{[#=C#]<consonant>} | {[#=VS#]}:{[#=VS#]<vowelsign>} |  {[#=visarga#]}:{[#=visarga#]<visarga>}| {[#=anuswara#]}:{[#=anuswara#]<anuswara>}| {[#=virama#]}:{[#=virama#]<virama>} | {[#=Chil#]}:{[#=Chil#]<chil>}
($lettertag$)*
