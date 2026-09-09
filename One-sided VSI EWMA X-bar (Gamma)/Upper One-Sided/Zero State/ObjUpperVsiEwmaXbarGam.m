% Upper One-sided VSI EWMA X-bar Chart for Gamma %
% Zero State %
% Objective Function %

function f = ObjUpperVsiEwmaXbarGam(x, n, hS, delta, a_shape, b_scale)

lam = x(1);
hL  = x(2);
K1  = x(3);
K2  = x(4);

[ATS1, ~, ~] = TsUpperVsiEwmaXbarGam(n, hL, hS, lam, K1, K2, delta, a_shape, b_scale);

if ATS1 <= 0
    f = Inf;
else
    f = ATS1;
end

end
