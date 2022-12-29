function Y = drawer(Par, Grid, V, xp )
%DRAWER draw
% plot the value function
figure(1);
subplot(2,2,1);
plot(Grid.x, V);
hold on
xlabel("x");
pi_v1 = pi_v(Par, Grid.x, Grid.x);
lpi = pi_v1/(1-Par.delta);
% ylim([48 , 66]);
plot(Grid.x, lpi);
title("V(x), $\frac{\pi(x,x)}{1-\delta}$", 'Interpreter', 'LaTeX');
legend("$V(x)$","$\frac{\pi(x,x)}{1-\beta}$", 'Interpreter', 'LaTeX', 'Location', "Northwest");


subplot(2,2,2)
plot(Grid.x, xp);
hold on 
plot(Grid.x, Grid.x, ":r");
xlabel("x");
ylabel("$y$",'Interpreter', 'LaTeX');
title("Simulated Policy Function", 'Interpreter', 'LaTeX');

% plot the pi_2(x,x)--x  find the interior  fixed point
subplot(2,2,3)
pi_2 = -1 + Par.D * Par.eta * Grid.x.^((Par.gamma+1)*Par.eta-1);
plot(Grid.x, pi_2);
yline(0, ':r');
xlabel("x");
ylabel("$\pi_2(x,x)$", 'Interpreter', 'LaTeX');
title("Myopic Interior Fixed Point", 'Interpreter', 'LaTeX');

subplot(2,2,4);
policy = @(x,y)-1 + Par.D * Par.eta * x.^(Par.gamma*Par.eta) .* y.^(-1/Par.sigma);
fimplicit(policy, [ 0 1 0 1.5 ] );
hold on 
plot(Grid.x, Grid.x, ":r");
yline(1, ':r');
xlabel("x");
ylabel("$y$",'Interpreter', 'LaTeX');
title("Myopic analytical policy function $\pi_2(x,y)=0$",'Interpreter', 'LaTeX');
% yline(0,'r:');
% xline(0,'r:');
% legend("middle equi--\pi_2(x,x)+\beta\pi_1(x,x)=0 ", "min \pi--d(\pi(x,x))/dx=0", "\pi_2(x,x) per se")

Y=1;

end

