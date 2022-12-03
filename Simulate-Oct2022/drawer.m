function y = drawer(Path, pa)
%DRAWER 
    
          subplot(3,2,1);
          
            plot(1: pa.tt, Path.l(1,:)  );
            ylim([-0.1*pa.L, 1.1* pa.L]);
            title("L_1");
            xlabel("time");
            ylabel("L_1");
            hold on
            legend("L_1=0.19","L_1=0.1903","L_1=0.1905","L_1=0.1908","L_1=0.1910");

            subplot(3,2,2);
            plot(1: pa.tt, Path.l(2,:));
            ylim([-0.1*pa.L, 1.1* pa.L]);
            title("L_2");
            xlabel("time");
            ylabel("L_2");
            hold on

            subplot(3,2,3);
            plot(1:pa.tt, Path.W);
            title("Welfare");
            xlabel("time");
            hold on
            
            subplot(3,2,4);
            plot(1: pa.tt, max(Path.w, [ ], 1 ));
            title("(max) Wage");
            xlabel("time");
            hold on

            subplot(3,2,5);
            plot(1:pa.tt, Path.lambda(1,:));
            title("\lambda_1, domestic share");
            
           %ylim([  -0.05,   0.5  ]   ) ;
            xlabel("time");
            hold on
            
            subplot(3,2,6);
            plot(1:pa.tt, Path.lambda(2,:));
            title("\lambda_2, domestic share");
%             r2 = max( Path.lambda(2,:) ) - min( Path.lambda(2,:) );
%             m = min( Path.lambda(2,:) )-0.1*r2;
%             M = max(Path.lambda(2,:))+0.1*r2  ;
            %ylim([ -0.05, 0.5  ]) ;
            xlabel("time");
            hold on
    
    
    
    y=1;
end

