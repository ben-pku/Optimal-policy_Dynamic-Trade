function S = solve_ss(pa)
%% SOLVE_SS solve all steady state, exactly
    dif = 1e-2;
    steps = pa.L/dif -1;
    wagedif = zeros( 1, steps);
    L1 = linspace(dif, pa.L -dif, steps);
    for i = 1: steps
        
        solution = fsolve( @(un)ss(un, L1(i), pa) , [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
        wagedif(i) = solution(1,1) - solution(2, 1);
    end
    S.L1 = L1;
    S.wagedif = wagedif;
    
    %% draw
    plot(S.L1, S.wagedif);
    xlabel("L_1");
    ylabel("w_1-w_2");
    yline(0,':r');
    title("Find Steady State");
    
    %% find more exact solution
    % bisection
     a = find(S.wagedif<0,1) ; 
     a = a* dif;
     b = a - dif;
     % examine b is not exact solution
     solution = fsolve( @(un)ss(un, b, pa) , [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
     wagedif =  solution(1,1) - solution(2, 1);
     
     if wagedif ~= 0 % we can apply bisection to find better solution
         iter = 0;
         tol = 1e-5;
         while a-b > tol && iter < 1e3
            iter = iter + 1;
            mid = (a+b)/2;
            solution = fsolve(@(un)ss(un, mid, pa) , [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
            wagedif =  solution(1,1) - solution(2, 1);
            
            if wagedif > 0
                a = mid;
            elseif wagedif < 0
                b = mid;
            else
                a = mid;
                b = mid;
            end

         end
    
     end
     
     S.w = solution(:,1);
     S.lambda = solution(:,2);
     S.p = solution(:, 3);
     S.l1 = (a+b)/2;
     S.l2 = pa.L - S.l1;
     S.W = S.w(1)/(S.p(1)^pa.beta(1) * S.p(2)^pa.beta(2));
     
     
end

