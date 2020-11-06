#include "alphabets.fst"

% %%%%%%%Previous rule for tag removal. Retaining as a  comment here
ALPHABET =[#IPAs##visargatag##zerowidthtag#] [#voweltag# #schwatag# #vowelsigntag# #consonanttags# #viramatag# #chiltag##anuswaratag##inherentvoweltag# #boundarytags#]:<>
$tagfilter$ = .*
%%%%%%%%%%%%%%

%$IPAspace$ = [#IPAs#]*<>:{\ }
%$IPAtagremoval$ =<BoS>:<> ( $IPAspace$ [#lettertags##boundarytags#]:<>)* <EoS>:<>
%$tagfilter$ = $IPAtagremoval$

$tagfilter$
