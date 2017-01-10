% #letters#=കചടതപka
% #mlvirama# = ്
% ALPHABET = [#letters##mlvirama#]
% $replace$ = {ക}:{ka} ‌^-> (__[#mlvirama#] )
% %$test$ = ക | കച | ക്ത |പ്ത | ത് | ക്
% %$test$ ||
% $replace$
% #mlchillu# = ൺ ൻ ർ ൽ ൾ ൿ
% $replace-chillu$ = {ൺ ൻ ർ ൽ ൾ ൿ}:{ണ്‍ ന്‍ ര്‍ ല്‍ ള്‍ ക്‍}

#mlvowels# = അ ആ ഇ ഈ ഉ ഊ ഋ ൠ ഌ ൡ എ ഏ ഐ ഒ ഓ ഔ അ ം അഃ
#mlvirama# = ്
#mlvowelsign# = ാിീൢൢുൂൃൄൢൣെേൈൊോൗൌംഃ
#mlvelar# = കഖഗഘങ
#mlpalatal# = ച ഛ ജ ഝ ഞ
#mlretroflex# = ട ഠ ഡ ഢ ണ
#mldental# = ത ഥ ദ ധ ന
#mllabial# = പ ഫ ബ ഭ മ
#mlother# = യ ര ല വ ശ ഷ സ ഹ ള ഴ റ
#mlchilluatomic# =ൺൻർൽൾൿ
#mlchillu# = ണ്‍ന്‍ര്‍ല്‍ള്‍ക്‍
#mlspace# = {\ }
#letters# = #mlvowels##mlvirama##mlvowelsign##mlvelar##mlpalatal##mlretroflex##mldental# #mllabial##mlother##mlchillu##mlspace#
ALPHABET = [#letters##mlchilluatomic#]
$replace-chillu$ = {ൺ}:{ണ്}^-> ([#letters#]__[#letters#])
                  %  {ന്}:{ൻ}  |\
                  %  {ര്}:{ർ} |\
                  %  {ല്}:{ൽ} |\
                  %  {ള്} :{ൾ} |\
                  %  {ക്}:{ൿ}
$replace-chillu$
