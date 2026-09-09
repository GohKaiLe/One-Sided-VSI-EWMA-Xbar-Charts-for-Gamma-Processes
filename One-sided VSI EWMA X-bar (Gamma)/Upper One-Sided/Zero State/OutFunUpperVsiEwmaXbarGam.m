% Upper One-sided VSI EWMA X-bar Chart for Gamma %
% Zero State %
% Output %

function stop = OutFunUpperVsiEwmaXbarGam(x, optimValues, state, n, hS, delta, ~, a_shape, b_scale)

stop = false;

if strcmp(state, 'iter')

    lam = x(1);
    hL  = x(2);
    K1  = x(3);
    K2  = x(4);

    % In-control performance
    [ATS0, ~, ASI0] = TsUpperVsiEwmaXbarGam(n, hL, hS, lam, K1, K2, 0, a_shape, b_scale);

    % Out-of-control ATS
    [ATS1, SDTS1, ~] = TsUpperVsiEwmaXbarGam(n, hL, hS, lam, K1, K2, delta, a_shape, b_scale);

    fprintf(['Iter %4d | lam = %6.4f  hL = %6.4f  ', ...
             'K1 = %6.4f  K2 = %6.4f  ', ...
             'ATS1 = %8.2f SDTS1 = %8.2f ATS0 = %8.2f  ASI0 = %6.4f\n'], ...
             optimValues.iteration, lam, hL, K1, K2, ATS1, SDTS1, ATS0, ASI0);
end
end
