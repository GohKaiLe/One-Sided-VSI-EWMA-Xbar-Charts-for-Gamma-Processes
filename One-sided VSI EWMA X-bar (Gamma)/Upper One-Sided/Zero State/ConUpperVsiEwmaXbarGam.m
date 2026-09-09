% Upper One-sided VSI EWMA X-bar Chart for Gamma %
% Zero State %
% Constraints %

function [c, ceq] = ConUpperVsiEwmaXbarGam(x, n, hS, tau0, a_shape, b_scale)

lam = x(1);
hL  = x(2);
K1  = x(3);
K2  = x(4);

% Inequality constraint: K1 < K2
c = K1 - K2;     % must be ≤ 0

% In-control performance
[ATS0, ~, ASI0] = TsUpperVsiEwmaXbarGam(n, hL, hS, lam, K1, K2, 0, a_shape, b_scale);

% Equality constraints
ceq = [
    ATS0 - tau0
    ASI0 - 1
];
end
