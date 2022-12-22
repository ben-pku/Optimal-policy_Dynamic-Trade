% simulate the value function

% Dec, 20, 2022

%% general case
% setup parameters
delta=0;
sigma1=5; 
sigma2=5;
gamma1=0.22;
gamma2=0.12;
D2 = 1;
Par = para(delta, sigma1, sigma2, gamma1, gamma2, D2);


% Grids
% set up grids for labor

%Grid.x = [linspace(1e-9, 0.4999, 1e2)' ;  linspace(0.4999+1e-9, 0.5001-1e-9, 1e5)'  ; linspace(0.5001+1e-9, 1-1e-9, 1e2)'];
Grid.x = linspace(1e-5, 1-1e-5, 1e3)'; % labor in sector 2
size1 = size(Grid.x);
Grid.nx = size1(1);
VFIPar.V0 = ones(Grid.nx,1);
VFIPar.xp0 = 1/2* ones(Grid.nx,1);

% VFI
VFIPar.maxiter = 1e8;
VFIPar.tol = 1e-8;
VFIPar.Hnumitersupdate = 2;
[V, xp] = VFI(Par, VFIPar, Grid);

drawer(Par, Grid, V, xp);

%% plot pi_2(x,y)
figure(2);
pi2 = @(x,y) Par.eta2*Par.D2* ( x.^(-Par.alpha2) .* y ) .^(Par.eta2-1) - Par.eta1 * ((1-x).^(-Par.alpha1) .* (1-y)).^(Par.eta1-1);
fimplicit(pi2, [-1 1 -1 1]);
hold on 
plot(Grid.x, Grid.x, ":r");

% pi1 = -Par.D1 * Par.eta1 * Par.gamma1 * (1-xp).^( Par.eta1) .*(1-Grid.x).^(Par.gamma1*Par.eta1-1) ...
%     + Par.D2 * Par.gamma2 * Par.eta2 * ( xp.^Par.eta2) .* Grid.x.^(Par.gamma2*Par.eta2-1);
% plot(Grid.x, pi1);
% yline(0,":r")


