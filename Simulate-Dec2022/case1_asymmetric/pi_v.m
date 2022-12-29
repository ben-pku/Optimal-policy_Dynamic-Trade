function f = pi_v(Par, x1, x2)
% Payoff function: PI (x1, x2)
f = (1-x2) + Par.D * ((x1.^Par.gamma) .* x2).^Par.eta; 

end

