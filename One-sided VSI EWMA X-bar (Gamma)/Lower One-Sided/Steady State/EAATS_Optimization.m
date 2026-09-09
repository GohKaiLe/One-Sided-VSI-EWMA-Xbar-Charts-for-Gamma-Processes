%% Simultaneous optimisation of Lower One-sided VSI EWMA Xbar Chart
% Gamma distribution
% EAATS Optimization 

clearvars ;
clc ;

tic ; 

a_shape = 1 ; 
b_scale = 1 ;

n     = 5 ;
hS    = 0.01 ;
deltamin = -2.00 ;
deltamax = -1.50 ; 
tau0  = 370.4 ;

[lam, hL, K1, K2, EAATS1, AATS0, ASI0] = OptAtsLowerVsiEwmaXbarGamEAATS(n, hS, deltamin, deltamax, tau0, a_shape, b_scale) ;

disp('--------------------------------------------')
disp(['For Gamma distribution  : Shape (a)  = ', num2str(a_shape,'%0.0f'), ', Scale (b) = ', num2str(b_scale,'%0.0f')])
disp(['Sampling Intervals      : Short (hS) = ', num2str(hS,'%0.2f'), ', Long (hL) = ', num2str(hL,'%0.4f')])
disp(['The sample size- Minimum: ', num2str(deltamin,'%0.2f'), ', Maximum= ', num2str(deltamax,'%0.2f')])
disp(['Lambda                  : ', num2str(lam,'%0.4f')])
disp(['K1                      : ', num2str(K1,'%0.4f')])
disp(['K2                      : ', num2str(K2,'%0.4f')])
disp(['EAATS1                  : ', num2str(EAATS1,'%0.2f')])
disp(['AATS0                   : ', num2str(AATS0,'%0.2f')])
disp(['ASI0                    : ', num2str(ASI0,'%0.2f')])
disp('--------------------------------------------')

EAATSresults = [deltamin, deltamax, n, hS, lam, hL, K1, K2, EAATS1, AATS0, ASI0] ; 

delta_list = -0.10:-0.10:-2.00 ; 

% Preallocate results matrix
% Columns:
% [delta, n, hS, lam, hL, K1, K2, AATS1, SDATS1, AATS0, ASI0]
Results = zeros(length(delta_list), 11);

for i = 1:length(delta_list)

    delta = delta_list(i);

    [AATS1, SDATS1, ~] = TsLowerVsiEwmaXbarGamSteady(n, hL, hS, lam, K1, K2, delta, a_shape, b_scale) ; 

    [AATS0, ~, ASI0] = TsLowerVsiEwmaXbarGamSteady(n, hL, hS, lam, K1, K2, 0, a_shape, b_scale) ; 

    % Display summary
    disp('--------------------------------------------')
    disp(['Delta                   : ', num2str(delta,'%0.2f')])
    disp(['Lambda                  : ', num2str(lam,'%0.4f')])
    disp(['hL                      : ', num2str(hL,'%0.4f')])
    disp(['K1                      : ', num2str(K1,'%0.4f')])
    disp(['K2                      : ', num2str(K2,'%0.4f')])
    disp(['AATS1                   : ', num2str(AATS1,'%0.2f')])
    disp(['SDSTS1                  : ', num2str(SDATS1,'%0.2f')])
    disp(['AATS0                   : ', num2str(AATS0,'%0.2f')])
    disp(['ASI0                    : ', num2str(ASI0,'%0.4f')])
    disp('--------------------------------------------')

    % Store results
    Results(i,:) = [delta, n, hS, lam, hL, K1, K2, AATS1, SDATS1, AATS0, ASI0 ];

end

% Final results table
disp('========== FINAL RESULTS ==========')
disp(['Gamma distribution parameters : Shape (a) = ', num2str(a_shape,'%0.0f'), ', Scale (b) = ', num2str(b_scale,'%0.0f')])
disp('Columns: [delta, n, hS, lam, hL, K1, K2, AATS1, SDATS1, AATS0, ASI0]')
disp(Results)

toc;
