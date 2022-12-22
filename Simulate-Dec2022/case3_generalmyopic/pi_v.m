function f = pi_v(Par, x1, x2)
%PI 
f = ((1-x1).^Par.gamma1 .* (1-x2)) .^( Par.eta1 )+ Par.D * ((x1.^Par.gamma2) .* x2).^( Par.eta2 ); 

end

