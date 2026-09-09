% Lower One-sided VSI EWMA X-bar Chart for Gamma %
% Zero State %
% Create a function to find ATS, SDTS and ASI %

function [ATS, SDTS, ASI] = TsLowerVsiEwmaXbarGam(n, hL, hS, lam, K1, K2, delta, a_shape, b_scale)

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
q(1) = 1 ; 
W = (eye(p + 1, p + 1) - Q)^(-1) ; 

ATS = q' * W * b - q' * b ; 

B = diag(b) ; 
VTS = q' * W * B * (2 * W - eye(p + 1, p + 1)) * b - (q' * W * b) ^ 2 ;  
SDTS = sqrt(VTS) ; 

qss = ((eye(p + 1, p + 1) - Q')^(-1)) * q ; 
qss = qss / sum(qss) ; 
ASI = sum(qss .* b) ;

end