function  S = solve_ss_rough(pa)
%% SOLVE_SS_rough solve all steady state, roughly
% we solve all steady state by this function roughly to analyze the
% uniqueness of Steady state

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
end

