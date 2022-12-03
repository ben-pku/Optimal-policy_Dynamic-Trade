%% simulate the value function
% Dec, 2, 2022

% % add VFItoolkit
% addpath("c:\Users\Benjamin Hwang\Documents\Andres-Roduiguez-Clare-2022\code\VFIToolkit-matlab-master\VFIToolkit-matlab-master")

% setup parameters
beta=0.98;
sigma=5; 
gamma1=0.3;
gamma2=0.3;
D = 1.3;
Par = para(beta, sigma, gamma1, gamma2, D);

% Grids
% set up grids for labor
Grid.nx = 1e3;
Grid.x = linspace(1e-4, 1-1e-4, Grid.nx)';
VFIPar.V0 = 1/(1-Par.beta) * ones(Grid.nx,1);
VFIPar.xp0 = 1/2* ones(Grid.nx,1);

% VFI
VFIPar.maxiter = 1e4;
VFIPar.tol = 1e-3;
[V, xp] = VFI(Par, VFIPar, Grid);

%% Plot
% plot the value function
figure(1);
plot(Grid.x, V);
xlabel("x");
ylabel("Value Function, V(x)");
title("V(x) -- x");

figure(2);
plot(Grid.x, xp);
xlabel("x");
ylabel("Policy Function, x'");
title("x' -- x");

% plot the pi(x,x)--x
figure(3);
Pi = pi(Par, Grid.x, Grid.x);
plot(Grid.x, Pi);
xlabel("x");
ylabel("\pi(x,x)");
title("\pi(x,x) -- x");

figure(4);
% middle equi
y = (1-Grid.x).^Par.gamma1 - Par.D * Grid.x.^(( Par.gamma1*(Par.sigma-1)-1)/Par.sigma );
plot(Grid.x, y);

hold on
% min pi
z = (1-Grid.x).^Par.gamma1 - Par.D * (Par.sigma-1)/Par.sigma * Grid.x.^(( Par.gamma1*(Par.sigma-1)-1)/Par.sigma );
plot(Grid.x, z);
xlabel("x");
ylabel("first deri");
title("find the root");
yline(0,'r:');
xline(0,'r:');
legend("middle equi", "min \pi")


