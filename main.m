%% Dynamic SOE with EES
% Dynamic Model 2 Sectors Diagonal IO v4
% number of sector, 
num  = 2;

% %% steady state
% %1. one example without io link                        
%                                                      
%  [pa1, state]= parameter(num, [0.29; 0.30].*ones(num,1),...    gamma1,
%                                              [0.103; 0.21].*ones(num,1),...    gamma0,
%                                              [4; 4.2].*ones(num,1), ...           sigma
%                                              ones(num, 1) );            %         alpha   
%  S1 = solve_ss_rough(pa1); 
%  %E1 = solve_ss( pa1 ) ;
% 
%  fprintf("Market Equilibrium:\n");
%  fprintf("\t labor allocation L1 = 1  L2 = 0; welfare: W = %.4f \n", S1.W1);
%  fprintf("\t labor allocation L1 = 0  L2 = 1; welfare: W = %.4f \n", S1.W2);
%  
%  
%  %% transition path
%  % 1. simplest case without io link, without EES
%  [pa0, state] = parameter(num, zeros(num, 1), ...  % EES==0
%                                                zeros(num, 1), ...  % EES==0
%                                                [4; 4.2].*ones(num,1), ... 
%                                                ones(num, 1) );  % alpha ==1
%   
%  % the same parameters
%  l0_1 = 0.2;
%  L0 = [l0_1* pa0.L; pa0.L * (1- l0_1) ];
%  Path1 = solve_tran(L0 ,pa0);
%  
% % % plot
% %  T =10;
% %  drawer(T, Path1);
% 
% 
% 
% % 2. general case without io link, but with EES
% 
%  [pa1, state]= parameter(num, [0.29; 0.30].*ones(num,1),...    gamma1,
%                                              [0.103; 0.21].*ones(num,1),...    gamma0,
%                                              [4; 4.2].*ones(num,1), ...           sigma
%                                               ones(num, 1) );            %         alpha   
%  % % research on this system with different initial labor (time-t equilibrium)
%     re = timet([0.19 0.191], pa1);  
%    
%    save re;
%    load re;
% 
%    figure(2);
%    drawer(re.Path1, pa1);
%    drawer(re.Path2, pa1);
%    drawer(re.Path3, pa1);
%    drawer(re.Path4, pa1);
%    drawer(re.Path5, pa1);
 
   
   % 3. general case with io link, but with EES (not robust, just a trial)

 [pa2, state]= parameter(num, [0.29; 0.30].*ones(num,1),...    gamma1,
                                             [0.103; 0.21].*ones(num,1),...    gamma0,
                                             [4; 4.2].*ones(num,1), ...           sigma
                                             [0.6; 0.6] .* ones(num, 1) );            %         alpha   
 % % research on this system with different initial labor (time-t equilibrium)
 S2 = solve_ss_rough(pa2); 
    re2 = timet([0.1 0.3], pa2);  
   
   save re2;
   load re2;

   figure(3);
   drawer(re2.Path1, pa2);
   drawer(re2.Path2, pa2);
   drawer(re2.Path3, pa2);
   drawer(re2.Path4, pa2);
   drawer(re2.Path5, pa2);
 

 