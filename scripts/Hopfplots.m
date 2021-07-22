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

beta1gcalc = gh(alpha,1,beta1N,mee);
beta3gcalc = gh(alpha,3,beta3N,mee);
beta4gcalc = gh(alpha,4,beta4N,mee);
beta9gcalc = gh(alpha,9,beta9N,mee);

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

plot(beta1N, beta1g, '-', beta1N, beta1gcalc, '--', 'LineWidth', lw);
axis([20,100,1.5,4]);
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

s1 = 25;
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




%%

function g = gh(a,b,N,mee)
    ni = 0.2*N;
    numer = 3*b*ni + 2*(1 - b + b^2);
    denom = 3*a*b*ni + (a-1)*(1 - b + b^2);
    g = (sqrt(N) / mee).*(numer./denom);
end

