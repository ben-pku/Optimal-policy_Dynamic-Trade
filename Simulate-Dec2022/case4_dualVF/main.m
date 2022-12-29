%% simulate the value function -- Dual VF algorithm
% sector1 wlo EES, sector 2 wl EES
% \pi(x,y)=1-y+(x^{\gamma} y)^{\frac{\sigma}{\sigma-1}}.
% Dec, 27, 2022

% Grids
% set up grids for labor
Grid.nx = 1e4;
Grid.x = linspace(1e-5, 1-1e-5, Grid.nx)';
VFIPar.V0 =  ones(Grid.nx,1);
VFIPar.xp0 = 1/2* ones(Grid.nx,1);
VFIPar.maxiter = 1e5;
VFIPar.tol = 1e-4;
VFIPar.Hnumitersupdate = 100;


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
delta2 = 0.40;
sigma=5; 
gamma2=0.5;
D = 1.3;
Par2 = para(delta2, sigma, gamma2, D);
[V1, xp1] = VFI(Par2, VFIPar, Grid);
drawer(1, Par2, Grid, V1, xp1);


VFIPar.V0u = ones(Grid.nx, 1) ; %1/(1-delta2)* ones(Grid.nx,1);
VFIPar.xp0u = ones(Grid.nx,1);
[V2, xp2] = VFIu(Par2, VFIPar, Grid);
drawer(2, Par2, Grid, V2, xp2);

VFIPar.V0d = ones(Grid.nx, 1) ; %1/(1-delta2)* ones(Grid.nx,1);
VFIPar.xp0d = zeros(Grid.nx,1);
[V21, xp21] = VFId(Par2, VFIPar, Grid);
drawer(3, Par2, Grid, V21, xp21);

figure(4);
plot(Grid.x, xp2, Grid.x, xp21, Grid.x,xp1);
hold on 
plot(Grid.x, Grid.x, ":r");
xlabel("x");
ylabel("$y$",'Interpreter', 'LaTeX');
title("Simulated Policy Function", 'Interpreter', 'LaTeX');
legend("$F_u(x)$","$F_d(x)$", "$F(x)$", 'Interpreter', 'LaTeX', 'Location', "best");

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
