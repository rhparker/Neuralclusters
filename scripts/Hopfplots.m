% parameters for simulation

N = 20;
nI = 4;
nE = 16;
alpha = 4;
f = 0.8;
mee = 0.7;

% plot parameters
fontSize = 18;
labelFontSize = 18;
markerSize = 50;
lw = 2;

%% Hopf locations g vs N (numerical results from AUTO)

load Hopfdata;
g0g = br{1}.parG;
g0N = br{1}.parN;
ghg = br{2}.parG;
ghN = br{2}.parN;

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot( g0N, g0g, '--', 'LineWidth',lw);
plot( ghN, ghg, '-.', 'LineWidth',lw);
indices = [3 6 8];
for index = indices
    plot( br{index}.parN, br{index}.parG, '-', 'LineWidth',lw);
end
xlabel('$N$');
ylabel('$g$');
axis([20,500,1,13]);

labels = {'symmetric pitchfork ($g_0$)', 'Hopf at origin ($g_H$)', 'Hopf $\beta = 1$ branch', 'Hopf $\beta = 3$ branch','Hopf $\beta = 9$ branch'};
legend(labels,'location','NorthEast');
%% Hopf locations log vs log N (numerical results from AUTO)

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot( log(g0N), log(g0g), '--', 'LineWidth',lw);
plot( log(ghN), log(ghg), '-.', 'LineWidth',lw);
indices = [3 6 8];
for index = indices
    plot( log(br{index}.parN), log(br{index}.parG), '-', 'LineWidth',lw);
end
ylabel('$\log g$');
xlabel('$\log N$');
axis([3, 6, 0.4, 3.2]);

labels = {'symmetric pitchfork ($g_0$)', 'Hopf at origin ($g_H$)', 'Hopf $\beta = 1$ branch', 'Hopf $\beta = 3$ branch','Hopf $\beta = 9$ branch'};
legend(labels,'location','NorthWest');

%% approx location plot

beta1g = br{3}.parG;
beta1N = br{3}.parN;
beta3g = br{6}.parG;
beta3N = br{6}.parN;
beta4g = br{7}.parG;
beta4N = br{7}.parN;
beta9g = br{8}.parG;
beta9N = br{8}.parN;

beta1gcalc = gh(alpha,1,beta1N,mee);
beta3gcalc = gh(alpha,3,beta3N,mee);
beta4gcalc = gh(alpha,4,beta4N,mee);
beta9gcalc = gh(alpha,9,beta9N,mee);

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot(beta1N, beta1g, '-', beta1N, beta1gcalc, '--', 'LineWidth', lw);
% plot(beta3N, beta3g, '-', beta3N, beta3gcalc, '--', 'LineWidth', lw);
% plot(beta4N, beta4g, '-', beta4N, beta4gcalc, '--', 'LineWidth', lw);

axis([20,50,1.5,2.75]);
xlabel('$N$');
ylabel('$g$');
labels = {'Hopf bifurcation ($\beta = 1$)', 'Approximation $g_{H,\beta}$ ($\beta = 1$)' };
legend(labels,'location','NorthWest');

%% relative error plot

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times'); 
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

s1 = 20;
xp1 = log( beta1N(s1:end) );
yp1 = log( abs( beta1gcalc(s1:end) - beta1g(s1:end) ) );
s3 = 50;
xp3 = log( beta3N(s3:end) );
yp3 = log( abs( beta3gcalc(s3:end) - beta3g(s3:end) ) );
s4 = 50;
xp4 = log( beta4N(s4:end)  );
yp4 = log( abs( beta4gcalc(s4:end)  - beta4g(s4:end)  ) );
p1 = polyfit(xp1,yp1,1);
p3 = polyfit(xp3,yp3,1);
p4 = polyfit(xp4,yp4,1);

plot(xp1,yp1, '-', xp3,yp3, '--', xp4, yp4, '-.', 'LineWidth', 3);
labels = {'$\beta = 1$', '$\beta = 3$', '$\beta = 4$' };
legend(labels,'location','NorthEast');
xlabel('$\log N$');
ylabel('log absolute error');

%% Plot of solution branches and eigenvalues vs N
% beta = 1 branch

beta1g  = br{3}.parG;
beta1N  = br{3}.parN;
beta1xe = br{3}.xE;
beta1xi = br{3}.xI1;
beta1xi2 = br{3}.xI2;

g0 = sqrt(beta1N)/(a*mee);

b = 1;
beta1xicalc = beta1xi;
beta1eig = [];
for k = 1:length(beta1xi)
    beta1xicalc(k) = xicalc(a, 1, beta1g(k), beta1N(k), mee);
    H = clustersymm( beta1N(k), 1, 0.8*beta1N(k), mee, -a*mee, mee, -a*mee, a, 1);
    H = H*diag( sech(beta1g(k)*[beta1xe(k), beta1xi(k), beta1xi2(k)]).^2 );
    beta1eig = [beta1eig eig(H)];
end

beta1Ni = 0.2*beta1N;

% real part of complex pair
% second order
beta1eigrcalc2 = (mee/2)*( (a-1) + a*(beta1g.^2).*(beta1Ni - 1).*( beta1xi.^2 ) );
% fourth order
beta1eigrcalc4 = (mee/2)*( (a-1) + a*(beta1g.^2).*(beta1Ni - 1).*( beta1xi.^2 ) ...
    -(2/3)*(a*(beta1g.^4).*(beta1Ni - 1).*(beta1xi.^4) ) );
plot( beta1N, real(beta1eig(1,:)), beta1N, beta1eigrcalc2, beta1N, beta1eigrcalc4  );

% third eigenvalue
beta1eigIcalc = mee*a*(1 - (beta1g.^2).*( beta1xi.^2 ) );

%% Plot of solution branches and eigenvalues vs N
% beta = 3 branch

beta3g = br{6}.parG;
beta3N = br{6}.parN;
beta3xe = br{6}.xE;
beta3xi = br{6}.xI1;
beta3xi2 = br{6}.xI2;

g0 = sqrt(beta3N)/(a*mee);
b = 3;

beta3xicalc = beta3xi;
beta3eig = [];
for k = 1:length(beta3xi)
    beta3xicalc(k) = xicalc(a, b, beta3g(k), beta3N(k), mee);
    H = clustersymm( beta3N(k), 1, 0.8*beta3N(k), mee, -a*mee, mee, -a*mee, a, b);
    H = H*diag( sech(beta3g(k)*[beta3xe(k), beta3xi(k), beta3xi2(k)]).^2 );
    beta3eig = [beta3eig eig(H)];
end

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times'); 
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

beta3Ni = 0.2*beta3N;

% real part of complex pair
% 2nd order
beta3eigIcalc12 = (mee/2)*( (a-1) + a*b*(beta3g.^2).*(beta3Ni - 1).*( beta3xi.^2 ) );
plot(beta3N, real(beta3eig(1,:)), beta3N, beta3eigIcalc12 );

% 3rd eigenvalue
beta1eigIcal = (mee*a)*(1 - 3*(beta3g - g0)./beta3g);
% plot( beta3N, beta3eig(3,:), beta3N,  beta3eig1calca);


%%

function g = gh(a,b,N,mee)
    ni = 0.2*N;
    numer = 2 - 5*b + 2*b^2 + 3*b*ni;
    denom = a*(1-4*b+b^2) - (1-b+b^2) + 3*a*b*ni;
    g = (sqrt(N) / mee).*(numer./denom);
end

function x = xicalc(a, b, g, N, mee)
    g0 = sqrt(N)/(a*mee);
    x = sqrt( 3*(g - g0)./((1 - b + b^2)*g.^3 ));
end

% generate matrix H for linearization about origin, symmetry of I cells
% specified
function H = clustersymm(N, Nc, p, mee, mei, mie, mii, a, b)
    Ne = p*Nc;
    Ni = N - Ne;
    H = [ Ne-1 -a*b*Ni/(b+1) -a*Ni/(b+1) ; ...
          Ne -a*(b*Ni/(b+1)-1) -a*Ni/(b+1) ;...
          Ne -a*b*Ni/(b+1) -a*(Ni/(b+1)-1) ];
    H = H*mee;
end

