function [V, xp ] = VFI( Par, VFIPar, Grid )
%VFI Value function iteration 
% Howard accelerated

for it = 1: VFIPar.maxiter
    
    if mod(it, VFIPar.Hnumitersupdate) == 1
        [V, xp] = MaxBellman(Par, VFIPar.V0, Grid);
        
        % test for convergence
        dif_V = max(abs( V- VFIPar.V0 ));
        dif_xp = max(abs( xp - VFIPar.xp0 ));

        % update initial guesses
        VFIPar.V0 = V;
        VFIPar.xp0 = xp;
        disp(['iteration ' num2str(it) ', dif_V = ' num2str(dif_V)]);
        %drawer(Par, Grid, V, xp);
        if dif_V< VFIPar.tol
            break;
        end
    
    else
        V = Bellman(Par, VFIPar.V0, Grid, VFIPar.xp0);
        % update initial guesses
        VFIPar.V0 = V;
        
    end
    

    
    
    
end

end

