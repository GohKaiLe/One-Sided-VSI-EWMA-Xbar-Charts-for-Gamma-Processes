% Lower One-sided VSI EWMA X-bar Chart for Gamma %
% Zero State %
% Output for EATS %

function stop = OutFunLowerVsiEwmaXbarGamEATS(x, optimValues, state, n, hS, deltamin, deltamax, ~, a_shape, b_scale)

stop = false;

if strcmp(state, 'iter')

    lam = x(1);
    hL  = x(2);
    K1  = x(3);
    K2  = x(4);

    % In-control performance
    [ATS0, ~, ASI0] = TsLowerVsiEwmaXbarGam(n, hL, hS, lam, K1, K2, 0, a_shape, b_scale);

    % Out-of-control ATS
    EATS1 = EATSFindLowerVsiEwmaXbarGam(n, deltamin, deltamax, hL, hS, lam, K1, K2, a_shape, b_scale) ;

    fprintf(['Iter %4d | lam = %6.4f  hL = %6.4f  ', ...
             'K1 = %6.4f  K2 = %6.4f  ', ...
             'EATS1 = %8.2f ATS0 = %8.2f  ASI0 = %6.4f\n'], ...
             optimValues.iteration, lam, hL, K1, K2, EATS1, ATS0, ASI0);
end
end
