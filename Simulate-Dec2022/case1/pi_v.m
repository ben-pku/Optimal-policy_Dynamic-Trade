function f = pi_v(Par, x1, x2)
%PI 
f = (1-x2) + Par.D * ((x1.^Par.gamma2) .* x2).^( (Par.sigma-1)/Par.sigma ); 

end

