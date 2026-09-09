% Lower One-sided VSI EWMA X-bar Chart for Gamma %
% Zero State %
% Create a function to find EATS %

function [EATS] = EATSFindLowerVsiEwmaXbarGam(n, deltamin, deltamax, hL, hS, lam, K1, K2, a_shape, b_scale)

h = 9 ; 
[x, w] = lgwt_table(h) ; 
EATSsum = 0 ; 

for i = 1:h 
    xi = x(i) ; 
    wi = w(i) ; 
    d = ((deltamax - deltamin)/2) * xi + ((deltamax + deltamin)/2) ; 
    [ATS, ~, ~] = TsLowerVsiEwmaXbarGam(n, hL, hS, lam, K1, K2, d, a_shape, b_scale) ;
    EATS = (1/(deltamax - deltamin)) * ATS * wi ; 
    EATSsum = EATSsum + EATS ; 
end

EATS = ((deltamax - deltamin)/2) * EATSsum ; 

end