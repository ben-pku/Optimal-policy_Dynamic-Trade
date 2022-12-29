%% simulate the value function
% sector1 wlo EES, sector 2 wl EES
% \pi(x,y)=1-y+(x^{\gamma} y)^{\frac{\sigma}{\sigma-1}}.
% Dec, 25, 2022

% Grids
% set up grids for labor
Grid.nx = 1e3;
Grid.x = linspace(1e-5, 1-1e-5, Grid.nx)';
VFIPar.V0 =  ones(Grid.nx,1);
VFIPar.xp0 = 1/2* ones(Grid.nx,1);
VFIPar.maxiter = 1e5;
VFIPar.tol = 1e-8;
VFIPar.Hnumitersupdate = 10;


% %% 1. myopic case
% % setup parameters
% delta=0;
% sigma=5;       % sector 2
% gamma=0.2 ; % sector 2
% D = 1.3;         % sector 2
% Par1 = para(delta, sigma, gamma, D);
% % VFI
% [V1, xp1] = VFI(Par1, VFIPar, Grid);
% %x1 = threshold(Par1);
% % Plot
% drawer(Par1, Grid, V1, xp1);

%% 2. increase the discount factor
delta2 = 0.1;
sigma=5; 
gamma2=0.5;
D = 1.3;
Par2 = para(delta2, sigma, gamma2, D);
VFIPar.V0 = ones(Grid.nx, 1) ; %1/(1-delta2)* ones(Grid.nx,1);
VFIPar.xp = ones(Grid.nx,1);
[V2, xp2] = VFI(Par2, VFIPar, Grid);
drawer(Par2, Grid, V2, xp2);
% 
% delta3 = 0.9;
% Par3 = para(delta3, sigma, gamma1, gamma2, D);
% [V3, xp3] = VFI(Par3, VFIPar, Grid);
% x3 = threshold(Par3);
% drawer(Par3, Grid, V3, xp3);
% 
% 
% %% 3. gamma(sigma-1)<1
% delta3=0.9;
% sigma=5; 
% gamma2=0.1;
% D = 1.3;
% Par3 = para(delta3, sigma, gamma2, D);
% VFIPar.V0 = 1/(1-delta3)* ones(Grid.nx,1);
% [V3,xp3] = VFI(Par3, VFIPar, Grid);
% drawer(Par3, Grid, V3, xp3);
% 
% 
% 
% x3 = threshold(Par3);
