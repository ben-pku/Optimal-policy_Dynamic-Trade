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
legend("V(x)","$\frac{\pi(x,x)}{1-\beta}$", 'Interpreter', 'LaTeX');


subplot(2,2,2)
plot(Grid.x, xp);
hold on 
plot(Grid.x, Grid.x, ":r");
xlabel("x");
ylabel("x'");
title("Policy Function,");

% plot the pi(x,x)--x
subplot(2,2,3)

plot(Grid.x, pi_v1);
% ylim([0.95 , 1.33]);
xlabel("x");
ylabel("\pi(x,x)");
title("\pi(x,x) -- x");

subplot(2,2,4)
% % 1 middle equi
% y = -(1-Grid.x).^Par.gamma1 + Par.D * (Par.sigma-1)/Par.sigma* Grid.x.^(( Par.gamma1*(Par.sigma-1)-1)/Par.sigma );
% plot(Grid.x, y, 'LineWidth', 1);
% hold on
% % 2 min pi
% z = -(1+Par.gamma1)*(1-Grid.x).^Par.gamma1 + Par.D *(1+Par.gamma2)* (Par.sigma-1)/Par.sigma * Grid.x.^(( Par.gamma1*(Par.sigma-1)-1)/Par.sigma );
% plot(Grid.x, z);
% hold on
% 3 pi_2
% pi_2 = -1+ Par.D* (Par.sigma-1)/Par.sigma *  Grid.x.^(( Par.gamma1*(Par.sigma-1)-1)/Par.sigma );
%plot(Grid.x, pi_2);
%hold on
d = V-lpi;
plot(Grid.x, V-lpi);
yline(0, ':r');
xlabel("x");
ylabel("$V(x)-\frac{\pi(x,x)}{1-\delta}$", "Interpreter", "LaTeX");
title("Verify: $V(x) \geq \frac{\pi(x,x)}{1-\delta}$", "Interpreter", "LaTeX");
% yline(0,'r:');
% xline(0,'r:');
% legend("middle equi--\pi_2(x,x)+\beta\pi_1(x,x)=0 ", "min \pi--d(\pi(x,x))/dx=0", "\pi_2(x,x) per se")

Y=1;

end

