% Lower One-sided VSI EWMA X-bar Chart for Gamma %
% Steady State %
% Output for AATS %

function stop = OutFunLowerVsiEwmaXbarGamSteady(x, optimValues, state, n, hS, delta, ~, a_shape, b_scale)

stop = false;

if strcmp(state, 'iter')

    lam = x(1);
    hL  = x(2);
    K1  = x(3);
    K2  = x(4);

    % In-control performance
    [AATS0, ~, ASI0] = TsLowerVsiEwmaXbarGamSteady(n, hL, hS, lam, K1, K2, 0, a_shape, b_scale);

    % Out-of-control ATS
    [AATS1, SDATS1, ~] = TsLowerVsiEwmaXbarGamSteady(n, hL, hS, lam, K1, K2, delta, a_shape, b_scale);

    fprintf(['Iter %4d | lam = %6.4f  hL = %6.4f  ', ...
             'K1 = %6.4f  K2 = %6.4f  ', ...
             'AATS1 = %8.2f SDATS1 = %8.2f AATS0 = %8.2f  ASI0 = %6.4f\n'], ...
             optimValues.iteration, lam, hL, K1, K2, AATS1, SDATS1, AATS0, ASI0);
end
end
