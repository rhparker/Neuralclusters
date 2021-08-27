% parameters for simulation

N = 35;
nC = 7;
nI = 7;
nE = 28;
p = 4;
alpha = 4;
f = 0.8;
mee = 0.7;


%% plot 

% default MATLAB colors
c1 = [0 0.4470 0.7410];
c2 = [0.8500 0.3250 0.0980];
c3 = [0.9290 0.6940 0.1250];
c4 = [0.4940 0.1840 0.5560];

% plot parameters
fontSize = 20;
labelFontSize = 20;
markerSize = 50;
lw = 3;

load EclusterN35Nc7p4largeg1;

g1 = br{1}.parS;
x1  = br{1}.xS;
g1s = sb{1}.parS;
x1s = sb{1}.xS;

load EclusterN35Nc7p4largeg3;

g3 = br{1}.parS;
x3  = br{1}.xS;
g3s = sb{1}.parS;
x3s = sb{1}.xS;

load EclusterN35Nc7p4largeg5;

g5 = br{1}.parS;
x5  = br{1}.xS;
g5s = sb{1}.parS;
x5s = sb{1}.xS;

%%

% excitatory
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% balance = 1
plot(g1,x1(:,1),'--', 'LineWidth', lw, 'Color', c1 );
plot(g1,x1(:,7),'--', 'LineWidth', lw, 'Color', c1 );
plot(g1s,x1s(:,1),'-', 'LineWidth', lw, 'Color', c1 );
plot(g1s,x1s(:,7),'-', 'LineWidth', lw, 'Color', c1 );
% balance = 3
plot(g3,x3(:,1),'--', 'LineWidth', lw, 'Color', c2 );
plot(g3,x3(:,7),'--', 'LineWidth', lw, 'Color', c2 );
plot(g3s,x3s(:,1),'-', 'LineWidth', lw, 'Color', c2 );
plot(g3s,x3s(:,7),'-', 'LineWidth', lw, 'Color', c2 );
% balance = 5
plot(g5,x5(:,1),'--', 'LineWidth', lw, 'Color', c2 );
plot(g5,x5(:,7),'--', 'LineWidth', lw, 'Color', c2 );
plot(g5s,x5s(:,1),'-', 'LineWidth', lw, 'Color', c2 );
plot(g5s,x5s(:,7),'-', 'LineWidth', lw, 'Color', c2 );

% axis([0 5 -4 2]);                

% labels = {'$\beta_C = 1$', '$\beta_C = 3$'};
% gpos = [ 1.25 1.25 ];
% Elabelpos = [ -2.0 .4 ];
% labelpoints( gpos, Elabelpos, labels,'N',0.5,1,'FontSize',labelFontSize,'interpreter','latex');

xlabel('$g$');
ylabel('$X_E$');
% text(0.1,1.5,'$X_{E_1}$','FontSize',labelFontSize,'interpreter','latex');
% text(0.1,-3.5,'$X_{E_2}$','FontSize',labelFontSize,'interpreter','latex');

%% inhibitory

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on;
% origin
plot(g00,x0(:,end),'--', 'LineWidth', lw, 'Color', c1 );
plot([0 g0s],[0 ; g0x(:,end)],'-', 'LineWidth', lw, 'Color', c1 );
% betac=1
plot(g1s,x1s(:,5),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,7    ),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1a,x1a(:,5),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1a,x1a(:,7),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1sa,x1sa(:,5),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1sa,x1sa(:,7),'-', 'LineWidth', lw, 'Color', c2 );
% betac=3
plot(g3,x3(:,5),'--', 'LineWidth', lw, 'Color', c3 );
plot(g3a,x3a(:,5),'--', 'LineWidth', lw, 'Color', c3 );
plot(g3a,x3a(:,6),'--', 'LineWidth', lw, 'Color', c3 );
plot(g3as,x3as(:,5),'-', 'LineWidth', lw, 'Color', c3 );
plot(g3as,x3as(:,6),'-', 'LineWidth', lw, 'Color', c3 );

% branch points
brg =  [ g3(1) g3a(1) sqrt(N)/(mee*Nc) ];
bre1 = [ 0 x3a(1,5) 0 ];
bre2 = [ 0 x3a(1,7) 0 ];
plot( brg, bre1, '.k', brg, bre2,  '.k', 'MarkerSize', 40);  

labels = {'$\beta_C = 1$', '$\beta_C = 3$'};
gpos = [ 1 1 ];
Elabelpos = [ -0.25 .15 ];
labelpoints( gpos, Elabelpos, labels,'N',0.5,1,'FontSize',labelFontSize,'interpreter','latex');

axis([0 5 -0.8 0.8]);

xlabel('$g$');
ylabel('$X_I$');
text(0.1,0.7,'$X_{I_1}$','FontSize',labelFontSize,'interpreter','latex');
text(0.1,-0.7,'$X_{I_2}$','FontSize',labelFontSize,'interpreter','latex');


%% betac=1 branch only

% excitatory
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% origin
plot(g00,x0(:,1),'--', 'LineWidth', lw, 'Color', c1 );
plot([0 g0s],[0 ; g0x(:,1)],'-', 'LineWidth', lw, 'Color', c1 );
% betac=1
plot(g1,x1(:,1),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1,x1(:,3),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,1),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,3),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1a,x1a(:,1),'--', 'LineWidth', lw, 'Color', c3 );
plot(g1a,x1a(:,3),'--', 'LineWidth', lw, 'Color', c3 );
plot(g1sa,x1sa(:,1),'-', 'LineWidth', lw, 'Color', c3 );
plot(g1sa,x1sa(:,3),'-', 'LineWidth', lw, 'Color', c3 );
plot(g1beta3,x1beta3(:,1),'--', 'LineWidth', lw, 'Color', c4 );
plot(g1beta3,x1beta3(:,3),'--', 'LineWidth', lw, 'Color', c4 );
axis([0 5 -2.5 2.5]);

% branch points
brg =  [ g3(1) g1beta3(1) ];
bre1 = [ 0 x1beta3(1,1) ];
bre2 = [ 0 x1beta3(1,3)];
plot( brg, bre1, '.k', brg, bre2,  '.k', 'MarkerSize', 40);                   

labels = {'$\beta_C=1$','$\beta = 1$', '$\beta = 3$'};
gpos = [ 1 4.5 4.5 ];
Elabelpos = [ 0.6 1.65 1.0 ];
labelpoints( gpos, Elabelpos, labels,'N',0.5,1,'FontSize',labelFontSize,'interpreter','latex');

xlabel('$g$');
ylabel('$X_E$');
text(0.1,2,'$X_{E_1}$','FontSize',labelFontSize,'interpreter','latex');
text(0.1,-2,'$X_{E_2}$','FontSize',labelFontSize,'interpreter','latex');

%% inhibitory

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on;
% origin
plot(g00,x0(:,end),'--', 'LineWidth', lw, 'Color', c1 );
plot([0 g0s],[0 ; g0x(:,end)],'-', 'LineWidth', lw, 'Color', c1 );
% betac=1
plot(g1s,x1s(:,5),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1s,x1s(:,7    ),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1a,x1a(:,5),'--', 'LineWidth', lw, 'Color', c3 );
plot(g1a,x1a(:,7),'--', 'LineWidth', lw, 'Color', c3 );
plot(g1sa,x1sa(:,5),'-', 'LineWidth', lw, 'Color', c3 );
plot(g1sa,x1sa(:,7),'-', 'LineWidth', lw, 'Color', c3 );
plot(g1beta3,x1beta3(:,5),'--', 'LineWidth', lw, 'Color', c4 );
plot(g1beta3,x1beta3(:,7),'--', 'LineWidth', lw, 'Color', c4 );

% branch points
brg =  [ g3(1) sqrt(N)/(mee*Nc) ];
bre1 = [ 0 0 ];
bre2 = [ 0 0 ];
plot( brg, bre1, '.k', brg, bre2,  '.k', 'MarkerSize', 40);  

labels = {'$\beta_C = 1$', '$\beta = 1$', '$\beta = 3$'};
gpos = [ 1 4.5 4.5 ];
Elabelpos = [ -0.25 .55 .05 ];
labelpoints( gpos, Elabelpos, labels,'N',0.5,1,'FontSize',labelFontSize,'interpreter','latex');

axis([0 5 -0.9 0.9]);

% labelpoints( gpos, I1labelpos, labels,'NE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
% labelpoints( gpos(1), I2labelpos(1), labels(1),'NE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
% labelpoints( gpos(2), I2labelpos(2), labels(2),'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');

xlabel('$g$');
ylabel('$X_I$');
text(0.1,0.7,'$X_{I_1}$','FontSize',labelFontSize,'interpreter','latex');
text(0.1,-0.7,'$X_{I_2}$','FontSize',labelFontSize,'interpreter','latex');
