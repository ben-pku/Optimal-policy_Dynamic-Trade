function f = pi(Par, x1, x2)
%PI 
f = (1-x1).^Par.gamma1 .* (1-x2) + Par.D * ((x1.^Par.gamma2) .* x2).^( (Par.sigma-1)/Par.sigma ); 

end

