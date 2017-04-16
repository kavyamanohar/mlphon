#include "alphabets.fst"

ALPHABET = [#ml##spl-char##boundarytag#]
$MISC$ = [#spl-char##boundarytag#]
$virama$ = ്:<virama>
$vowel$ = {അ}:{a<purevowel>}|\
          {ആ}:{aː<purevowel>}|\
          {ഇ}:{i<purevowel>}|\
          {ഈ}:{iː<purevowel>} |\
          {ഉ}:{u<purevowel>}|\
          {ഊ}:{uː<purevowel>}|\
          {ഋ}:{rɨ<purevowel>}|\
          {ൠ}:{rɨː<purevowel>}|\
          {ഌ}:{lɨ<purevowel>}|\
          {ൡ}:{lɨː<purevowel>}|\
          {എ}:{e<purevowel>}|\
          {ഏ}:{eː<purevowel>}|\
          {ഐ}:{ai̯<purevowel>}|\
          {ഒ}:{o<purevowel>}|\
          {ഓ}:{oː<purevowel>}|\
          {ഔ}:{au̯<purevowel>}|\
          {അം}:{am<purevowel>}|\
          {അഃ}:{ah<purevowel>}
$vowelsign$ = {ാ}:{aː<vowelsign>}|\
              {ി}:{i<vowelsign>}|\
              {ീ}:{iː<vowelsign>}|\
              {ു}:{u<vowelsign>}|\
              {ൂ}:{uː<vowelsign>}|\
              {ൃ}:{rɨ<vowelsign>}|\
              {ൄ}:{rɨː<vowelsign>}|\
              {ൢ}:{lɨ<vowelsign>}|\
              {ൣ}:{lɨː<vowelsign>}|\
              {െ}:{e<vowelsign>}|\
              {േ}:{eː<vowelsign>}|\
              {ൈ}:{ai̯<vowelsign>}|\
              {ൊ}:{o<vowelsign>}|\
              {ോ}:{oː<vowelsign>}|\
              {ൗ}:{au̯<vowelsign>}|\
              {ൌ}:{au̯<vowelsign>}|\
              {ം}:{am<vowelsign>}|\
              {ഃ}:{ah<vowelsign>}
$velar$ = {ക}:{k<velarconsonant>}|\
          {ഖ}:{kʰ<velarconsonant>}|\
          {ഗ}:{ɡ<velarconsonant>}|\
          {ഘ}:{ɡʱ<velarconsonant>}|\
          {ങ}:{ŋ<velarconsonant>}
$palatal$ = {ച}:{t͡ʃ<palatalconsonant>}|\
            {ഛ}:{t͡ʃʰ<palatalconsonant>}|\
            {ജ}:{ɟ<palatalconsonant>}|\
            {ഝ}:{ɟʱ<palatalconsonant>}|\
            {ഞ}:{ɲ<palatalconsonant>}
$retroflex$ = {ട}:{ʈ<retroflexconsonant>}|\
              {ഠ}:{ʈʰ<retroflexconsonant>}|\
              {ഡ}:{ɖ<retroflexconsonant>}|\
              {ഢ}:{ɖʱ<retroflexconsonant>}|\
              {ണ}:{ɳ<retroflexconsonant>}
$dental$ = {ത}:{t̪<dentalconsonant>}|\
           {ഥ}:{t̪ʰ<dentalconsonant>}|\
           {ദ}:{d̪<dentalconsonant>}|\
           {ധ}:{d̪ʱ<dentalconsonant>}|\
           {ന}:{n̪<dentalconsonant>}
$alveolar$ = {ഺ}:{ṯ<alveolarcosonant>}|\
             {ഩ}:{n<alveolarcosonant>}
$labial$ = {പ}:{p<labialconsonant>}|\
           {ഫ}:{pʰ<labialconsonant>}|\
           {ബ}:{b<labialconsonant>}|\
           {ഭ}:{bʱ<labialconsonant>}|\
           {മ}:{m<labialconsonant>}
$otherconsonants$ = {യ}:{j<otherconsonant>}|\
                    {ര}:{ɾ<otherconsonant>}|\
                    {ല}:{l<otherconsonant>}|\
                    {വ}:{ʋ<otherconsonant>}|\
                    {ശ}:{ʃ<otherconsonant>}|\
                    {ഷ}:{ʂ<otherconsonant>}|\
                    {സ}:{s<otherconsonant>}|\
                    {ഹ}:{ɦ<otherconsonant>}|\
                    {ള}:{ɭ<otherconsonant>}|\
                    {ഴ}:{ɽ<otherconsonant>}|\
                    {റ}:{r<otherconsonant>}
$chillu$ = {ൺ}:{ɳ<chil>} | {ൻ}:{n<chil>} |{ർ}:{r<chil>} |{ൽ}:{l<chil>} | {ൾ}:{ɭ<chil>}| {ൿ}:{k<chil>} |\
            {ണ്‍}:{ɳ<chil>} | {ന്‍}:{n<chil>} |{ര്‍}:{r<chil>} |{ല്‍}:{l<chil>} | {ള്‍}:{ɭ<chil>}| {ക്‍}:{k<chil>}
$phoneticmap$ = ($MISC$|$virama$|$vowel$|$velar$|$palatal$|$retroflex$|$dental$|$alveolar$|$labial$|$otherconsonants$|$vowelsign$|$chillu$)*
$phoneticmap$
