function [y] = timet(range, pa)
%TIMET Research on the time-t equilibirum
%   This function is used to investigate the time-t equilibrium with all
%   different initial labor 
    segment = 6;
    L0 = linspace( range(1) , range(2) , segment-1);
    L0 = [L0; pa.L-L0];
    
    
    
    figure(2);
    
    j = 1;
    y.Path1 = solve_tran(L0(: , j) ,pa);
    j=2;
    y.Path2 = solve_tran(L0(: , j) ,pa);
    j=3;
    y.Path3 = solve_tran(L0(: , j) ,pa);
    j=4;
    y.Path4 = solve_tran(L0(: , j) ,pa);
    j=5;
    y.Path5 = solve_tran(L0(: , j) ,pa);
            
  

end

%     figure(3);
%     
%     for j = 1: segment-1
%         
%         wagedif = zeros( 1, steps);
%         for i = 1: steps
%             solution = fsolve(@(un)tran(un,  [L1(i); pa.L-L1(i)] , L0(: , j), pa), [ [1;1] [0.7; 0.7] [0.9; 0.8]  ]);
%             wagedif(i) = solution(1,1) - solution(2, 1);
%         end
% 
%         plot(L1, wagedif);
%         hold on
%         
%         
%     end
%     
%     xlabel("L_1");
%     ylabel("w_1-w_2");
%     yline(0,':r');
%     title("Time-t equilibirum, with different initial labor");
%     legend("L1=0.1", "0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9");