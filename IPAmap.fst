#include "alphabets.fst"

%ALPHABET = [#ml##spl-char##boundarytag#]
$MISC$ = [#spl-char##boundarytag#]
$virama$ = ്:<virama>
$vowel$ = {അ}:{a<vowel>}|\
          {ആ}:{aː<vowel>}|\
          {ഇ}:{i<vowel><vowel>}|\
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
          {ഔ}:{au̯<vowel>}
$vowelsign$ = {ാ}:{aː}|\
              {ി}:{i}|\
              {ീ}:{iː}|\
              {ു}:{u}|\
              {ൂ}:{uː}|\
              {ൃ}:{rɨ}|\
              {ൄ}:{rɨː}|\
              {ൢ}:{lɨ}|\
              {ൣ}:{lɨː}|\
              {െ}:{e}|\
              {േ}:{eː}|\
              {ൈ}:{ai̯}|\
              {ൊ}:{o}|\
              {ോ}:{oː}|\
              {ൗ}:{au̯}|\
              {ൌ}:{au̯}|\
              {ം}:{m<anuswara>}|\
              {ഃ}:{h<visarga>}
$velar$ = {ക}:{k}|\
          {ഖ}:{kʰ}|\
          {ഗ}:{ɡ}|\
          {ഘ}:{ɡʱ}|\
          {ങ}:{ŋ}
$palatal$ = {ച}:{t͡ʃ}|\
            {ഛ}:{t͡ʃʰ}|\
            {ജ}:{ɟ}|\
            {ഝ}:{ɟʱ}|\
            {ഞ}:{ɲ}
$retroflex$ = {ട}:{ʈ}|\
              {ഠ}:{ʈʰ}|\
              {ഡ}:{ɖ}|\
              {ഢ}:{ɖʱ}|\
              {ണ}:{ɳ}
$dental$ = {ത}:{t̪}|\
           {ഥ}:{t̪ʰ}|\
           {ദ}:{d̪}|\
           {ധ}:{d̪ʱ}|\
           {ന}:{n̪}
$alveolar$ = {ഺ}:{ṯ}|\
             {ഩ}:{n}
$labial$ = {പ}:{p}|\
           {ഫ}:{pʰ}|\
           {ബ}:{b}|\
           {ഭ}:{bʱ}|\
           {മ}:{m}
$otherconsonants$ = {യ}:{j}|\
                    {ര}:{ɾ}|\
                    {ല}:{l}|\
                    {വ}:{ʋ}|\
                    {ശ}:{ʃ}|\
                    {ഷ}:{ʂ}|\
                    {സ}:{s}|\
                    {ഹ}:{ɦ}|\
                    {ള}:{ɭ}|\
                    {ഴ}:{ɽ}|\
                    {റ}:{r}
$chillu$ = {ൺ}:{ɳ<chil>} | {ൻ}:{n<chil>} |{ർ}:{r<chil>} |{ൽ}:{l<chil>} | {ൾ}:{ɭ<chil>}| {ൿ}:{k<chil>}

$IPAmap$ = ($MISC$|$virama$|$vowel$|$velar$|$palatal$|$retroflex$|$dental$|$alveolar$|$labial$|$otherconsonants$|$vowelsign$|$chillu$)*

$IPAmap$
