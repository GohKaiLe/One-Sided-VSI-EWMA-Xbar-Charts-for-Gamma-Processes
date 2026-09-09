% Lower One-sided VSI EWMA X-bar Chart for Gamma %
% Steady State %
% Objective Function for EAATS %

function f = ObjLowerVsiEwmaXbarGamEAATS(x, n, hS, deltamin, deltamax, a_shape, b_scale)

lam = x(1);
hL  = x(2);
K1  = x(3);
K2  = x(4);

EAATS1= EAATSFindLowerVsiEwmaXbarGam(n, deltamin, deltamax, hL, hS, lam, K1, K2, a_shape, b_scale) ;

if EAATS1 <= 0
    f = Inf;
else
    f = EAATS1;
end

end
