% AATS Optimisation of the Lower One-sided VSI EWMA X-bar Chart %
% Gamma distribution % 
% Steady State % 

clearvars ;
clc ;

tic ; 

a_shape = 1 ;
b_scale = 1 ;

n     = 5 ;
hS    = 0.01 ;
delta = -2.00 ;
tau0  = 370.4 ;

[lam, hL, K1, K2, AATS1, SDATS1, ASI1, AATS0, ASI0] = OptAtsLowerVsiEwmaXbarGamSteady(n, hS, delta, tau0, a_shape, b_scale) ; 

disp('--------------------------------------------')
disp(['For Gamma distribution  : Shape (a)  = ', num2str(a_shape,'%0.0f'), ', Scale (b) = ', num2str(b_scale,'%0.0f')])
disp(['Sampling Intervals      : Short (hS) = ', num2str(hS,'%0.2f'), ', Long (hL) = ', num2str(hL,'%0.4f')])
disp(['The sample size is      : ', num2str(n,'%0.0f')])
disp(['The shift size (delta)  : ', num2str(delta,'%0.2f')])
disp(['Lambda                  : ', num2str(lam,'%0.4f')])
disp(['K1                      : ', num2str(K1,'%0.4f')])
disp(['K2                      : ', num2str(K2,'%0.4f')])
disp(['AATS1                   : ', num2str(AATS1,'%0.2f')])
disp(['SDSTS1                  : ', num2str(SDATS1,'%0.2f')])
disp(['ASI1                    : ', num2str(ASI1,'%0.2f')])
disp(['AATS0                   : ', num2str(AATS0,'%0.2f')])
disp(['ASI0                    : ', num2str(ASI0,'%0.2f')])
disp('--------------------------------------------')

results = [delta, n, hS, lam, hL, K1, K2, AATS1, SDATS1, AATS0, ASI0] ;
disp(results)

toc;
