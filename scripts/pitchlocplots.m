% parameters for simulation

nC = 10;
alpha = 4;
f = 0.8;
mu = 0.7;

% plot parameters
fontSize = 24;
labelFontSize = 24;
markerSize = 50;
lw = 3;

% default MATLAB colors
c1 = [0 0.4470 0.7410];
c2 = [0.8500 0.3250 0.0980];
c3 = [0.9290 0.6940 0.1250];
c4 = [0.4940 0.1840 0.5560];


% load data

load EclusterN100Nc10pitchforkN1
g1 = g;
N1 = N;

load EclusterN100Nc10pitchforkN2
g2 = g;
N2 = N;

load EclusterN100Nc10pitchforkN3
g3 = g;
N3 = N;

load EclusterN100Nc10pitchforkN4
g4 = g;
N4 = N;

%% pitchfork locations g vs N (numerical results from AUTO)

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot( N1, g1, '-', 'LineWidth',lw);
plot( N2, g2, '-.', 'LineWidth',lw);
plot( N3, g3, '--', 'LineWidth',lw);
plot( N4, g4, ':', 'LineWidth',lw);

xlabel('$N$');
ylabel('$g$');
labels = {'$\beta_C = 1$', '$\beta_C = 3/2$', '$\beta_C = 7/3$', '$\beta_C = 4$'};
legend(labels,'location','NorthWest');

%% pitchfork locations log error in g vs N (numerical results from AUTO)

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

g2calc = sqrt(N2) * (1 + (3/2) )^2 / ( a * mu * 4 * (3/2) );
g3calc = sqrt(N3) * (1 + (7/3) )^2 / ( a * mu * 4 * (7/3) );
g4calc = sqrt(N4) * (1 + (4) )^2 / ( a * mu * 4 * (4) );
g2err = abs(g2 - g2calc);
g3err = abs(g3 - g3calc);
g4err = abs(g4 - g4calc);

hold on;
plot( log(N2), log(g2err), '-.', 'LineWidth',lw, 'Color', c2 );
plot( log(N3), log(g3err), '--', 'LineWidth',lw, 'Color', c3 );
plot( log(N4), log(g4err), ':', 'LineWidth',lw, 'Color', c4 );

xlabel('$\log N$');
ylabel('log absolute error');
labels = {'$\beta_C = 3/2$', '$\beta_C = 7/3$', '$\beta_C = 4$'};
legend(labels,'location','NorthWest');

p2 = polyfit(log(N2),log(g2err),1);
p3 = polyfit(log(N3),log(g3err),1);
p4 = polyfit(log(N4),log(g4err),1);

%% pitchfork locations g vs N semilog (numerical results from AUTO)

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

g2calc = sqrt(N2) * (1 + (3/2) )^2 / ( a * mu * 4 * (3/2) );
g3calc = sqrt(N3) * (1 + (7/3) )^2 / ( a * mu * 4 * (7/3) );
g4calc = sqrt(N4) * (1 + (4) )^2 / ( a * mu * 4 * (4) );
g2err = abs(g2 - g2calc);
g3err = abs(g3 - g3calc);
g4err = abs(g4 - g4calc);

semilogx( N2, log(g2err), '-.', 'LineWidth',lw, 'Color', c2 );
hold on;
semilogx( N3, log(g3err), '--', 'LineWidth',lw, 'Color', c3 );
semilogx( N4, log(g4err), ':', 'LineWidth',lw, 'Color', c4 );

xlabel('$N$');
ylabel('log absolute error');
labels = {'$\beta_C = 3/2$', '$\beta_C = 7/3$', '$\beta_C = 4$'};
legend(labels,'location','NorthWest');

p2 = polyfit(log(N2),log(g2err),1);
p3 = polyfit(log(N3),log(g3err),1);
p4 = polyfit(log(N4),log(g4err),1);
