function [V, xp ] = VFIu( Par, VFIPar, Grid )
%VFI Value function iteration -- upward PF
% Howard acceleration
for it = 1: VFIPar.maxiter
    
    if mod(it, VFIPar.Hnumitersupdate)==1
        [V, xp] = MaxBellmanu(Par, VFIPar.V0u, Grid);
    
        % test for convergence
        dif_V = max(abs( V- VFIPar.V0u ));
        dif_xp = max(abs( xp - VFIPar.xp0u ));
    
        % update initial guesses
        VFIPar.V0u = V;
        VFIPar.xp0u = xp;
        disp(['iteration ' num2str(it) ', dif_Vu = ' num2str(dif_V)]);
        if dif_V< VFIPar.tol
            break;
        end
    else
        V = Bellmanu(Par, VFIPar.V0u, Grid, VFIPar.xp0u);
        % update initial guess
        VFIPar.V0u = V;
    end
    
end

end

