function f = pi_v(Par, x1, x2)
%PI 
f = Par.D1 * ((1-x1).^Par.gamma1 .* (1-x2)) .^( (Par.sigma1-1)/Par.sigma1 )+ Par.D2 * ((x1.^Par.gamma2) .* x2).^( (Par.sigma2-1)/Par.sigma2 ); 

end

