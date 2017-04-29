#include "alphabets.fst"

ALPHABET = [#ml##spl-char##boundarytag#]
$MISC$ = [#spl-char##boundarytag#]
$virama$ = ്:<virama>
$vowel$ = {അ}:{a<vowel>}|\
          {ആ}:{aː<vowel>}|\
          {ഇ}:{i<vowel>}|\
          {ഈ}:{iː<vowel>} |\
          {ഉ}:{u<vowel>}|\
          {ഊ}:{uː<vowel>}|\
          {ഋ}:{rɨ<vowel>}|\
          {ൠ}:{rɨː<vowel>}|\
          {ഌ}:{lɨ<vowel>}|\
          {ൡ}:{lɨː<vowel>}|\
          {എ}:{e<vowel>}|\
          {ഏ}:{eː<vowel>}|\
          {ഐ}:{ai̯<vowel>}|\
          {ഒ}:{o<vowel>}|\
          {ഓ}:{oː<vowel>}|\
          {ഔ}:{au̯<vowel>}|\
          {അം}:{am<vowel>}|\
          {അഃ}:{ah<vowel>}
$vowelsign$ = {ാ}:{aː<v_sign>}|\
              {ി}:{i<v_sign>}|\
              {ീ}:{iː<v_sign>}|\
              {ു}:{u<v_sign>}|\
              {ൂ}:{uː<v_sign>}|\
              {ൃ}:{rɨ<v_sign>}|\
              {ൄ}:{rɨː<v_sign>}|\
              {ൢ}:{lɨ<v_sign>}|\
              {ൣ}:{lɨː<v_sign>}|\
              {െ}:{e<v_sign>}|\
              {േ}:{eː<v_sign>}|\
              {ൈ}:{ai̯<v_sign>}|\
              {ൊ}:{o<v_sign>}|\
              {ോ}:{oː<v_sign>}|\
              {ൗ}:{au̯<v_sign>}|\
              {ൌ}:{au̯<v_sign>}|\
              {ം}:{am<v_sign>}|\
              {ഃ}:{ah<v_sign>}
$velar$ = {ക}:{k<c_velar>}|\
          {ഖ}:{kʰ<c_velar>}|\
          {ഗ}:{ɡ<c_velar>}|\
          {ഘ}:{ɡʱ<c_velar>}|\
          {ങ}:{ŋ<c_velar>}
$palatal$ = {ച}:{t͡ʃ<c_palatal>}|\
            {ഛ}:{t͡ʃʰ<c_palatal>}|\
            {ജ}:{ɟ<c_palatal>}|\
            {ഝ}:{ɟʱ<c_palatal>}|\
            {ഞ}:{ɲ<c_palatal>}
$retroflex$ = {ട}:{ʈ<c_retroflex>}|\
              {ഠ}:{ʈʰ<c_retroflex>}|\
              {ഡ}:{ɖ<c_retroflex>}|\
              {ഢ}:{ɖʱ<c_retroflex>}|\
              {ണ}:{ɳ<c_retroflex>}
$dental$ = {ത}:{t̪<c_dental>}|\
           {ഥ}:{t̪ʰ<c_dental>}|\
           {ദ}:{d̪<c_dental>}|\
           {ധ}:{d̪ʱ<c_dental>}|\
           {ന}:{n̪<c_dental>}
$alveolar$ = {ഺ}:{ṯ<c_alveolar>}|\
             {ഩ}:{n<c_alveolar>}
$labial$ = {പ}:{p<c_labial>}|\
           {ഫ}:{pʰ<c_labial>}|\
           {ബ}:{b<c_labial>}|\
           {ഭ}:{bʱ<c_labial>}|\
           {മ}:{m<c_labial>}
$otherconsonants$ = {യ}:{j<c_other>}|\
                    {ര}:{ɾ<c_other>}|\
                    {ല}:{l<c_other>}|\
                    {വ}:{ʋ<c_other>}|\
                    {ശ}:{ʃ<c_other>}|\
                    {ഷ}:{ʂ<c_other>}|\
                    {സ}:{s<c_other>}|\
                    {ഹ}:{ɦ<c_other>}|\
                    {ള}:{ɭ<c_other>}|\
                    {ഴ}:{ɽ<c_other>}|\
                    {റ}:{r<c_other>}
$chillu$ = {ൺ}:{ɳ<chil>} | {ൻ}:{n<chil>} |{ർ}:{r<chil>} |{ൽ}:{l<chil>} | {ൾ}:{ɭ<chil>}| {ൿ}:{k<chil>} |\
            {ണ്‍}:{ɳ<chil>} | {ന്‍}:{n<chil>} |{ര്‍}:{r<chil>} |{ല്‍}:{l<chil>} | {ള്‍}:{ɭ<chil>}| {ക്‍}:{k<chil>}
$phoneticmap$ = ($MISC$|$virama$|$vowel$|$velar$|$palatal$|$retroflex$|$dental$|$alveolar$|$labial$|$otherconsonants$|$vowelsign$|$chillu$)*
$phoneticmap$
