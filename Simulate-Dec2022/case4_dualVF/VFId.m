function [V, xp ] = VFId( Par, VFIPar, Grid )
%VFI Value function iteration -- downward PF
% Howard acceleration
for it = 1: VFIPar.maxiter
    
    if mod(it, VFIPar.Hnumitersupdate)==1
        [V, xp] = MaxBellmand(Par, VFIPar.V0d, Grid);
    
        % test for convergence
        dif_V = max(abs( V- VFIPar.V0d ));
        dif_xp = max(abs( xp - VFIPar.xp0d ));
    
        % update initial guesses
        VFIPar.V0d = V;
        VFIPar.xp0d = xp;
        disp(['iteration ' num2str(it) ', dif_Vd = ' num2str(dif_V)]);
        if dif_V< VFIPar.tol
            break;
        end
    else
        V = Bellmand(Par, VFIPar.V0d, Grid, VFIPar.xp0d);
        % update initial guess
        VFIPar.V0d = V;
    end
    
end

end

