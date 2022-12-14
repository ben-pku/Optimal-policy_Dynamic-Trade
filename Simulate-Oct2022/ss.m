function  F  = ss(un, L1, pa)
%% SS Steady State nonlinear system
%   equilibrium conditions of Steady State
% L1: 2*1  here L1 is the labor allocation in t
    
    w = un(:,1);
    lambda = un(:, 2);
    p = un(:, 3);
    
    F = zeros(3 * pa.s,1);
    gdp = L1' * w;
    
    % L
    F(1:2) = -L1 + pa.alpha ./ (1-lambda.* (1-pa.alpha)) .* ...
        ( gdp * lambda .* pa.beta + pa.D .* p.^(1-pa.sigma) ) ./ w ;
    
    % p
    ex1 = (1- pa.alpha)./ (pa.alpha .* (pa.sigma -1) )  ;
    ex2 = pa.gamma1+ pa.gamma0;
    F(3:4) = -p + w .* lambda.^(ex1) ./ (pa.T .* L1.^ex2 ); 
    
    % lambda
    F(5 : 6) = - lambda + p.^(1-pa.sigma) ./ ( p.^(1-pa.sigma) + pa.ps.^(1-pa.sigma)  );

end

