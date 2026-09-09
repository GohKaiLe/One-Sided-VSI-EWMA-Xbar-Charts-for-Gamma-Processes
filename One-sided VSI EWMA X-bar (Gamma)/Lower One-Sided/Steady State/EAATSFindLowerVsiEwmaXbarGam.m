% Lower One-sided VSI EWMA X-bar Chart for Gamma %
% Steady State %
% Create a function to find EAATS %

function [EAATS] = EAATSFindLowerVsiEwmaXbarGam(n, deltamin, deltamax, hL, hS, lam, K1, K2, a_shape, b_scale)

h = 9 ; 
[x, w] = lgwt_table(h) ; 
EAATSsum = 0 ; 

for i = 1:h 
    xi = x(i) ; 
    wi = w(i) ; 
    d = ((deltamax - deltamin)/2) * xi + ((deltamax + deltamin)/2) ; 
    [AATS, ~, ~] = TsLowerVsiEwmaXbarGamSteady(n, hL, hS, lam, K1, K2, d, a_shape, b_scale) ;
    EAATS = (1/(deltamax - deltamin)) * AATS * wi ; 
    EAATSsum = EAATSsum + EAATS ; 
end

EAATS = ((deltamax - deltamin)/2) * EAATSsum ; 

end