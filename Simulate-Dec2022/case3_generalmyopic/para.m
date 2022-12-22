function Par = para(delta, sigma1, sigma2, gamma1, gamma2, D2)
% input the values of parameters
Par.delta = delta;
Par.sigma1 = sigma1;
Par.sigma2 = sigma2;
Par.gamma1 = gamma1;
Par.gamma2 = gamma2;
Par.D2 = D2;
Par.D = D2^(1/Par.gamma2);

Par.eta1 = 1- 1/Par.sigma1;
Par.eta2 = 1- 1/Par.sigma2;
Par.alpha1 = (Par.sigma1-1)*Par.gamma1;
Par.alpha2 = (Par.sigma2-1)*Par.gamma2;

end

