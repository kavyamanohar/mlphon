#include "alphabets.fst"

% %%%%%%%Previous rule for tag removal. Retaining as a  comment here
%ALPHABET =[#IPAs##chiltag##visargatag# #anuswaratag##zerowidthtag#] [#voweltag# #vowelsigntag# #consonanttags# #viramatag#  #schwatag# #boundarytags#]:<>
%$tagfilter$ = .*
%%%%%%%%%%%%%%

$IPAspace$ = [#IPAs#]*<>:{\ }
$IPAtagremoval$ =<BoS>:<> ( $IPAspace$ [#lettertags##boundarytags#]:<>)* <EoS>:<>
$tagfilter$ = $IPAtagremoval$

$tagfilter$
