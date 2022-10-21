function  S = solve_ss_rough(pa)
%% SOLVE_SS_rough solve all steady state, roughly
% we solve all steady state by this function roughly to analyze the
% uniqueness of Steady state

    dif = 1e-3;
    steps = pa.L/dif -1;
    wagedif = zeros( 1, steps);
    L1 = linspace(dif, pa.L -dif, steps);  % here L1 is the labor for sector 1
    L1 = [L1 ; pa.L - L1];  % here L1 is vector of labor in sector 1 and 2
    for i = 1: steps  
        solution = fsolve( @(un)ss(un, L1(:,i) , pa) , [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
        wagedif(i) = solution(1,1) - solution(2, 1);
    end
    
    
    %% draw  
    figure(1);
    plot(L1(1,:), wagedif);
    xlabel("L_1");
    ylabel("w_1-w_2");
    yline(0,':r');
    title("Steady State (s)");
    
    %% Welfare
    % full specialization in 1
    S.s1 = fsolve(@(x)ss_spec(x , 1 , pa ), [ 1 0.5 1  ]);
    S.P1 = ( S.s1(3)^(1-pa.sigma(1) ) + pa.ps(1)^(1-pa.sigma(1) )   )^(1/ ( 1-pa.sigma(1)  )  ) ;
    S.W1 = S.s1(1) / ( S.P1^pa.beta(1) * pa.ps(2)^pa.beta(2)  )  ;
    
    % full specialization in 2
    S.s2 = fsolve(@(x)ss_spec(x , 2 , pa ), [ 1 0.5 1  ]);
    S.P2 = ( S.s2(3)^(1-pa.sigma(2) ) + pa.ps(2)^(1-pa.sigma(2) )   )^(1/ ( 1-pa.sigma(2)  )  ) ;
    S.W2 = S.s2(1) / ( pa.ps(1)^pa.beta(1) * S.P2^pa.beta(2)  )  ;    

    
end

