function [y] = ss_spec(x , num , pa )
%SS_spec Steady state with full specialization in sector num
% x(1) = w, x(2) = lambda, x(3) = p (domestic)
    y = zeros(3,1);
    
    y(1) = pa.alpha(num) / (1- x(2) * (1-pa.alpha(num) )  ) * (  x(2) * pa.beta(num) *...
        x(1) * pa.L + pa.D(num) * x(3)^(1-pa.sigma(num))  )/ x(1)  - pa.L;
    
    y(2) = x(1) * x(2)^( (1-pa.alpha(num))/( pa.alpha(num) * (pa.sigma(num)-1) )   ) /( pa.T(num) * pa.L^(pa.gamma1(num) + pa.gamma0(num) )  ) - x(3);
    
    y(3) =  x(3)^(1-pa.sigma(num)) / ( x(3)^(1-pa.sigma(num)) +  pa.ps(num)^(1-pa.sigma(num))  ) -x(2) ;
end

