#include "alphabets.fst"

%ALPHABET = [#ml##spl-char##boundarytag#]
$MISC$ = [#punct##boundarytags#]
$virama$ = ്:<virama>
$vowel$ = ({അ}:{a}|\
          {ആ}:{aː}|\
          {ഇ}:{i}|\
          {ഈ}:{iː} |\
          {ഉ}:{u}|\
          {ഊ}:{uː}|\
          {ഋ}:{rɨ}|\
          {ൠ}:{rɨː}|\
          {ഌ}:{lɨ}|\
          {ൡ}:{lɨː}|\
          {എ}:{e}|\
          {ഏ}:{eː}|\
          {ഐ}:{ai̯}|\
          {ഒ}:{o}|\
          {ഓ}:{oː}|\
          {ഔ}:{au̯}) <>:<vowel>
$vowel1$ = ([#vowels#] : [#IPAvowels#] ) <>:<vowel>
$vowelsign$ = ({ാ}:{aː}|\
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
              {ൌ}:{au̯}) <>:<v_sign>
$anuswara$ = {ം}:{m <anuswara>}
$visarga$ = {ഃ}:{<visarga>}
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

$IPAmap$ = ( $MISC$ | $virama$ | $vowel$ | $vowelsign$ | $anuswara$ | $visarga$ | $velar$ | $palatal$ | $retroflex$ | $dental$ | $alveolar$ | $labial$ | $otherconsonants$ |$chillu$)*

$IPAmap$
