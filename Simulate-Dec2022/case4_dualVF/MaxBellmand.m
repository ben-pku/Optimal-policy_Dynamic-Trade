function [V1, xp] = MaxBellmand( Par, V0, Grid )
%MAXBELLMAN -- downward PF
% Maximizes the RHS of the Bellman equation using golden section search
% Inputs
% Grid n*1

p = (sqrt(5)-1)/2;

A = Grid.x(1) * ones(Grid.nx,1);  % min the first experiment
D = Grid.x;  % max is x

B = p*A + (1-p)*D;
C = (1-p)*A + p*D;

fB = Bellmand(Par, V0, Grid, B);
fC = Bellmand(Par, V0, Grid, C);

MAXIT = 1e5;
for it = 1: MAXIT
      if all(D-A < 1e-6)
          if it>=MAXIT
              disp("fail");
          else
            break
          end
      end
      
      I = fB > fC;
      
      D(I) = C(I); % discard  [C, D], C becomes D, 
      C(I) = B(I); %B becomes C
      fC(I) = fB(I);
      B(I) = (1-p)*A(I) + p*C(I); % calculate new B
      fB_fulleval = Bellmand(Par, V0, Grid, B);
      % Bellman can only evaluate the whole grid
      fB(I) = fB_fulleval(I);
      
      A(~I) = B(~I); % discard [A,B] B becomes A
      B(~I) = C(~I); % C becomes B
      fB(~I) = fC(~I) ;
      C(~I) = p*B(~I) + (1-p)*D(~I); % calculate new C
      fC_fulleval = Bellmand(Par, V0, Grid, C);
      % Bellman can only evaluate the whole grid
      fC(~I) = fC_fulleval(~I);

end

% now our ABCD are all within a small epsilon of one another. We will use
% the average of B and C as the optimal level of allocations
xp = (B+C)/2;

% evaluate the Bellman equation to find the new value function
V1 = Bellmand(Par, V0, Grid, xp);


end

