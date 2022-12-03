function F = tran(un, L1, L0, pa)
%% TRAN time-t equilibrium
%   time-t equilibrium conditions, including some intertemporal equations
% L1: 2*1 (current labor)  L0: 2*1(past labor)
    
    w = un(:,1); % 2x1
    lambda = un(:, 2); % 2x1
    p = un(:, 3); % 2x1
    
    F = zeros(3 * pa.s,1);
    gdp = L1' * w;
    
    % L
    F(1:2) = -L1 + pa.alpha ./ (1-lambda.* (1-pa.alpha)) .* ...
        ( gdp * lambda .* pa.beta + pa.D .* p.^(1-pa.sigma) ) ./ w ;
    
    % p
    ex1 = (1- pa.alpha)./ (pa.alpha .* (pa.sigma -1) )  ;
    
    F(3:4) = -p + w .* (lambda.^(ex1) ) ./ (pa.T .* (L1 .^pa.gamma1) .* (L0.^pa.gamma0) ); 
    
    % lambda
    F(5:6) = - lambda + p.^(1-pa.sigma) ./ ( p.^(1-pa.sigma) + pa.ps.^(1-pa.sigma)  );
end

