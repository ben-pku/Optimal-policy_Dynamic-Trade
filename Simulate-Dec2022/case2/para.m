function Par = para(delta, sigma1, sigma2, gamma1, gamma2, D1, D2)
% input the values of parameters
Par.delta = delta;
Par.sigma1 = sigma1;
Par.sigma2 = sigma2;
Par.gamma1 = gamma1;
Par.gamma2 = gamma2;
Par.D1 = D1;
Par.D2 = D2;
Par.alpha1 = (Par.sigma1-1)*Par.gamma1;
Par.alpha2 = (Par.sigma2-1)*Par.gamma2;

end

