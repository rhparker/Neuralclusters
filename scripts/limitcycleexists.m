N = 20;
alpha = 1;
f = alpha/(alpha+1);
mee = 0.7;
Ne = N*f;
Ni = N*(1-f);
g0 = sqrt(N)/(alpha*mee);

g = 5;

fontSize = 24;
labelFontSize = 24;
markerSize = 50;
lw = 3;

% nullcline plot

xbound = (2*alpha*Ni - 1)*(mee/sqrt(N));
x1 = linspace(-xbound,xbound,1000);
% y1 = atanh( tanh(g*x1) - ( mee*tanh(g*x1) + sqrt(N)*x1 )/(alpha*mee*Ni)) /g;
xN = @(x) atanh( (tanh(g*x)*mee*(Ne-1) - sqrt(N)*x)/(alpha*mee*Ni) ) / g;
y1 = xN(x1);

ybound = alpha*mee/sqrt(N)+2;
y2 = linspace(-ybound,ybound,1000);
% x2 = atanh( tanh(g*y2) + ( -alpha*mee*tanh(g*y2) + sqrt(N)*y2 )/(alpha*mee*Ni) ) /g;
yN = @(y) atanh( (tanh(g*y)*alpha*mee*(Ni-1) + sqrt(N)*y)/(mee*Ne) ) / g;
x2 = yN(y2);

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot(x1,y1,'-',x2,y2,'--','LineWidth',2);
xlabel('$x$');
ylabel('$y$');
labels = {'$x$ nullcline', '$y$ nullcline'};
legend(labels,'location','NorthEast');

xNmax = asech( (N^0.25) / sqrt( g*mee*(Ne-1)) )/g;
plot( [xNmax], [xN(xNmax)],'.k','MarkerSize',40);
plot(x1,x1);


%% quiver plot for Poincare-Bendixson

N = 20;
g = 100;
mee = 0.7;
Ne = N*0.8;
Ni = N*0.2;
alpha = 4;

u0 = [-0.25 ; 0.2];
[t,u] = ode45(@(t,u) cycle(u,N,g),[0,10],u0);

[x,y] = meshgrid(-6.5:.5:6.5,-6.5:.5:6.5);
C = tanh(g*x) - tanh(g*y);
v1 = -x+(mee*Ne/sqrt(N))*C-(mee/sqrt(N))*tanh(g*x);
v2 = -y+(mee*Ne/sqrt(N))*C+(alpha*mee/sqrt(N))*tanh(g*y);

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
mags = sqrt( v1.^2 + v2.^2 );
quiver(x,y,v1./mags,v2./mags);
plot(u(:,1), u(:,2), 'LineWidth', 2);
rectangle('Position',[-6 -6 12 12],  'LineWidth', 2);
xlabel('$x$');
ylabel('$y$');

%%

function F = cycle(u, N, G)
    x = u(1);
    y = u(2);
    mu = 0.7;
    Ne = N*0.8;
    Ni = N*0.2;
    alpha = 4;
    C = tanh(G*x) - tanh(G*y);
%     F = [ -x+(mu*Ne/sqrt(N))*C-(mu/sqrt(N))*tanh(G*x) ; ...
%           -y+(mu*Ne/sqrt(N))*C+(alpha*mu/sqrt(N))*tanh(G*y)];    
    F = [ -x+(mu/sqrt(N))*( (Ne-1)*tanh(G*x) - alpha*Ni*tanh(G*y) ); ...
          -y+(mu/sqrt(N))*( Ne*tanh(G*x) - alpha*(Ni-1)*tanh(G*y) )];    
end
