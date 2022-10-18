%% Dynamic SOE with EES
% Dynamic Model 2 Sectors Diagonal IO v4

% number of sector, 
num  = 2;


%% steady state
% one example
%                                             gamma1,                           gamma0,                     sigma
 [pa1, state]= parameter(num, [0.08; 0.248].*ones(num,1), [0.09; 0.08].*ones(num,1), [4; 5].*ones(num,1) );
 S1 = solve_ss_rough(pa1);
 E1 = solve_ss( pa1);
 fprintf("Market Equilibrium:\n");
 fprintf("\t labor allocation L1 = %.4f  L2 = %.4f  \n\t welfare: W = %.4f \n", E1.l1, E1.l2, E1.W);
 
 
 %% transition path
 % the same parameters
 l0_1 = 0.5;
 L0 = [l0_1; pa1.L - l0_1 ];
 Path1 = solve_tran(L0 ,pa1);
 
 %% plot
 T =10;
 drawer(T, Path1);
 
 
 

 
 
 

 




 