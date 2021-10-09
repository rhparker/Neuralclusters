% parameters for simulation

N = 50;
nI = 10;
nE = 40;
nC = 10;
p = 3;
alpha = 4;
f = 0.8;
mee = 0.7;

%% plot of all branches

% default MATLAB colors
c1 = [0 0.4470 0.7410];
c2 = [0.8500 0.3250 0.0980];
c3 = [0.9290 0.6940 0.1250];
c4 = [0.4940 0.1840 0.5560];
c5 = [0.4660, 0.6740, 0.1880];          	
c6 = [0.3010, 0.7450, 0.9330];	          	
c7 = [0.6350, 0.0780, 0.1840];

% plot parameters
fontSize = 20;
labelFontSize = 20;
markerSize = 50;
lw = 3;

load EclusterN50Nc10beta1;
x1 = br{1}.xS;
g1 = br{1}.parS;
x1s = sb{1}.xS;
g1s = sb{1}.parS;
BP1 = BP; 
BP1index = find( abs(g1-BP1(2)) < 1e-4);
BP1index = BP1index(1);

load EclusterN50Nc10beta2;
x2 = br{1}.xS;
g2 = br{1}.parS;
x2s = sb{1}.xS;
g2s = sb{1}.parS;
BP2 = BP; 
BP2index = find( abs(g2-BP2(2)) < 1e-4);

load EclusterN50Nc10beta3;
x3 = br{1}.xS;
g3 = br{1}.parS;
x3s = sb{1}.xS;
g3s = sb{1}.parS;
BP3 = BP; 
BP3index = find( abs(g3-BP3(1)) < 1e-4);

load EclusterN50Nc10beta4;
x4 = br{1}.xS;
g4 = br{1}.parS;
x4s = sb{1}.xS;
g4s = sb{1}.parS;
BP4 = BP; 
% BP4index = find( abs(g4-BP4(2)) < 1e-4);

load EclusterN50Nc10beta5;
x5 = br{1}.xS;
g5 = br{1}.parS;
BP5 = BP; 
% BP5index = find( abs(g5-BP5(2)) < 1e-4);

%% plots for beta=7/3 and beta=9

% beta = 7/3
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot(g3(3:end),-x3(3:end,1),'-', 'LineWidth', lw, 'Color', c1 );
plot(g3(3:end),-x3(3:end,10),'--', 'LineWidth', lw, 'Color', c2 );
plot(g3(3:end),-x3(3:end,11),'-.', 'LineWidth', lw, 'Color', c3 );
plot( g3(3),-x3(3,1), '.k', 'MarkerSize', 40); 
axis([ 0 3 -5 2 ]);
legend({'$x_{E_1}$','$x_{E_2}$','$x_{I}$'},'Location','SouthWest');

%%

% beta = 9
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot(g5(3:end),-x5(3:end,1),'-', 'LineWidth', lw, 'Color', c1 );
plot(g5(3:end),-x5(3:end,10),'--', 'LineWidth', lw, 'Color', c2 );
plot(g5(3:end),-x5(3:end,11),'-.', 'LineWidth', lw, 'Color', c3 );
plot( g5(3),-x5(3,1), '.k', 'MarkerSize', 40);
axis([ 0 3 -5 1 ]);
legend({'$x_{E_1}$','$x_{E_2}$','$x_{I}$'},'Location','SouthWest');


%%

% excitatory, xE1 and xE2

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% zero solution
plot([0 g1(1)], [0 0] ,'-','LineWidth',lw, 'Color', c1 );
% beta=1
plot(g1,x1(:,1),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1,x1(:,10),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,1),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,10),'-', 'LineWidth', lw, 'Color', c2 );
% beta=1.5
plot(g2,x2(:,1),'--', 'LineWidth', lw, 'Color', c3 );
plot(g2,x2(:,10),'--', 'LineWidth', lw, 'Color', c3 );
plot(g2s,x2s(:,1),'-', 'LineWidth', lw, 'Color', c3 );
plot(g2s,x2s(:,10),'-', 'LineWidth', lw, 'Color', c3 );
% beta=7/3
plot(g3,x3(:,1),'--', 'LineWidth', lw, 'Color', c4 );
plot(g3,x3(:,10),'--', 'LineWidth', lw, 'Color', c4 );
plot(g3s,x3s(:,1),'-', 'LineWidth', lw, 'Color', c4 );
plot(g3s,x3s(:,10),'-', 'LineWidth', lw, 'Color', c4 );
% beta=4
plot(g4,x4(:,1),'--', 'LineWidth', lw, 'Color', c5 );
plot(g4,x4(:,10),'--', 'LineWidth', lw, 'Color', c5 );
% plot(g4s,x4s(:,1),'-', 'LineWidth', lw, 'Color', c3 );
% plot(g4s,x4s(:,10),'-', 'LineWidth', lw, 'Color', c3 );
% beta=9
plot(g5,x5(:,1),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5,x5(:,10),'--', 'LineWidth', lw, 'Color', c6 );
% axis([0,4,-4,6]);
% branch points
plot( [BP1(2) BP1(2)], x1(BP1index, [1 10]), '.k', 'MarkerSize', 40);  
plot( [BP2(2) BP2(2)], x2(BP1index, [1 10]), '.k', 'MarkerSize', 40); 
plot( [BP3(1) BP3(1)], x3(BP1index, [1 10]), '.k', 'MarkerSize', 40); 
plot( [BP4(1) BP4(1)], x4(BP1index, [1 10]), '.k', 'MarkerSize', 40); 

xlabel('$g$');
ylabel('$X_I$');
text(0.1,4.5,'$X_{E_1}$','FontSize',labelFontSize,'interpreter','latex');
text(0.1,-3,'$X_{E_2}$','FontSize',labelFontSize,'interpreter','latex');


%% inhibitory, only xI2

% % gpos = [ g1(70) ; g15(80); g233(80); g4(80); g9(80) ];
% I2labelpos = [ x1(70,2) ; x15(80,2)+0.01; x233(80,2)+0.01; x4(70,2)+0.0175; x9(70,2)+0.0175 ];
% labels = {'$\beta = 1$','$\beta = 3/2$', '$\beta = 7/3$', '$\beta = 4$', '$\beta = 9$'};
% 
% figure('DefaultAxesFontSize',fontSize);
% set(gca,'fontname','times');
% set(groot,'defaultAxesTickLabelInterpreter','latex');  
% set(groot,'defaulttextinterpreter','latex');
% set(groot,'defaultLegendInterpreter','latex');
% 
% hold on;
% % zero solution
% plot(g00,x0(:,1),'--', 'LineWidth', lw, 'Color', c1 );
% plot(g0s,g0x(:,1),'-','LineWidth',lw, 'Color', c1 );
% % beta=1
% plot(g1,x1(:,2),'--', 'LineWidth', lw, 'Color', c2 );
% plot(g1s,g1x(:,2),'-', 'LineWidth', lw, 'Color', c2 );
% % beta=1.5
% plot(g15,x15(:,2),'--', 'LineWidth', lw, 'Color', c3 );
% plot(g15s,g15x(:,2),'-', 'LineWidth', lw, 'Color', c3 );
% % beta=7/3
% plot(g233,x233(:,2),'--', 'LineWidth', lw, 'Color', c4 );
% % beta=4
% plot(g4,x4(:,2),'--', 'LineWidth', lw, 'Color', c5 );
% % beta=9
% plot(g9,x9(:,2),'--', 'LineWidth', lw, 'Color', c6 );
% 
% g0 = sqrt(50)/(4*0.7);
% plot( g0, 0, '.k', 'MarkerSize', 40);                   % branch points
% scatter( Hopfx, Hopfy(:,2), 175, 'sk', 'filled');       % Hopf (I2)
% 
% axis([2.45,3.55,-0.34,0.01]);
% 
% labelpoints( gpos, I2labelpos, labels,'S',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
% % labelpoints( gpos(1), I2labelpos(1), labels(1),'NE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
% % labelpoints( gpos(2), I2labelpos(2), labels(2),'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
% 
% xlabel('$g$');
% ylabel('$X_{I_2}$');

%% Excitatory

% gpos = [ g1(140) ; g15(140); g233(140); g4(120); g9(100) ];
% Elabelpos = [ x1(140,1) ; x15(140,1); x233(140,1); x4(120,1); x9(100,1) ];
% labels = {'$\beta = 1$','$\beta = 3/2$', '$\beta = 7/3$', '$\beta = 4$', '$\beta = 9$'};
% 
% figure('DefaultAxesFontSize',fontSize);
% set(gca,'fontname','times');
% set(groot,'defaultAxesTickLabelInterpreter','latex');  
% set(groot,'defaulttextinterpreter','latex');
% set(groot,'defaultLegendInterpreter','latex');
% 
% hold on;
% % zero solution
% % plot(g00,x0(:,1),'--', 'LineWidth', lw, 'Color', c1 );
% plot(g0s,g0x(:,1),'-','LineWidth',lw, 'Color', c1 );
% % beta=1
% plot(g1,x1(:,1),'--', 'LineWidth', lw, 'Color', c2 );
% plot(g1s,g1x(:,1),'-', 'LineWidth', lw, 'Color', c2 );
% % beta=1.5
% plot(g15,x15(:,1),'--', 'LineWidth', lw, 'Color', c3 );
% plot(g15s,g15x(:,1),'-', 'LineWidth', lw, 'Color', c3 );
% % beta=7/3
% plot(g233,x233(:,1),'--', 'LineWidth', lw, 'Color', c4 );
% % beta=4
% plot(g4,x4(:,1),'--', 'LineWidth', lw, 'Color', c5 );
% % beta=9
% plot(g9,x9(:,1),'--', 'LineWidth', lw, 'Color', c6 );
% 
% g0 = sqrt(50)/(4*0.7);
% plot( g0, 0, '.k', 'MarkerSize', 40);                   % branch points
% scatter( Hopfx, Hopfy(:,1), 175, 'sk', 'filled');       % Hopf (I2)
% 
% axis([2.45,3.55,-0.002,0.03]);
% 
% labelpoints( gpos, Elabelpos, labels,'NW',0,0,'FontSize',labelFontSize,'interpreter','latex');
% 
% xlabel('$g$');
% ylabel('$X_E$');

