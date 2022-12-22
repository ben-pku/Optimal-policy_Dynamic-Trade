function V1 = Bellman(Par, V0, Grid, xp )
%BELLMAN 
% Evaluate the RHS of the Bellman equation given guessed value function
% x n * 1 grid of labor in sector 2
% xp n * 1 grid of labor in sector 2
% V0 initial guess

pi = Par.D1 * ((1- Grid.x).^Par.gamma1 .* (1-xp) ).^( (Par.sigma1-1)/Par.sigma1 )+...
    Par.D2 * ( (Grid.x).^Par.gamma2 .* xp ).^( (Par.sigma2-1)/Par.sigma2 );

% interpolation
V0p = interp1(Grid.x, V0, xp, 'spline');
V1 = pi + Par.delta* V0p;

end

