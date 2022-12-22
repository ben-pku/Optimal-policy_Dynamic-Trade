function V1 = Bellman(Par, V0, Grid, xp )
%BELLMAN 
% Evaluate the RHS of the Bellman equation given guessed value function
% x n * 1 grid of labor in sector 2
% xp n * 1 grid of labor in sector 2
% V0 initial guess

% pi = (1- Grid.x).^Par.gamma1 .* (1-xp) + Par.D * ( (Grid.x).^Par.gamma2 .* xp ).^( (Par.sigma-1)/Par.sigma );
pi = 1-xp + Par.D * ( (Grid.x).^Par.gamma2 .* xp ).^( (Par.sigma-1)/Par.sigma );

% interpolation 
V0p = interp1( Grid.x, V0, xp, 'linear');

V1 = pi + Par.delta* V0p;

end
