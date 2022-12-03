function [V, xp ] = VFI( Par, VFIPar, Grid )
%VFI Value function iteration

for it = 1: VFIPar.maxiter
    
    [V, xp] = MaxBellman(Par, VFIPar.V0, Grid);
    
    % test for convergence
    dif_V = max(abs( V- VFIPar.V0 ));
    dif_xp = max(abs( xp - VFIPar.xp0 ));
    
    
    % update initial guesses
    VFIPar.V0 = V;
    VFIPar.xp0 = xp;
    
    disp(['iteration ' num2str(it) ', dif_V = ' num2str(dif_V)]);
    if dif_V< VFIPar.tol
        break;
    end
    
end

end

