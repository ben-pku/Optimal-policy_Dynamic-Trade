function Path = solve_tran(L0, pa)
%% SOLVE_TRAN solve the transition path
%   solve the transition path, given L0, and solve time-t equilibrium
%   period by period, until converging to SS

    % solve t = 1
    dif = 1e-2;
    steps = pa.L/dif -1;
    wagedif = zeros( 1, steps);
    L1 = linspace(dif, pa.L -dif, steps);
    
    for i = 1: steps
        solution = fsolve(@(un)tran(un,  L1(i), L0, pa), [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
        wagedif(i) = solution(1,1) - solution(2, 1);
    end
    
%     plot(L1, wagedif);
%     xlabel("L_1");
%     ylabel("w_1-w_2");
%     yline(0,':r');
%     title("Find t=1");
     a = find(wagedif<0,1) ; 
     a = a* dif;
     solution = fsolve(@(un)tran(un,  a, L0, pa), [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
%      b = a - dif;

    % it seems to be little meaningful to find better solution (here is the place to improve the accuracy of the program)
    T = 10;
    Path.l1 = [a zeros(1 ,T-1)];
    Path.l2 = [pa.L-a zeros(1 ,T-1)];
    Path.w = [solution(1,1) zeros(1,T-1)];
    Path.lambda = [solution(:,2) zeros(2,T-1)];
    Path.p = [solution(:, 3) zeros(2,T-1)];
    Path.W = [Path.w(1)/(Path.p(1,1)^pa.beta(1) * Path.p(2,1)^pa.beta(2))   zeros(1,T-1)];
    
    for t = 2 : T
        for i = 1: steps
            solution = fsolve(@(un)tran(un,  L1(i), [Path.l1(t-1); Path.l2(t-1)], pa), [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
            wagedif(i) = solution(1,1) - solution(2, 1);
        end
        
        a = find(wagedif<0,1) ; 
        a = a* dif;
        solution = fsolve(@(un)tran(un,  a, [Path.l1(t-1); Path.l2(t-1)] , pa), [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
        Path.l1(t) = a ;
        Path.l2(t) = pa.L-Path.l1(t);
        Path.w(t) = solution(1,1);
        Path.lambda(: , t) = solution(:,2);
        Path.p(: ,t) = solution(:, 3);
        Path.W(t) = Path.w(t)/(Path.p(1,t)^pa.beta(1) * Path.p(2,t)^pa.beta(2));

        
        
    end
    
    
    
    

end

