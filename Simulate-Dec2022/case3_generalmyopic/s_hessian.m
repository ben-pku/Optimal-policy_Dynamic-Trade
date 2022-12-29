function d = s_hessian(Par)
%S_HESSIAN 

% draw hessian matrix
scl=0.04;
[x, y] = meshgrid(5*1e-2: scl: 1-5*1e-2);
pi11 = Par.gamma1*Par.eta1*(Par.gamma1*Par.eta1-1) * (1-x).^(Par.gamma1*Par.eta1-2).*(1-y).^(Par.eta1)+...
    Par.D*Par.gamma2*Par.eta2*(Par.gamma2*Par.eta2-1)*x.^(Par.gamma2*Par.eta2-2).*y.^Par.eta2;
pi12 = Par.gamma1*Par.eta1^2 * (1-x).^(Par.gamma1*Par.eta1-1) .* (1-y).^(Par.eta1-1) + ...
    Par.D*Par.gamma2*Par.eta2^2 *x.^(Par.gamma2*Par.eta2-1) .* y.^(Par.eta2-1); 
pi22 = Par.eta1 *(Par.eta1-1)*(1-x).^(Par.gamma1*Par.eta1).*(1-y).^(Par.eta1-2)+...
    Par.D*Par.eta2*(Par.eta2-1) *x.^(Par.gamma2*Par.eta2) .* y.^(Par.eta2-2);
H = pi11.*pi22 - pi12.*pi12;

figure(3);
subplot(1,2,1); % pi11
surf(x, y, pi11,'FaceAlpha', 0.4,'EdgeColor','none');
hold on
surf(x,y, zeros(size(x)),'LineStyle',":",'FaceColor','r','FaceAlpha', 0.1,'EdgeColor','none');
xlabel("x");
ylabel("y");
zlabel("$\pi_{11}$",'Interpreter','LaTeX');

subplot(1,2,2); % det(H)
surf(x, y, H,'FaceAlpha', 0.8,'EdgeColor','none');
hold on
surf(x,y, zeros(size(x)),'LineStyle',":",'FaceColor','r','FaceAlpha', 0.3,'EdgeColor','none');
xlabel("x");
ylabel("y");
zlabel("$det(H)$",'Interpreter','LaTeX');

d =1;
end

