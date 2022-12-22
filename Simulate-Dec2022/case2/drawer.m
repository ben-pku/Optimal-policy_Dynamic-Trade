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
ylabel("Policy Function, x'");
title("x' -- x");
% 
% plot the pi(x,x)--x
subplot(2,2,3)

plot(Grid.x, pi_v1);
% ylim([0.95 , 1.33]);
xlabel("x");
ylabel("\pi(x,x)");
title("\pi(x,x) ");
% 

 subplot(2,2,4)
d = V - lpi_v1;
plot(Grid.x, d);
hold on
xlabel("x");
ylabel("$V(x)- \frac{\pi}{1-\delta}$",'Interpreter', 'LaTeX');
title("$V(x)\geq \frac{\pi}{1-\delta}$",'Interpreter', 'LaTeX');
yline(0,'r:');
xline(0,'r:');

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

