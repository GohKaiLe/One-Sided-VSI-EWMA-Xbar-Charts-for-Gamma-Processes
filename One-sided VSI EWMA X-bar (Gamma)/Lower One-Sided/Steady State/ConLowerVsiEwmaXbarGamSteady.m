% Lower One-sided VSI EWMA X-bar Chart for Gamma %
% Steady State %
% Constraints %

function [c, ceq] = ConLowerVsiEwmaXbarGamSteady(x, n, hS, tau0, a_shape, b_scale)

lam = x(1);
hL  = x(2);
K1  = x(3);
K2  = x(4);

% Inequality constraint: K1 < K2
c = K1 - K2;     % must be ≤ 0

% In-control performance
[AATS0, ~, ASI0] = TsLowerVsiEwmaXbarGamSteady(n, hL, hS, lam, K1, K2, 0, a_shape, b_scale);

% Equality constraints
ceq = [
    AATS0 - tau0
    ASI0 - 1
];
end
