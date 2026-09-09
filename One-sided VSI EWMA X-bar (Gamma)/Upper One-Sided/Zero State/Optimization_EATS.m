%% Simultaneous optimisation of Upper One-sided VSI EWMA Xbar Chart 
% Gamma distribution
% EATS Optimisation 

clearvars ;
clc ;

tic ; 

a_shape = 1.4148 ;
b_scale = 36.4364 ;

n     = 5 ;
hS    = 0.01 ;
deltamin = 0.03 ;
deltamax = 2.00 ; 
tau0  = 370.40 ;

[lam, hL, K1, K2, EATS1, ATS0, ASI0] = OptAtsUpperVsiEwmaXbarGamEATS(n, hS, deltamin, deltamax, tau0, a_shape, b_scale) ;

disp('--------------------------------------------')
disp(['For Gamma distribution  : Shape (a)  = ', num2str(a_shape,'%0.0f'), ', Scale (b) = ', num2str(b_scale,'%0.0f')])
disp(['Sampling Intervals      : Short (hS) = ', num2str(hS,'%0.2f'), ', Long (hL) = ', num2str(hL,'%0.4f')])
disp(['The sample size- Minimum: ', num2str(deltamin,'%0.2f'), ', Maximum= ', num2str(deltamax,'%0.2f')])
disp(['Lambda                  : ', num2str(lam,'%0.4f')])
disp(['K1                      : ', num2str(K1,'%0.4f')])
disp(['K2                      : ', num2str(K2,'%0.4f')])
disp(['EATS1                   : ', num2str(EATS1,'%0.2f')])
disp(['ATS0                    : ', num2str(ATS0,'%0.2f')])
disp(['ASI0                    : ', num2str(ASI0,'%0.2f')])
disp('--------------------------------------------')

EATSresults = [deltamin, deltamax, n, hS, lam, hL, K1, K2, EATS1, ATS0, ASI0] ; 

delta_list = 0.10:0.1:2.00 ;

% Preallocate results matrix
% Columns:
% [delta, n, hS, lam, hL, K1, K2, ATS1, SDTS1, ATS0, ASI0]
Results = zeros(length(delta_list), 11);

for i = 1:length(delta_list)

    delta = delta_list(i);

    [ATS1, SDTS1, ~] = TsUpperVsiEwmaXbarGam(n, hL, hS, lam, K1, K2, delta, a_shape, b_scale) ; 

    [ATS0, ~, ASI0] = TsUpperVsiEwmaXbarGam(n, hL, hS, lam, K1, K2, 0, a_shape, b_scale) ; 

    % Display summary
    disp('--------------------------------------------')
    disp(['Delta                   : ', num2str(delta,'%0.2f')])
    disp(['Lambda                  : ', num2str(lam,'%0.4f')])
    disp(['hL                      : ', num2str(hL,'%0.4f')])
    disp(['K1                      : ', num2str(K1,'%0.4f')])
    disp(['K2                      : ', num2str(K2,'%0.4f')])
    disp(['ATS1                    : ', num2str(ATS1,'%0.2f')])
    disp(['SDTS1                   : ', num2str(SDTS1,'%0.2f')])
    disp(['ATS0                    : ', num2str(ATS0,'%0.2f')])
    disp(['ASI0                    : ', num2str(ASI0,'%0.4f')])
    disp('--------------------------------------------')

    % Store results
    Results(i,:) = [delta, n, hS, lam, hL, K1, K2, ATS1, SDTS1, ATS0, ASI0 ];

end

% Final results table
disp('========== FINAL RESULTS ==========')
disp(['Gamma distribution parameters : Shape (a) = ', num2str(a_shape,'%0.0f'), ', Scale (b) = ', num2str(b_scale,'%0.0f')])
disp('Columns: [delta, n, hS, lam, hL, K1, K2, ATS1, SDTS1, ATS0, ASI0]')
disp(Results)

toc;
