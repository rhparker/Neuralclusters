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

labels = {'symmetric pitchfork ($g_0$)', 'Hopf at origin ($g_h$)', 'Hopf $\beta = 1$ branch', 'Hopf $\beta = 3$ branch','Hopf $\beta = 9$ branch'};
legend(labels,'location','NorthEast');
%%
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

labels = {'symmetric pitchfork ($g_0$)', 'Hopf at origin ($g_h$)', 'Hopf $\beta = 1$ branch', 'Hopf $\beta = 3$ branch','Hopf $\beta = 9$ branch'};
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

beta1gcalc = gh_old(alpha,1,beta1N,mee);
beta3gcalc = gh_old(alpha,3,beta3N,mee);
beta4gcalc = gh_old(alpha,4,beta4N,mee);
beta9gcalc = gh_old(alpha,9,beta9N,mee);

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% plot(beta1N, beta1g, '-', beta1N, beta1gcalc, '--', 'LineWidth', lw);
plot(beta3N, beta3g, '-', beta3N, beta3gcalc, '--', 'LineWidth', lw);
% plot(beta4N, beta4g, '-', beta4N, beta4gcalc, '--', 'LineWidth', lw);

axis([20,50,1.5,3]);
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
s4 = 55;
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

%% Plot of solution branches vs N

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

beta1eig1calca = (mee*a)*(1 - 3*(beta1g - g0)./beta1g);

beta1eigrcalc = (mee/2)*( (a-1) + a*b*(beta1g.^2).*(0.2*beta1N).*( beta1xi.^2 ) );
% beta1eigrcalc = (mee/2)*( (a-1) + a*b*(beta1g.^2).*(0.2*beta1N).*( beta1xicalc.^2 ) );
beta1eigrcalc2 = (mee/2)*( (a-1) + a*(beta1g.^2).*(0.2*beta1N - 1).*( beta1xi.^2 ) );

beta1eigrcalc2a = (mee/6)*( -3 + a*(3 + 3*(beta1g.^2).*(-1 + 0.2*beta1N).*(beta1xi.^2) - 2*beta1g.^4.*(-1 + 0.2*beta1N).*(beta1xi.^4) ) ) ;

beta1Ni = 0.2*beta1N;
beta1eigrcalc2b = (mee/2)*( (a-1) + a*(beta1g.^2).*(beta1Ni - 1).*( beta1xi.^2 ) ...
    -(2/3)*(a*(beta1g.^4).*(beta1Ni - 1).*(beta1xi.^4) ) );

beta1eigrcalc3 = mee*0.25*sech(beta1g.*beta1xi).^2 .* ...
    (-1 + 2*a - a*0.2*beta1N - cosh(2*beta1g.*beta1xi) + a*0.2*beta1N.*cosh(2*beta1g.*beta1xi) );

beta1eigIcalc = mee*a*(1 - (beta1g.^2).*( beta1xi.^2 ) );

% plot( beta1N, beta1eig(3,:), beta1N, beta1eig1calc, beta1N, beta1eig1calca);

plot(beta1N, real(beta1eig(1,:)), beta1N, beta1eigrcalc2b );
% plot(beta1N, real(beta1eig(1,:)), beta1N, real(beta1eig(3,:)) );

% plot(beta1N, real(beta1eig(3,:)), beta1N, beta1eigIcalc );
% plot(beta1N, real(beta1eig(3,:)) - beta1eigIcalc );
% plot(beta1N,beta1xi, '-', beta1N, beta1xicalc, '--', 'LineWidth', 3);

% plot( log(beta1g.*beta1xi.*sqrt(0.2*beta1N-1) ), log( real(beta1eig(1,:))-(1/2)*mee*(a-1) ) ); 
% pp = polyfit( (beta1g.*beta1xi.*sqrt(0.2*beta1N - 1) ), log( real(beta1eig(1,:))-(1/2)*mee*(a-1) ), 1);


%%

beta3g = br{6}.parG;
beta3N = br{6}.parN;
beta3xe = br{6}.xE;
beta3xi = br{6}.xI1;
beta3xi2 = br{6}.xI2;

beta3g = br{3}.parG;
beta3N = br{3}.parN;
beta3xe = br{3}.xE;
beta3xi = br{3}.xI1;
beta3xi2 = br{3}.xI2;

g0 = sqrt(beta3N)/(a*mee);

b = 1;

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

% plot(beta3N,beta3xi, '-', beta3N, beta3xicalc, '--', 'LineWidth', 3);

beta3eigIcalc = (mee/2)*( (a-1) + a*b*(beta3g.^2).*(0.2*beta3N).*( beta3xi.^2 ) );

beta3Ni = 0.2*beta3N;
beta3eigIcalca = (mee/2)*( (a-1) + a*(beta3g.^2).*(beta3Ni - 1).*( beta3xi.^2 ) ...
    -(2/3)*(a*(beta3g.^4).*(beta3Ni - 1).*(beta3xi.^4) ) );

plot(beta3N, real(beta3eig(1,:)), beta3N, beta3eigIcalca );

% beta3eig1calca = (mee*a)*(1 - 3*(beta3g - g0)./beta3g);
% plot( beta3N, beta3eig(3,:), beta3N,  beta3eig1calca);


%%

function g = gh_old(a,b,N,mee)
    ni = 0.2*N;
    numer = 3*b*ni + 2*(1 - b + b^2);
    denom = 3*a*b*ni + (a-1)*(1 - b + b^2);
    g = (sqrt(N) / mee).*(numer./denom);
%     g = (sqrt(N) / (a*mee));
end

function g = gh(a,b,N,mee)
    ni = 0.2*N;
    numer = 3*ni + 2*b.^2 - 2*b - 1;
    denom = 3*a*ni + a*b.^2 - b.^2 - a*b + b - 2*a - 1;
    g = (sqrt(N) / mee).*(numer./denom);
%     g = (sqrt(N) / (a*mee));
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

