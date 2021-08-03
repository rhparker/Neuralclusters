% parameters for simulation

N = 50;
nI = 10;
nE = 40;
alpha = 4;
f = 0.8;
mee = 0.7;

% plot parameters
fontSize = 18;
labelFontSize = 18;
markerSize = 50;
lw = 2;

% default MATLAB colors
c1 = [0 0.4470 0.7410];
c2 = [0.8500 0.3250 0.0980];
c3 = [0.9290 0.6940 0.1250];
c4 = [0.4940 0.1840 0.5560];

% beta=1
load N50noclustersOrbitb1;
beta1g = br{1}.parS;
beta1per = br{1}.period;
beta1gs = sb{1}.parS;
beta1pers = sb{1}.period;

% beta=1.5
load N50noclustersOrbitb15;
beta15g = br{1}.parS;
beta15per = br{1}.period;
beta15gs = sb{1}.parS;
beta15pers = sb{1}.period;

% beta=2.333
load N50noclustersOrbitb15;
beta2333g = br{1}.parS;
beta2333per = br{1}.period;
beta2333gs = sb{1}.parS;
beta2333pers = sb{1}.period;


% beta=1.4
load N50noclustersOrbitb4;
beta4g = br{1}.parS;
beta4per = br{1}.period;
beta4gs = sb{1}.parS;
beta4pers = sb{1}.period;

% beta=9
load N50noclustersOrbitb9;
beta9g = br{1}.parS;
beta9per = br{1}.period;
beta9gs = sb{1}.parS;
beta9pers = sb{1}.period;


figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% plot( beta0g, beta0per, '--', 'LineWidth',lw, 'Color', c1);
plot( beta1g(1:68), beta1per(1:68), '--', 'LineWidth',lw, 'Color', c2);
plot( beta1gs(1:9), beta1pers(1:9), '-', 'LineWidth',lw, 'Color', c2);
% plot( beta15g(1:67), beta15per(1:67), '--', 'LineWidth',lw, 'Color', c3);
% plot( beta15gs(1:9), beta15pers(1:9), '-', 'LineWidth',lw, 'Color', c3);
plot( beta2333g(1:67), beta2333per(1:67), '--', 'LineWidth',lw, 'Color', c3);
plot( beta2333gs(1:9), beta2333pers(1:9), '-', 'LineWidth',lw, 'Color', c3);
plot( beta4g(1:66), beta4per(1:66), '--', 'LineWidth',lw, 'Color', c4);
plot( beta4gs(1:2), beta4pers(1:2), '-', 'LineWidth',lw, 'Color', c4);
plot( beta9g(1:59), beta9per(1:59), '--', 'LineWidth',lw, 'Color', c5);
plot( beta9gs(1:61), beta9pers(1:61), '-', 'LineWidth',lw, 'Color', c5);
% plot( beta1gs(1:9), beta1pers(1:9), '-', 'LineWidth',lw, 'Color', c2);
% plot( beta3g, beta3per, '--', 'LineWidth',lw, 'Color', c3);
% plot( beta0gs, beta0pers, '-', 'LineWidth',lw, 'Color', c1);
% plot( beta1gs(1:end-2), beta1pers(1:end-2), '-', 'LineWidth',lw, 'Color', c2);
% plot( beta3gs(1:46), beta3pers(1:46), '-', 'LineWidth',lw, 'Color', c3);

% % pitchfork bif of limit cycles
% plot( beta0gs(1), beta0pers(1), '.k', 'MarkerSize', 40);
% hopf bifurcations
% scatter( beta0g(1), beta0per(1), 175, 'sk', 'filled');
% scatter( beta1g(1), beta1per(1), 175, 'sk', 'filled');
% scatter( beta3g(1), beta3per(1), 175, 'sk', 'filled');

% text(10, 1.15, '$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$', 'Interpreter', 'latex', 'Fontsize', 20);
% text(11.7, 1.25, '$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$', 'Interpreter', 'latex', 'Fontsize', 20);
% text(13.4, 1.38, '$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$', 'Interpreter', 'latex', 'Fontsize', 20);
% 
% text(2.3, 3.1, '$\beta = 1$', 'Interpreter', 'latex', 'Fontsize', 18);
% text(6.25, 1.9, '$\beta = 3$', 'Interpreter', 'latex', 'Fontsize', 18);
% text(2.0, 1.25, 'branch from origin', 'Interpreter', 'latex', 'Fontsize', 18);

xlabel('$g$');
ylabel('period of limit cycle');

% labels = {'branch from origin', '$\beta = 1$', '$\beta = 3$'};
% legend(labels,'location','NorthEast');
