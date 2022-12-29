%% solve the general myopic steady states
g = linspace(0.01, 0.4, 4);
for i = 1 : 4
    delta=0;
    sigma1=5; 
    sigma2=5;
    gamma1=0.3;
    gamma2=g(i);
    D = 1;
    Par = para(delta, sigma1, sigma2, gamma1, gamma2, D);
    Grid.x = linspace(1e-5, 1-1e-5, 1e3)'; % labor in sector 2
    size1 = size(Grid.x);
    Grid.nx = size1(1);

    figure(2);
    pi2 = @(x,y) Par.eta2*Par.D* ( x.^(-Par.alpha2) .* y ) .^(Par.eta2-1) - Par.eta1 * ((1-x).^(-Par.alpha1) .* (1-y)).^(Par.eta1-1);
    fimplicit(pi2, [0 1 0 1]);
    hold on 
  
end

    plot(Grid.x, Grid.x, ":r");
    legend("$\gamma_2=0.01$","$\gamma_2=0.14$","$\gamma_2=0.27$","$\gamma_2=0.4$",'Interpreter', 'LaTeX','location','Northwest')
    xlabel("x");
    ylabel("$y$",'Interpreter', 'LaTeX');
    title("Analytical policy function $\pi_2(x,y)=0$",'Interpreter', 'LaTeX');