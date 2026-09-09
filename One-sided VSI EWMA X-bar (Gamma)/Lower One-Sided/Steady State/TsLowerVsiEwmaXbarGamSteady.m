% Lower One-sided VSI EWMA X-bar Chart for Gamma %
% Steady State %
% Create a function to find AATS, SDATS and ASI %

function [AATS, SDATS, ASI] = TsLowerVsiEwmaXbarGamSteady(n, hL, hS, lam, K1, K2, delta, a_shape, b_scale)

mu0 = a_shape * b_scale ; % mean for gamma
sigma0 = sqrt(a_shape * b_scale ^ 2) ; % standard deviation for gamma

CL = mu0 ; % centre limit 
LWL = mu0 - K1 * sqrt(lam/(n*(2 - lam))) * sigma0 ; % Lower warning limit 
LCL = mu0 - K2 * sqrt(lam/(n*(2 - lam))) * sigma0 ; % Lower control limit 

% Markov chain %

p = 200 ; 
dr = (CL - LCL) / (2 * p) ;
hr = [CL, CL - dr : -2 * dr : LCL + dr] ; 

b = hS * ones(p + 1, 1) ; 
b((LWL < hr)) = hL ;

Hj = ones(p + 1, 1) * hr ; 
Hi = Hj' ;
Q1 = (Hj + dr - (1 - lam) * Hi) / lam ; 
Q2 = (Hj - dr - (1 - lam) * Hi) / lam ; 

Q = gamcdf(Q1 - delta * sigma0, n * a_shape, b_scale/n) - gamcdf(Q2 - delta * sigma0, n * a_shape, b_scale/n) ; 
Q0 = (mu0 - (1 - lam) * hr') / lam ; 
Q(:, 1) = 1 - gamcdf(Q0 - delta * sigma0, n * a_shape, b_scale/n) ; 

q = zeros(p + 1, 1) ; 
q(1, 1) = 1 ; 
I = eye(p + 1) ; 
one = ones(p+1, 1) ; 
q0 = ((inv(I - Q')) * q ) / (one' * (inv(I - Q')) * q) ;

alpha = zeros(p + 1, 1) ; 
for i = 1:(p + 1) 
    alpha(i) = (q0(i) * b(i)) / (q0' * b) ; 
end

AATS = alpha' * ((inv(I - Q)) - I/2) * b ;

E = diag(b) ; 
V1 = (2 * (inv(I - Q))) - I ;  
V2 = (1/2) * E - (1/4) * b * alpha' ;   

SDATS = sqrt(alpha' * (V1 * V2 * V1 - (1/6) * E) * b) ; 

ASI = (q0' * (inv(I - Q)) * b) / (q0' * (inv(I - Q)) * ones(p + 1, 1)) ;

end