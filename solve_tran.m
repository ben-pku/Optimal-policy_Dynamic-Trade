function Path = solve_tran(L0, pa)
%% SOLVE_TRAN solve the transition path
%   solve the transition path, given L0, and solve time-t equilibrium
%   period by period, until converging to SS
% L0: 2*1

%-------------------------------------new method-------------------------------------------------------
    T = pa.tt;
    Path.l = [ zeros(2 ,T)];
    Path.w = [ zeros(2,T-1)];
    Path.lambda = [ zeros(2,T)];
    Path.p = [ zeros(2,T)];
    Path.P = [ zeros(2, T) ];
    Path.W = [zeros(1,T)];
    
    % t = 1  we want to find the zero point in [a, b], bisection search algorithm
    tol = 1e-5;
    iter = 0;
    a = 0;
    b = pa.L;

    solution = fsolve(@(un)tran(un,  [(a+b)/2; pa.L-(a+b)/2] , L0, pa), [ [1;0.9] [0.7; 0.7] [0.9; 0.8]  ]);
    
    wagedif = solution(1,1) - solution(2, 1);
    if wagedif < 0
        b = (a+b)/2;
    elseif wagedif >0
        a = (a+b)/2;
    else
        b = (a+b)/2;
        a =b;
    end
    
    dif = b-a;
    
    while dif > tol
        iter = iter + 1;
        solution = fsolve(@(un)tran(un,  [(a+b)/2; pa.L-(a+b)/2], L0, pa), [ [1;0.9] [0.7; 0.7] [0.9; 0.8]  ]);
        wagedif = solution(1,1) - solution(2, 1);

        if wagedif <0
            b = (a+b)/2;
        elseif wagedif >0
            a = (a+b)/2;
        else
            a = (a+b)/2;
            b = a;
        end
        dif = b-a;
    end
    
    Path.l(:, 1) = [a; pa.L-a] ;
    Path.w(:,1) = solution(:,1);
    Path.lambda(: , 1) = solution(:,2);
    Path.p(: ,1) = solution(:, 3);
    Path.P(:, 1) = ( solution(:, 3).^( 1-pa.sigma ) + pa.ps.^( 1-pa.sigma ) ).^( 1./(1-pa.sigma) ) ;
    Path.W(1) = Path.w(1)/(Path.P(1,1)^pa.beta(1) * Path.P(2,1)^pa.beta(2));
    
    %% 2. solve the rest of the transitional dynamics
    for t = 2: T
        iter = 0;

        a = 0;
        b = pa.L;
        dif = b-a;  
        
        % bisection
        while dif > tol
            iter = iter + 1;
            
            solution = fsolve(@(un)tran(un,  [(a+b)/2; pa.L-(a+b)/2] , Path.l(:, t-1), pa), [ [1;0.9] [0.5; 0.5] [0.5; 0.5]  ]);
            wagedif = solution(1,1) - solution(2, 1);

            if wagedif <0
                b = (a+b)/2;
            elseif wagedif >0
                a = (a+b)/2;
            else
                a = (a+b)/2;
                b = a;
            end
            dif = b-a;
        end
        
        Path.l(:,t) = [(a+b)/2; pa.L-(a+b)/2] ;
        Path.w(:,t) = solution(:,1) ;
        Path.lambda(: , t) = solution(:,2);
        Path.p(: ,t) = solution(:, 3);
        Path.P(:, t) = ( solution(:, 3).^( 1-pa.sigma ) + pa.ps.^( 1-pa.sigma ) ).^( 1./(1-pa.sigma) ) ;
        Path.W(t) = max( Path.w(:,t) ) /(Path.P(1,t)^pa.beta(1) * Path.P(2,t)^pa.beta(2));
    end
    
    
    
    
    

end

%----old method-------------------------------------------------------
%     dif = 1e-2;
%     steps = pa.L/dif -1;
%     wagedif = zeros( 1, steps);
%     L1 = linspace(dif, pa.L -dif, steps);
%     
%     for i = 1: steps
%         solution = fsolve(@(un)tran(un,  L1(i), L0, pa), [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
%         wagedif(i) = solution(1,1) - solution(2, 1);
%     end
%     
%     % check the equilibrium 
% %     plot(L1, wagedif);
% %     xlabel("L_1");
% %     ylabel("w_1-w_2");
% %     yline(0,':r');
% %     title("Find t=1, Unique Solution");
%     
%     
%     a = find(wagedif<0,1) ; 
%     a = a* dif;
%     a = a - 1/2 * dif;
%     solution = fsolve(@(un)tran(un,  a, L0, pa), [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);

    % it seems to be little meaningful to find better solution (here is the place to improve the accuracy of the program)
  

% for t = 1 : T
%         
%         
%         for i = 1: steps
%             solution = fsolve(@(un)tran(un,  L1(i), [Path.l1(t-1); Path.l2(t-1)], pa), [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
%             wagedif(i) = solution(1,1) - solution(2, 1);
%         end
%         figure(2);
%         plot(L1, wagedif);
%         xlabel("L_1");
%         ylabel("w_1-w_2");
%         yline(0,':r');
%         title("time-t equilibrium");
%         hold on
%         pause;
% 
%         a = find(wagedif<0,1) ; 
%         a = a* dif;
%         solution = fsolve(@(un)tran(un,  a, [Path.l1(t-1); Path.l2(t-1)] , pa), [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
%         Path.l1(t) = a ;
%         Path.l2(t) = pa.L-Path.l1(t);
%         Path.w(t) = solution(1,1);
%         Path.lambda(: , t) = solution(:,2);
%         Path.p(: ,t) = solution(:, 3);
%         Path.P(:, t) = ( solution(:, 3).^( 1-pa.sigma ) + pa.ps.^( 1-pa.sigma ) ).^( 1./(1-pa.sigma) ) ;
%         Path.W(t) = Path.w(t)/(Path.P(1,t)^pa.beta(1) * Path.P(2,t)^pa.beta(2));
% 
%         
%         
%     end


%         %% in detail
%         dif = 1e-2;
%         steps = pa.L/dif -1;
%         wagedif = zeros( 1, steps);
%         L1 = linspace(dif, pa.L -dif, steps);
% 
%         for i = 1: steps
%             solution = fsolve(@(un)tran(un,  [L1(i); pa.L-L1(i)] , Path.l(t-1), pa), [ [1;0.9] [0.7; 0.7] [0.9; 0.8]  ]);
%             wagedif(i) = solution(1,1) - solution(2, 1);
%         end
% 
%       %  check the equilibrium 
%         figure(3);
%         plot(L1, wagedif);
%         xlabel("L_1");
%         ylabel("w_1-w_2");
%         yline(0,':r');
%         title("Find t=2, What TF");     
%  