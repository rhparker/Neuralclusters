% parameters for simulation

N = 100;
nI = 20;
nE = 80;
nC = 10;
p = 8;
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

% when loading the data, we flip the excitation values to be consistent 
% with the notation in the manuscript

load EclusterN100Nc10beta1;
x1 = -br{1}.xS;
g1 = br{1}.parS;
x1s = -sb{1}.xS;
g1s = sb{1}.parS;
BP1 = BP(2); 
BP1index = find( abs(g1-BP1) < 1e-4);
BP1index = BP1index(1);

load EclusterN100Nc10beta2;
x2 = -br{1}.xS;
g2 = br{1}.parS;
x2s = -sb{1}.xS;
g2s = sb{1}.parS;
BP2 = BP(3); 
BP2index = find( abs(g2-BP2) < 1e-4);

load EclusterN100Nc10beta3;
x3 = -br{1}.xS;
g3 = br{1}.parS;
x3s = -sb{1}.xS;
g3s = sb{1}.parS;
BP3 = BP(2); 
BP3index = find( abs(g3-BP3) < 1e-4);

load EclusterN100Nc10beta4;
x4 = -br{1}.xS;
g4 = br{1}.parS;
x4s = -sb{1}.xS;
g4s = sb{1}.parS;
BP4 = HB; 
BP4index = find( abs(g4-BP4(2)) < 1e-4);
BP4index2 = find( abs(g4-BP4(1)) < 1e-4);

load EclusterN100Nc10beta5;
x5 = -br{1}.xS;
g5 = br{1}.parS;
x5s = -sb{1}.xS;
g5s = sb{1}.parS;
BP5 = HB; 
BP5index = find( abs(g5-BP5(2)) < 1e-4);
BP5index2 = find( abs(g5-BP5(1)) < 1e-4);

% load large g data
load EclusterN100Nc10largeg1;
x1lim = br{1}.xS;
g1lim = br{1}.parS;
x1slim = sb{1}.xS;
g1slim = sb{1}.parS;

load EclusterN100Nc10largeg15;
x2lim = br{1}.xS;
g2lim = br{1}.parS;
x2slim = sb{1}.xS;
g2slim = sb{1}.parS;

load EclusterN100Nc10largeg2333;
x3lim = br{1}.xS;
g3lim = br{1}.parS;
x3slim = sb{1}.xS;
g3slim = sb{1}.parS;

load EclusterN100Nc10largeg4;
x4lim = br{1}.xS;
g4lim = br{1}.parS;
x4slim = sb{1}.xS;
g4slim = sb{1}.parS;

load EclusterN100Nc10largeg8;
x5lim = br{1}.xS;
g5lim = br{1}.parS;
x5slim = sb{1}.xS;
g5slim = sb{1}.parS;

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
plot([g1(1) 20], [0 0] ,'--','LineWidth',lw, 'Color', c1 );
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
plot(g4s,x4s(:,1),'-', 'LineWidth', lw, 'Color', c5 );
plot(g4s,x4s(:,10),'-', 'LineWidth', lw, 'Color', c5 );
% beta=9
plot(g5,x5(:,1),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5,x5(:,10),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5s,x5s(:,1),'-', 'LineWidth', lw, 'Color', c6 );
plot(g5s,x5s(:,10),'-', 'LineWidth', lw, 'Color', c6 );
% branch points
plot( [g1(1)], [0], '.k', 'MarkerSize', 40); 
plot( [BP1 BP1], x1(BP1index, [1 10]), '.k', 'MarkerSize', 40);  
plot( [BP2 BP2], x2(BP2index, [1 10]), '.k', 'MarkerSize', 40); 
plot( [BP3 BP3], x3(BP3index, [1 10]), '.k', 'MarkerSize', 40); 
plot( [BP4(2) BP4(2)], x4(BP4index, [1 10]), '.k', 'MarkerSize', 40); 
plot( [BP5(2) BP5(2)], x5(BP5index, [1 10]), '.k', 'MarkerSize', 40); 

axis([0,12,-10,7]);
xlabel('$g$');
ylabel('$X_E$');
text(0.2,6,'$X_{E_1}$','FontSize',labelFontSize,'interpreter','latex');
text(0.2,-9,'$X_{E_2}$','FontSize',labelFontSize,'interpreter','latex');


%%

% excitatory, xE1 only

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% zero solution
plot([0 g1(1)], [0 0] ,'-','LineWidth',lw, 'Color', c1 );
plot([g1(1) 20], [0 0] ,'--','LineWidth',lw, 'Color', c1 );
% beta=1
plot(g1,x1(:,1),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,1),'-', 'LineWidth', lw, 'Color', c2 );
% beta=1.5
plot(g2,x2(:,1),'--', 'LineWidth', lw, 'Color', c3 );
plot(g2s,x2s(:,1),'-', 'LineWidth', lw, 'Color', c3 );
% beta=7/3
plot(g3,x3(:,1),'--', 'LineWidth', lw, 'Color', c4 );
plot(g3s,x3s(:,1),'-', 'LineWidth', lw, 'Color', c4 );
% beta=4
plot(g4,x4(:,1),'--', 'LineWidth', lw, 'Color', c5 );
plot(g4s,x4s(:,1),'-', 'LineWidth', lw, 'Color', c5 );
% beta=9
plot(g5,x5(:,1),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5s,x5s(:,1),'-', 'LineWidth', lw, 'Color', c6 );
% branch points
plot( [g1(1)], [0], '.k', 'MarkerSize', 40); 
plot( [BP1 BP1], x1(BP1index, [1]), '.k', 'MarkerSize', 40);  
plot( [BP2 BP2], x2(BP2index, [1]), '.k', 'MarkerSize', 40); 
plot( [BP3 BP3], x3(BP3index, [1]), '.k', 'MarkerSize', 40); 
plot( [BP4(2) BP4(2)], x4(BP4index, [1]), '.k', 'MarkerSize', 40); 
plot( [BP5(2) BP5(2)], x5(BP5index, [1]), '.k', 'MarkerSize', 40); 
% stability switch points
plot( [BP4(1)], x4(BP4index2, [1]), 'dk', 'MarkerSize', 10, 'LineWidth',3); 
plot( [BP5(1)], x5(BP5index2, [1]), 'dk', 'MarkerSize', 10, 'LineWidth',3);

xlabel('$g$');
ylabel('$X_{E_1}$');

% version 1, zoomed out
axis([0,12,-0.2,5.5]);
gpos = [ 8 ; 8.5 ; 8.5 ; 8 ; 8 ];
Elabelpos = [ 5 ; 3.85 ; 2.7 ; 1.55 ; 0.45];
labels = {'$\beta_C = 1$','$\beta_C = 3/2$', '$\beta_C = 7/3$', '$\beta_C = 4$', '$\beta_C = 9$'};
labelpoints( gpos, Elabelpos, labels,'NW',0,0,'FontSize',labelFontSize,'interpreter','latex');

% % version 2, zoomed in
% axis([0,2,-0.2,5.5]);
% gpos = [ 1 ; 1.1 ; 1.1 ; 1 ; 1 ];
% Elabelpos = [ 5 ; 4 ; 3 ; 2 ; 0.9];
% labels = {'$\beta_C = 1$','$\beta_C = 3/2$', '$\beta_C = 7/3$', '$\beta_C = 4$', '$\beta_C = 9$'};
% labelpoints( gpos, Elabelpos, labels,'NW',0,0,'FontSize',labelFontSize,'interpreter','latex');

%% inhibitory

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% zero solution
plot([0 g1(1)], [0 0] ,'-','LineWidth',lw, 'Color', c1 );
plot([g1(1) 20], [0 0] ,'--','LineWidth',lw, 'Color', c1 );
% beta=1
plot(g1,x1(:,11),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,11),'-', 'LineWidth', lw, 'Color', c2 );
% beta=1.5
plot(g2,x2(:,11),'--', 'LineWidth', lw, 'Color', c3 );
plot(g2s,x2s(:,11),'-', 'LineWidth', lw, 'Color', c3 );
% beta=7/3
plot(g3,x3(:,11),'--', 'LineWidth', lw, 'Color', c4 );
plot(g3s,x3s(:,11),'-', 'LineWidth', lw, 'Color', c4 );
% beta=4
plot(g4,x4(:,11),'--', 'LineWidth', lw, 'Color', c5 );
plot(g4s,x4s(:,11),'-', 'LineWidth', lw, 'Color', c5 );
% beta=9
plot(g5,x5(:,11),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5s,x5s(:,11),'-', 'LineWidth', lw, 'Color', c6 );
% branch points
plot( [g1(1)], [0], '.k', 'MarkerSize', 40); 
plot( [BP1], x1(BP1index, [11]), '.k', 'MarkerSize', 40);  
plot( [BP2], x2(BP2index, [11]), '.k', 'MarkerSize', 40); 
plot( [BP3], x3(BP3index, [11]), '.k', 'MarkerSize', 40); 
plot( [BP4(2)], x4(BP4index, [11]), '.k', 'MarkerSize', 40); 
plot( [BP5(2)], x5(BP5index, [11]), '.k', 'MarkerSize', 40); 
% stability switch points
plot( [BP4(1)], x4(BP4index2, [11]), 'dk', 'MarkerSize', 10, 'LineWidth',3); 
plot( [BP5(1)], x5(BP5index2, [11]), 'dk', 'MarkerSize', 10, 'LineWidth',3);

xlabel('$g$');
ylabel('$X_I$');

% % version 1, zoomed out
% axis([0,12,-0.1,0.7]);
% gpos = [ 2.2 ; 2.65 ; 5.25 ; 2.6 ; 6.2 ];
% Ilabelpos = [ -0.06 ; 0.025 ; 0.4 ; 0.6 ; 0.22 ];
% labels = {'$\beta_C = 1$','$\beta_C = 3/2$', '$\beta_C = 7/3$', '$\beta_C = 4$', '$\beta_C = 9$'};
% labelpoints( gpos, Ilabelpos, labels,'NW',0,0,'FontSize',labelFontSize,'interpreter','latex');
% plot([2 3.1],[0.22 0.4],'-k','Linewidth',2);

% version 2, zoomed in
axis([0,2,-0.1,0.7]);
gpos = [ 1 ; 1.15 ; 1.9 ; 1.1 ; 1.9 ];
Ilabelpos = [ -0.07 ; 0.10 ; 0.25 ; 0.6 ; 0.42 ];
labels = {'$\beta_C = 1$','$\beta_C = 3/2$', '$\beta_C = 7/3$', '$\beta_C = 4$', '$\beta_C = 9$'};
labelpoints( gpos, Ilabelpos, labels,'NW',0,0,'FontSize',labelFontSize,'interpreter','latex');


%%

% excitatory, xE1 only, zoomed out, showing stable branches at limit

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% zero solution
plot([0 g1(1)], [0 0] ,'-','LineWidth',lw, 'Color', c1 );
plot([g1(1) 20], [0 0] ,'--','LineWidth',lw, 'Color', c1 );
% beta=1
plot(g1,x1(:,1),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,1),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1lim,x1lim(:,1),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1slim,x1slim(:,1),'-', 'LineWidth', lw, 'Color', c2 );
% beta=1.5
plot(g2,x2(:,1),'--', 'LineWidth', lw, 'Color', c3 );
plot(g2s,x2s(:,1),'-', 'LineWidth', lw, 'Color', c3 );
plot(g2lim,x2lim(:,1),'--', 'LineWidth', lw, 'Color', c3 );
plot(g2slim,x2slim(:,1),'-', 'LineWidth', lw, 'Color', c3 );
% beta=7/3
plot(g3,x3(:,1),'--', 'LineWidth', lw, 'Color', c4 );
plot(g3s,x3s(:,1),'-', 'LineWidth', lw, 'Color', c4 );
plot(g3lim,x3lim(:,1),'--', 'LineWidth', lw, 'Color', c4 );
plot(g3slim,x3slim(:,1),'-', 'LineWidth', lw, 'Color', c4 );
% beta=4
plot(g4,x4(:,1),'--', 'LineWidth', lw, 'Color', c5 );
plot(g4s,x4s(:,1),'-', 'LineWidth', lw, 'Color', c5 );
plot(g4lim,x4lim(:,1),'--', 'LineWidth', lw, 'Color', c5 );
plot(g4slim,x4slim(:,1),'-', 'LineWidth', lw, 'Color', c5 );
% beta=9
plot(g5,x5(:,1),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5s,x5s(:,1),'-', 'LineWidth', lw, 'Color', c6 );
plot(g5lim,x5lim(:,1),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5slim,x5slim(:,1),'-', 'LineWidth', lw, 'Color', c6 );
% branch points
plot( [g1(1)], [0], '.k', 'MarkerSize', 40); 
plot( [BP1 BP1], x1(BP1index, [1]), '.k', 'MarkerSize', 40);  
plot( [BP2 BP2], x2(BP2index, [1]), '.k', 'MarkerSize', 40); 
plot( [BP3 BP3], x3(BP3index, [1]), '.k', 'MarkerSize', 40); 
plot( [BP4(2) BP4(2)], x4(BP4index, [1]), '.k', 'MarkerSize', 40); 
plot( [BP5(2) BP5(2)], x5(BP5index, [1]), '.k', 'MarkerSize', 40); 
% % stability switch points
% plot( [BP4(1)], x4(BP4index2, [1]), 'dk', 'MarkerSize', 10, 'LineWidth',3); 
% plot( [BP5(1)], x5(BP5index2, [1]), 'dk', 'MarkerSize', 10, 'LineWidth',3);

xlabel('$g$');
ylabel('$X_{E_1}$');

% version 1, zoomed out
axis([0,12,-0.2,5.5]);
% gpos = [ 8 ; 8.5 ; 8.5 ; 8 ; 8 ];
% Elabelpos = [ 5 ; 3.85 ; 2.7 ; 1.55 ; 0.45];
% labels = {'$\beta_C = 1$','$\beta_C = 3/2$', '$\beta_C = 7/3$', '$\beta_C = 4$', '$\beta_C = 9$'};
% labelpoints( gpos, Elabelpos, labels,'NW',0,0,'FontSize',labelFontSize,'interpreter','latex');

%% 

% inhibitory, zoomed out, showing stable branches at limit

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% zero solution
plot([0 g1(1)], [0 0] ,'-','LineWidth',lw, 'Color', c1 );
plot([g1(1) 20], [0 0] ,'--','LineWidth',lw, 'Color', c1 );
% beta=1
plot(g1,x1(:,11),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,11),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1lim,x1lim(:,11),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1slim,x1slim(:,11),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1lim,x1lim(:,end),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1slim,x1slim(:,end),'-', 'LineWidth', lw, 'Color', c2 );
% beta=1.5
plot(g2,x2(:,11),'--', 'LineWidth', lw, 'Color', c3 );
plot(g2s,x2s(:,11),'-', 'LineWidth', lw, 'Color', c3 );
plot(g2lim,x2lim(:,11),'--', 'LineWidth', lw, 'Color', c3 );
plot(g2slim,x2slim(:,11),'-', 'LineWidth', lw, 'Color', c3 );
plot(g2lim,x2lim(:,end),'--', 'LineWidth', lw, 'Color', c3 );
plot(g2slim,x2slim(:,end),'-', 'LineWidth', lw, 'Color', c3 );
% beta=7/3
plot(g3,x3(:,11),'--', 'LineWidth', lw, 'Color', c4 );
plot(g3s,x3s(:,11),'-', 'LineWidth', lw, 'Color', c4 );
plot(g3lim,x3lim(:,11),'--', 'LineWidth', lw, 'Color', c4 );
plot(g3slim,x3slim(:,11),'-', 'LineWidth', lw, 'Color', c4 );
plot(g3lim,x3lim(:,end),'--', 'LineWidth', lw, 'Color', c4 );
plot(g3slim,x3slim(:,end),'-', 'LineWidth', lw, 'Color', c4 );
% beta=4
plot(g4,x4(:,11),'--', 'LineWidth', lw, 'Color', c5 );
plot(g4s,x4s(:,11),'-', 'LineWidth', lw, 'Color', c5 );
plot(g4lim,x4lim(:,11),'--', 'LineWidth', lw, 'Color', c5 );
plot(g4slim,x4slim(:,11),'-', 'LineWidth', lw, 'Color', c5 );
plot(g4lim,x4lim(:,end),'--', 'LineWidth', lw, 'Color', c5 );
plot(g4slim,x4slim(:,end),'-', 'LineWidth', lw, 'Color', c5 );
% beta=9
plot(g5,x5(:,11),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5s,x5s(:,11),'-', 'LineWidth', lw, 'Color', c6 );
plot(g5lim,x5lim(:,11),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5slim,x5slim(:,11),'-', 'LineWidth', lw, 'Color', c6 );
plot(g5lim,x5lim(:,end),'--', 'LineWidth', lw, 'Color', c6 );
plot(g5slim,x5slim(:,end),'-', 'LineWidth', lw, 'Color', c6 );
% branch points
plot( [g1(1)], [0], '.k', 'MarkerSize', 40); 
plot( [BP1], x1(BP1index, [11]), '.k', 'MarkerSize', 40);  
plot( [BP2], x2(BP2index, [11]), '.k', 'MarkerSize', 40); 
plot( [BP3], x3(BP3index, [11]), '.k', 'MarkerSize', 40); 
plot( [BP4(2)], x4(BP4index, [11]), '.k', 'MarkerSize', 40); 
plot( [BP5(2)], x5(BP5index, [11]), '.k', 'MarkerSize', 40); 
% % stability switch points
% plot( [BP4(1)], x4(BP4index2, [11]), 'dk', 'MarkerSize', 10, 'LineWidth',3); 
% plot( [BP5(1)], x5(BP5index2, [11]), 'dk', 'MarkerSize', 10, 'LineWidth',3);

xlabel('$g$');
ylabel('$X_I$');

% % version 1, zoomed out
% axis([0,12,-0.1,0.7]);
% gpos = [ 2.2 ; 2.65 ; 5.25 ; 2.6 ; 6.2 ];
% Ilabelpos = [ -0.06 ; 0.025 ; 0.4 ; 0.6 ; 0.22 ];
% labels = {'$\beta_C = 1$','$\beta_C = 3/2$', '$\beta_C = 7/3$', '$\beta_C = 4$', '$\beta_C = 9$'};
% labelpoints( gpos, Ilabelpos, labels,'NW',0,0,'FontSize',labelFontSize,'interpreter','latex');
% plot([2 3.1],[0.22 0.4],'-k','Linewidth',2);

%% 3d plot showing stable branches at limit

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% zero solution
plot3([0 g1(1)], [0 0] , [0 0], '-','LineWidth',lw, 'Color', c1 );
plot3([g1(1) 3], [0 0] ,[0 0], '--','LineWidth',lw, 'Color', c1 );
% beta=1
g1ploc = 41;
g1ploc = g1ploc + 5;
plot3(g1(1:g1ploc),x1(1:g1ploc,1),x1(1:g1ploc,11),'--', 'LineWidth', lw, 'Color', c2 );
plot3(g1s,x1s(:,1),x1s(:,11),'-', 'LineWidth', lw, 'Color', c2 );
plot3(g1lim,x1lim(:,1),x1lim(:,11),'--', 'LineWidth', lw, 'Color', c2 );
plot3(g1slim,x1slim(:,1),x1lim(:,11),'-', 'LineWidth', lw, 'Color', c2 );
% beta=1.5
g2ploc = 44;
g2ploc = g2ploc + 5;
ming2loc = 38;
[~, ming2sloc] = min(g2slim);
plot3(g2(1:g2ploc),x2(1:g2ploc,1),x2(1:g2ploc,11),'--', 'LineWidth', lw, 'Color', c3 );
plot3(g2s,x2s(:,1),x2s(:,11),'-', 'LineWidth', lw, 'Color', c3 );
plot3(g2lim(1:ming2loc),x2lim(1:ming2loc,1),x2lim(1:ming2loc,[11 30]),'--', 'LineWidth', lw, 'Color', c3 );
plot3(g2slim(1:ming2sloc),x2slim(1:ming2sloc,1),x2slim(1:ming2sloc,[11 30]),'-', 'LineWidth', lw, 'Color', c3 );
% beta=7/3
g3ploc = 41;
g3ploc = g3ploc + 5;
ming3loc = 36;
[~, ming3sloc] = min(g3slim);
plot3(g3(1:g3ploc),x3(1:g3ploc,1),x3(1:g3ploc,11),'--', 'LineWidth', lw, 'Color', c4 );
plot3(g3s,x3s(:,1),x3s(:,11),'-', 'LineWidth', lw, 'Color', c4 );
plot3(g3lim(1:ming3loc),x3lim(1:ming3loc,1),x3lim(1:ming3loc,[11 30]),'--', 'LineWidth', lw, 'Color', c4 );
plot3(g3slim(1:ming3sloc),x3slim(1:ming3sloc,1),x3slim(1:ming3sloc,[11 30]),'-', 'LineWidth', lw, 'Color', c4 );
% beta=4
g4ploc = 45;
g4ploc = g4ploc + 5;
ming4loc = 87;
[~, ming4sloc] = min(g4slim);
plot3(g4(1:g4ploc),x4(1:g4ploc,1),x4(1:g4ploc,11),'--', 'LineWidth', lw, 'Color', c5 );
plot3(g4s,x4s(:,1),x4s(:,11),'-', 'LineWidth', lw, 'Color', c5 );
plot3(g4lim(1:ming4loc),x4lim(1:ming4loc,1),x4lim(1:ming4loc,[11 30]),'--', 'LineWidth', lw, 'Color', c5 );
plot3(g4slim(1:ming4sloc),x4slim(1:ming4sloc,1),x4slim(1:ming4sloc,[11 30]),'-', 'LineWidth', lw, 'Color', c5 );
% beta=9
g5ploc = 44;
g5ploc = length(g5);
ming5loc = 160;
[~, ming5sloc] = min(g5slim);
plot3(g5(1:g5ploc),x5(1:g5ploc,1),x5(1:g5ploc,11),'--', 'LineWidth', lw, 'Color', c6 );
plot3([ BP5(1) g5s],[ x5(BP5index2(1), [1]) ; x5s(:,1)],[ x5(BP5index2(1), [11]) ; x5s(:,11)],'-', 'LineWidth', lw, 'Color', c6 );
plot3(g5lim(1:ming5loc),x5lim(1:ming5loc,1),x5lim(1:ming5loc,[11 30]),'--', 'LineWidth', lw, 'Color', c6 );
plot3(g5slim(1:ming5sloc),x5slim(1:ming5sloc,1),x5slim(1:ming5sloc,[11 30]),'-', 'LineWidth', lw, 'Color', c6 );

% branch points
plot3( [g1(1)], [0], [0], '.k', 'MarkerSize', 40); 
plot3( [BP1], x1(BP1index, [1]), x1(BP1index, [11]), '.k', 'MarkerSize', 40);  
plot3( [BP2], x2(BP2index, [1]), x2(BP2index, [11]), '.k', 'MarkerSize', 40); 
plot3( [BP3], x3(BP3index(1), [1]), x3(BP3index(1), [11]), '.k', 'MarkerSize', 40); 
plot3( [BP4(2)], x4(BP4index(1), [1]), x4(BP4index(1), [11]), '.k', 'MarkerSize', 40); 
plot3( [BP5(2)], x5(BP5index(1), [1]), x5(BP1index(1), [11]), '.k', 'MarkerSize', 40); 
% stability switch points
plot3( [BP4(1)], x4(BP4index2(1), [1]), x4(BP4index2(1), [11]), 'dk', 'MarkerSize', 10, 'LineWidth',3); 
plot3( [BP5(1)], x5(BP5index2(1), [1]), x5(BP5index2(1), [11]), 'dk', 'MarkerSize', 10, 'LineWidth',3);

% beta labels
text(11,.4,.33,'$\beta = 9$','FontSize',labelFontSize,'interpreter','latex');
text(11,1.5,.33,'$\beta = 4$','FontSize',labelFontSize,'interpreter','latex');
text(11,2.6,.33,'$\beta = 7/3$','FontSize',labelFontSize,'interpreter','latex');
text(11,3.7,.33,'$\beta = 3/2$','FontSize',labelFontSize,'interpreter','latex');
text(11,4.8,.33,'$\beta = 1$','FontSize',labelFontSize,'interpreter','latex');

% beta_C labels
% beta labels
text(.4,.7,.25,'$\beta_C = 9$','FontSize',labelFontSize,'interpreter','latex');
text(1,2,.58,'$\beta_C = 4$','FontSize',labelFontSize,'interpreter','latex');
text(-.4,3,.56,'$\beta_C = 7/3$','FontSize',labelFontSize,'interpreter','latex');
text(-0.3,4,.32,'$\beta_C = 3/2$','FontSize',labelFontSize,'interpreter','latex');
text(0,4.5,-.2,'$\beta_C = 1$','FontSize',labelFontSize,'interpreter','latex');

axis([0 12 0 5 -0.3 0.7]);
view(-11.5, 35);

xlabel('$g$');
ylabel('$X_{E_1}$');
zlabel('$X_{I}$');
