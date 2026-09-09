% Upper One-sided VSI EWMA X-bar Chart for Gamma %
% Zero State %
% Objective Function for EATS%

function f = ObjUpperVsiEwmaXbarGamEATS(x, n, hS, deltamin, deltamax, a_shape, b_scale)

lam = x(1);
hL  = x(2);
K1  = x(3);
K2  = x(4);

EATS1= EATSFindUpperVsiEwmaXbarGam(n, deltamin, deltamax, hL, hS, lam, K1, K2, a_shape, b_scale) ;

if EATS1 <= 0
    f = Inf;
else
    f = EATS1;
end

end
