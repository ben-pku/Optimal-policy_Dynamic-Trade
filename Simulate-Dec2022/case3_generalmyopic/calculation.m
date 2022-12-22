%% solve the general myopic steady states
g = linspace(0.01, 0.25, 4);
for i = 1 : 4
    delta=0;
    sigma1=5; 
    sigma2=5;
    gamma1=g(i);
    gamma2=0.3;
    D2 = 1;
    Par = para(delta, sigma1, sigma2, gamma1, gamma2, D2);
    Grid.x = linspace(1e-5, 1-1e-5, 1e3)'; % labor in sector 2
    size1 = size(Grid.x);
    Grid.nx = size1(1);

    figure(2);
    pi2 = @(x,y) Par.eta2*Par.D2* ( x.^(-Par.alpha2) .* y ) .^(Par.eta2-1) - Par.eta1 * ((1-x).^(-Par.alpha1) .* (1-y)).^(Par.eta1-1);
    fimplicit(pi2, [0 1 0 1]);
    hold on 
    plot(Grid.x, Grid.x, ":r");
    xlabel("x");
    ylabel("$y$",'Interpreter', 'LaTeX');
    title("Analytical policy function $\pi_2(x,y)=0$",'Interpreter', 'LaTeX');

    
end