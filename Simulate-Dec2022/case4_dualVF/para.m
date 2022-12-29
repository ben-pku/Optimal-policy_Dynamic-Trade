function Par = para(delta, sigma,  gamma, D)
% input the values of parameters
Par.delta = delta;
Par.sigma = sigma;
Par.gamma = gamma;
Par.D = D;

Par.eta = (1-1/Par.sigma);
Par.alpha = Par.gamma * (Par.sigma - 1);

end

