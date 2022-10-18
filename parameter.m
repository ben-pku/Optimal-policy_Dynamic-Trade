function [ pa ,state] = parameter( sector, gamma1, gamma0, sigma )
%PARAMETER 
%    obtain the parameter set
    pa.s = sector; % num of sectors

    % production
    pa.alpha = [0.66; 0.56] .* ones(pa.s, 1); % labor share
    
    pa.gamma1 = gamma1; % EES
    pa.gamma0 = gamma0; % historical EES
    pa.T = [1; 1] .* ones(pa.s, 1); % TFP
    % labor
    pa.L = 1;
    
    
    % preference
    pa.sigma = sigma; % EoS
    beta1 = 0.55; 
    pa.beta = [beta1; 1-beta1] .* ones(pa.s, 1);
    
    % international mkt
    pa.D =  ones(pa.s, 1);
    pa.ps = ones(pa.s, 1);
    
    state = 1;
    if sum( ( pa.gamma1).*(pa.sigma -1)-1>=0   )
        state = -1;
        fprintf("Parameter setting does not guarantee unique Equilibrium Path.\n Still continue? If continue, click Enter.\n");
        pause;
    end
    
    if    sum( (pa.gamma0 + pa.gamma1).*(pa.sigma -1)-1./pa.alpha>=0 )
        state =0;
        fprintf("Parameter setting does not satisfy \alpha (\gamma_0+\gamma_1)(\sigma-1)<1 \n");
        pause;
    end
    
    
    if    sum( (pa.gamma0 + pa.gamma1).*(pa.sigma -1)-1>=0 )
        state =0;
        fprintf("Parameter setting satisfies necessary condition for Multi-SS.\n Still continue? If continue, click Enter.\n");
        pause;
    end
    
    

end

