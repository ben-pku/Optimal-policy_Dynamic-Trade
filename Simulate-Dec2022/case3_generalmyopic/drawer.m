function Y = drawer(Par, Grid, V, xp)
%DRAWER 
% plot the value function
figure(1);
subplot(2,2,1);
plot(Grid.x, V);
hold on
pi_v1 = pi_v(Par, Grid.x, Grid.x);
lpi_v1 = pi_v1/(1-Par.delta);  % lifetime \pi
plot(Grid.x, lpi_v1);
xlabel("x");
ylabel("V(x) or $\frac{\pi(x,x)}{1-\delta}$" , 'Interpreter', 'LaTeX');
% ylim([48 , 66]);
title("Value function and lifetime utility");
legend("V(x)","$\frac{\pi(x,x)}{1-\delta}$", 'Interpreter', 'LaTeX');
% 
subplot(2,2,2)
plot(Grid.x, xp);
hold on 
plot(Grid.x, Grid.x, ":r");
xlabel("x");
ylabel("y", "Interpreter", "LaTeX");
title("Simulated policy function", "Interpreter", "LaTeX");
% 
% plot the pi_2(x,x)--x
subplot(2,2,3)
pi_2 = Par.eta2 * Par.D * Grid.x .^((Par.alpha2-1)*(1-Par.eta2)) ...
    - Par.eta1 * (1-Grid.x) .^( (Par.alpha1-1)*(1-Par.eta1) );
plot(Grid.x, pi_2);
yline(0, ':r');
% ylim([0.95 , 1.33]);
xlabel("x");
ylabel("\pi_2(x,x)");
title("Interior Fixed Point");
% 

% plot the pi_2(x,y), implicit policy function here
subplot(2,2,4)
policy = @(x,y) Par.eta2 * Par.D * x.^(Par.gamma2*Par.eta2) .* y.^(Par.eta2-1) ...
    - Par.eta1 * (1-x).^(Par.eta1*Par.gamma1) .* (1-y).^(Par.eta1-1)  ;
fimplicit(policy, [ 0 1 0 1 ] );
hold on 
plot(Grid.x, Grid.x, ":r");
xlabel("x");
ylabel("$y$",'Interpreter', 'LaTeX');
title("Analytical policy function $\pi_2(x,y)=0$",'Interpreter', 'LaTeX');



% figure(2);
% plot(Grid.x, V);
% hold on
% pi_v1 = pi_v(Par, Grid.x, Grid.x);
% lpi_v1 = pi_v1/(1-Par.beta);  % lifetime \pi
% plot(Grid.x, lpi_v1);
% xlabel("x");
% ylabel("V(x) or $\frac{\pi(x,x)}{1-\beta}$" , 'Interpreter', 'LaTeX');
% % ylim([48 , 66]);
% title("Value function and lifetime utility, \beta=0.7");
% legend("V(x)","$\frac{\pi(x,x)}{1-\beta}$", 'Interpreter', 'LaTeX');

Y = 1;

end

