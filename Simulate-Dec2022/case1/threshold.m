function y = threshold(Par)

exp = Par.sigma/( 1 -Par.gamma2*(Par.sigma-1) );
y = ( (1+Par.delta*Par.gamma2)*(1- 1/Par.sigma) *Par.D) .^exp;
end

