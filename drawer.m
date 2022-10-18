function y = drawer(T, Path)
%DRAWER 
    f1 = figure(1);
    subplot(2,2,1);
    plot(1:T, Path.l1, 1:T, Path.l2);
    xlabel("time");
    ylabel("labor");
    yline(Path.l1(T),':r');
    yline(Path.l2(T),':r');
    title("Labor Allocation");
    
    subplot(2,2,2);
    plot(1:10, Path.W);
    xlabel("time");
    ylabel("Real wage");
    yline(Path.W(T),':r');
    title("Welfare");    
    
    subplot(2,2,3);
    plot(1:10, Path.w);
    xlabel("time");
    ylabel("wage");
    yline(Path.w(T),':r');
    title("Nominal wage");    
        
    subplot(2,2,4);
    plot(1:10, Path.lambda);
    xlabel("time");
    ylabel("domestic share");
    yline(Path.lambda(1,T),':r');
    yline(Path.lambda(2,T),':r');
    title("Domestic share");   
    
    
    y =1;
end

