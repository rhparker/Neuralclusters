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

% default MATLAB colors
c1 = [0 0.4470 0.7410];
c2 = [0.8500 0.3250 0.0980];
c3 = [0.9290 0.6940 0.1250];
c4 = [0.4940 0.1840 0.5560];

load HopfperioddataN20;

% branches
beta1g = br{1}.parS;
beta1per = br{1}.period;
beta0g = br{2}.parS;
beta0per = br{2}.period;
beta3g = br{3}.parS;
beta3per = br{3}.period;

% stable portions of branches
beta1gs = sb{1}.parS;
beta1pers = sb{1}.period;
beta0gs = sb{2}.parS;
beta0pers = sb{2}.period;
beta3gs = sb{3}.parS;
beta3pers = sb{3}.period;

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot( beta0g, beta0per, '--', 'LineWidth',lw, 'Color', c1);
plot( beta1g, beta1per, '--', 'LineWidth',lw, 'Color', c2);
plot( beta3g, beta3per, '--', 'LineWidth',lw, 'Color', c3);
plot( beta0gs, beta0pers, '-', 'LineWidth',lw, 'Color', c1);
plot( beta1gs(1:end-2), beta1pers(1:end-2), '-', 'LineWidth',lw, 'Color', c2);
plot( beta3gs(1:46), beta3pers(1:46), '-', 'LineWidth',lw, 'Color', c3);

% pitchfork bif of limit cycles
plot( beta0gs(1), beta0pers(1), '.k', 'MarkerSize', 40);
% hopf bifurcations
scatter( beta0g(1), beta0per(1), 175, 'sk', 'filled');
scatter( beta1g(1), beta1per(1), 175, 'sk', 'filled');
scatter( beta3g(1), beta3per(1), 175, 'sk', 'filled');

text(10, 1.15, '$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$', 'Interpreter', 'latex', 'Fontsize', 20);
text(11.7, 1.25, '$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$', 'Interpreter', 'latex', 'Fontsize', 20);
text(13.4, 1.38, '$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$', 'Interpreter', 'latex', 'Fontsize', 20);

text(2.3, 3.1, '$\beta = 1$', 'Interpreter', 'latex', 'Fontsize', 18);
text(6.25, 1.9, '$\beta = 3$', 'Interpreter', 'latex', 'Fontsize', 18);
text(2.0, 1.25, 'branch from origin', 'Interpreter', 'latex', 'Fontsize', 18);

xlabel('$g$');
ylabel('period of limit cycle');

% labels = {'branch from origin', '$\beta = 1$', '$\beta = 3$'};
% legend(labels,'location','NorthEast');

%% Floquet multiplier plot

fafter = [.2 .5 1 1.15];
afterlabels = { '$\lambda_E$', '$\lambda_1$', '$1$', '$\lambda_I$' }
fduring = [.15 .3 1];
duringlabels = { '$\lambda_E$', '$\lambda_1$', '$1$' };
fbefore = [.125 .2 .85 1];
beforelabels = { '$\lambda_E$', '$\lambda_1$', '$\lambda_I$' , '$1$' };
lambdalabels = { '$\lambda$','$\lambda$','$\lambda$'};

figure;
hold on;
plot( [0,1.25], [0,0], '-k', 'LineWidth', 2);
plot( [0,1.25], [-1,-1], '-k', 'LineWidth', 2);
plot( [0,1.25], [1,1], '-k', 'LineWidth', 2);
plot( fafter, ones(4,1), '.b', 'MarkerSize', 50 );
labelpoints( fafter, ones(4,1), afterlabels,'N',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
plot( fduring, zeros(3,1), '.b', 'MarkerSize', 50 );
labelpoints( fduring, zeros(3,1), duringlabels,'N',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
plot( fbefore, -ones(4,1), '.b', 'MarkerSize', 50 );
labelpoints( fbefore, -ones(4,1), beforelabels,'N',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
labelpoints( [1.25 1.25 1.25], [-1 0 1],lambdalabels, 'E',0.25,0.5,'FontSize',labelFontSize,'interpreter','latex');

text(-.05, 1.2, '$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$', 'Interpreter', 'latex', 'Fontsize', 20);
text(-.05, 0.2, '$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$', 'Interpreter', 'latex', 'Fontsize', 20);
text(-.05, -0.8, '$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$', 'Interpreter', 'latex', 'Fontsize', 20);

set(gca,'visible','off')

axis([0 1.25,-1.25,1.25]);

%% plot actual limit cycle

load limitcycle1.mat;

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(t*period,xE,'--',t*period,xI,'-','LineWidth', 3);
xlabel('$t$');
ylabel('activity');
labels = {'$x_E$', '$x_I$'};
legend(labels,'location','NorthEast');
axis([0 period -0.5 0.5]);

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(xE,xI,'LineWidth', 3);
xlabel('$x_E$');
ylabel('$x_I$');
% axis([0 period -0.5 0.5]);







