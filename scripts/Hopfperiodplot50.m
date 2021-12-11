% parameters for simulation

N = 50;
nI = 10;
nE = 40;
alpha = 4;
f = 0.8;
mee = 0.7;

% plot parameters
fontSize = 30;
labelFontSize = 30;
markerSize = 50;
lw = 4;

% default MATLAB colors
c1 = [0 0.4470 0.7410];
c2 = [0.8500 0.3250 0.0980];
c3 = [0.9290 0.6940 0.1250];
c4 = [0.4940 0.1840 0.5560];
c5 = [0.4660, 0.6740, 0.1880];          	
c6 = [0.3010, 0.7450, 0.9330];	          	
c7 = [0.6350, 0.0780, 0.1840];

% beta=1
load HopfnoclusterN50b1;
beta1g    = perdata{1}.parS;
beta1per  = perdata{1}.period;
beta1xmax = perdata{1}.xS;
beta1gs   = stableper{1}.parS;
beta1pers = stableper{1}.period;

% beta=1.5
load HopfnoclusterN50b15;
beta15g    = perdata{1}.parS;
beta15per  = perdata{1}.period;
beta15xmax = perdata{1}.xS;
beta15gs   = stableper{1}.parS;
beta15pers = stableper{1}.period;

% beta=2.333
load HopfnoclusterN50b2333;
beta2333g    = perdata{1}.parS;
beta2333per  = perdata{1}.period;
beta2333xmax = perdata{1}.xS;
beta2333gs   = stableper{1}.parS;
beta2333pers = stableper{1}.period;

% beta=4
load HopfnoclusterN50b4;
beta4g    = perdata{1}.parS;
beta4per  = perdata{1}.period;
beta4xmax = perdata{1}.xS;
beta4gs   = stableper{1}.parS;
beta4pers = stableper{1}.period;

% beta=9
load HopfnoclusterN50b9;
beta9g    = perdata{1}.parS;
beta9per  = perdata{1}.period;
beta9xmax = perdata{1}.xS;
beta9gs   = stableper{1}.parS;
beta9pers = stableper{1}.period;

% beta=inf
load HopfnoclusterN50binf;
betainfg    = perdata{1}.parS;
betainfper  = perdata{1}.period;
betainfxmax = perdata{1}.xS;
betainfgs   = stableper{1}.parS;
betainfpers = stableper{1}.period;

gstar = 15.9184;

%%

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;

% % 2D
% plot( betainfg, betainfper, '--', 'LineWidth',lw, 'Color', c1);
% plot( betainfgs, betainfpers, '-', 'LineWidth',lw, 'Color', c1);
% plot( beta1g(1:270), beta1per(1:270), '--', 'LineWidth',lw, 'Color', c2);
% plot( beta1gs(1:38), beta1pers(1:38), '-', 'LineWidth',lw, 'Color', c2);
% plot( beta15g(1:269), beta15per(1:269), '--', 'LineWidth',lw, 'Color', c3);
% plot( beta15gs(1:38), beta15pers(1:38), '-', 'LineWidth',lw, 'Color', c3);
% plot( beta2333g(1:267), beta2333per(1:267), '--', 'LineWidth',lw, 'Color', c4);
% plot( beta2333gs(1:10), beta2333pers(1:10), '-', 'LineWidth',lw, 'Color', c4);
% plot( beta4g(1:263), beta4per(1:263), '--', 'LineWidth',lw, 'Color', c5);
% plot( beta4gs(1:7), beta4pers(1:7), '-', 'LineWidth',lw, 'Color', c5);
% plot( beta9g(1:253), beta9per(1:253), '--', 'LineWidth',lw, 'Color', c6);
% plot( beta9gs(1:224), beta9pers(1:224), '-', 'LineWidth',lw, 'Color', c6);

% 3D
ind = 11;
lw = 4;
plot3( betainfg, betainfxmax(:,ind), betainfper, ':', 'LineWidth',lw, 'Color', c1);
plot3( betainfgs, betainfxmax(182:end,ind), betainfpers, '-', 'LineWidth',lw, 'Color', c1);
plot3( beta1g(1:270), beta1xmax(1:270,ind), beta1per(1:270), ':', 'LineWidth',lw, 'Color', c2);
plot3( beta1gs(1:38), beta1xmax(1:38,ind), beta1pers(1:38), '-', 'LineWidth',lw, 'Color', c2);
plot3( beta15g(1:269), beta15xmax(1:269,ind), beta15per(1:269), ':', 'LineWidth',lw, 'Color', c3);
plot3( beta15gs(1:38), beta15xmax(1:38,ind), beta15pers(1:38), '-', 'LineWidth',lw, 'Color', c3);
plot3( beta2333g(1:267), beta2333xmax(1:267,ind), beta2333per(1:267), ':', 'LineWidth',lw, 'Color', c4);
plot3( beta2333gs(1:10), beta2333xmax(29:38,ind), beta2333pers(1:10), '-', 'LineWidth',lw, 'Color', c4);
plot3( beta4g(1:263), beta4xmax(1:263,ind), beta4per(1:263), ':', 'LineWidth',lw, 'Color', c5);
plot3( beta4gs(1:7), beta4xmax(32:38,ind), beta4pers(1:7), '-', 'LineWidth',lw, 'Color', c5);
plot3( beta9g(1:253), beta9xmax(1:253,ind), beta9per(1:253), ':', 'LineWidth',lw, 'Color', c6);
plot3( beta9gs(1:224), beta9xmax(30:253,ind), beta9pers(1:224), '-', 'LineWidth',lw, 'Color', c6);
pbaspect([3 1 1]);
view([17 30]);

% % pitchfork bif of limit cycles
plot3( betainfgs(1), betainfxmax(182,ind), betainfpers(1), '.k', 'MarkerSize', 40);
% hopf bifurcations
scatter3( beta1g(1), beta1xmax(1,ind), beta1per(1), 175, 'sk', 'filled');
scatter3( beta15g(1), beta15xmax(1,ind), beta15per(1), 175, 'sk', 'filled');
scatter3( beta2333g(1), beta2333xmax(1,ind), beta2333per(1), 175, 'sk', 'filled');
scatter3( beta4g(1), beta4xmax(1,ind), beta4per(1), 175, 'sk', 'filled');
scatter3( beta9g(1), beta9xmax(1,ind), beta9per(1), 175, 'sk', 'filled');
scatter3( betainfg(1), betainfxmax(1,ind), betainfper(1), 175, 'sk', 'filled');

xlabel('$g$');
ylabel('$\max\:x_{I_2}$');
zlabel('period');
xlim([0 20]);
 
textFontSize=30;
text(beta1g(1)-0.5, beta1xmax(1,ind), beta1per(1)+0.05, '$\beta = 1$', 'Interpreter', 'latex', 'Fontsize', textFontSize);
text(beta15g(1)-0.5, beta15xmax(1,ind), beta15per(1)+0.10, '$\beta = 3/2$', 'Interpreter', 'latex', 'Fontsize', textFontSize);
text(beta2333g(1)-2.3, beta2333xmax(1,ind), beta2333per(1)-0.10, '$\beta = 7/3$', 'Interpreter', 'latex', 'Fontsize', textFontSize);
text(beta4g(1)-0.8, beta4xmax(1,ind), beta4per(1)-0.12, '$\beta = 4$', 'Interpreter', 'latex', 'Fontsize', textFontSize);
text(beta9g(1)-0.7, beta9xmax(1,ind), beta9per(1)-0.12, '$\beta = 9$', 'Interpreter', 'latex', 'Fontsize', textFontSize);
text(betainfg(1)-0.8, betainfxmax(1,ind), betainfper(1)-0.125, '$\beta = \infty$', 'Interpreter', 'latex', 'Fontsize', textFontSize);


%% plot of stability for a given g

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
lw = 3;
plot( betainfg, 1*ones(length(betainfg)), ':', 'LineWidth',lw, 'Color', c1);
plot( betainfgs, 1*ones(length(betainfgs)), '-', 'LineWidth',lw, 'Color', c1);
plot( beta1g(1:270), 2*ones(1,270), ':', 'LineWidth',lw, 'Color', c2);
plot( beta1gs(1:38), 2*ones(1,38), '-', 'LineWidth',lw, 'Color', c2);
plot( beta15g(1:269), 3*ones(1,269), ':', 'LineWidth',lw, 'Color', c3);
plot( beta15gs(1:38), 3*ones(1,38), '-', 'LineWidth',lw, 'Color', c3);
plot( beta2333g(1:267), 4*ones(1,267), ':', 'LineWidth',lw, 'Color', c4);
plot( beta2333gs(1:10), 4*ones(1,10), '-', 'LineWidth',lw, 'Color', c4);
plot( beta4g(1:263), 5*ones(1,263), ':', 'LineWidth',lw, 'Color', c5);
plot( beta4gs(1:7), 5*ones(1,7), '-', 'LineWidth',lw, 'Color', c5);
plot( beta9g(1:253), 6*ones(1,253), ':', 'LineWidth',lw, 'Color', c6);
plot( beta9gs(1:224), 6*ones(1,224), '-', 'LineWidth',lw, 'Color', c6);

hold on;


