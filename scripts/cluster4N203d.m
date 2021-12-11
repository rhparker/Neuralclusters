% parameters for simulation

N = 20;
nI = 4;
nE = 16;
nC = 4;
alpha = 4;
f = 0.8;
mee = 0.7;


%% plot 

% default MATLAB colors
c1 = [0 0.4470 0.7410];
c2 = [0.8500 0.3250 0.0980];
c3 = [0.9290 0.6940 0.1250];
c4 = [0.4940 0.1840 0.5560];
c5 = [0.4660, 0.6740, 0.1880];          	
c6 = [0.3010, 0.7450, 0.9330];	          	
c7 = [0.6350, 0.0780, 0.1840];

% plot parameters
fontSize = 38;
labelFontSize = 38;
markerSize = 50;
lw = 3;

load EclusterN20Nc4p4beta3;

g00 = br{1}.parS;
x0  = br{1}.xS;
g0s = sb{1}.parS;
g0x = sb{1}.xS;

g3 = br{2}.parS;
x3 = br{2}.xS;

g3a = br{6}.parS;
x3a = br{6}.xS;
g3as = sb{6}.parS;
x3as = sb{6}.xS;

g3b = br{9}.parS;
x3b = br{9}.xS;
g3bs = sb{9}.parS;
x3bs = sb{9}.xS;

g3c = br{4}.parS;
x3c = br{4}.xS;

load EclusterN20Nc4p4beta3a;

g3d = br{6}.parS;
x3d = br{6}.xS;

load EclusterN20Nc4p4beta1;

g1 = br{1}.parS;
x1 = br{1}.xS;
g1s = sb{1}.parS;
x1s = sb{1}.xS;
g1beta3 = br{2}.parS;
x1beta3 = br{2}.xS;

load EclusterN20Nc4p4beta1a;

g1a = br{1}.parS;
x1a = br{1}.xS;
g1sa = sb{1}.parS;
x1sa = sb{1}.xS;

%% g, xE1, xI1/xI2
Iind = [5 7];

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
plot3(g1s,x1s(:,4),x1s(:,Iind),'-', 'LineWidth', lw, 'Color', c2 );
plot3(g1a,x1a(:,1),0*x1a(:,1),'--', 'LineWidth', lw, 'Color', c2 );
plot3(g1a,x1a(:,1),x1a(:,Iind),'--', 'LineWidth', lw, 'Color', c4 );
plot3(g1sa,x1sa(:,1),x1sa(:,Iind),'-', 'LineWidth', lw, 'Color', c4 );
plot3(g1beta3,x1beta3(:,4),x1beta3(:,Iind),'--', 'LineWidth', lw, 'Color', c5 );
% betac=3
plot3(g3,x3(:,1),x3(:,5),'--', 'LineWidth', lw, 'Color', c3 );
plot3(g3a,x3a(:,1),x3a(:,5:6),'--', 'LineWidth', lw, 'Color', c5 );
plot3(g3as,x3as(:,1),x3as(:,5:6),'-', 'LineWidth', lw, 'Color', c5 );
plot3(g3d,x3d(:,1),x3d(:,3:4),'--', 'LineWidth', lw, 'Color', c4 );

% branch points
[mg1, mg1ind] = min(g1a);
[mg3, mg3ind] = min(g3d);
brg =  [ g3(1) g1a(mg1ind) g3d(mg3ind) ];
bre = [ 0 x1a(mg1ind,1) x3d(mg3ind,1) ];
bri = [ 0 x1a(mg1ind,7) x3d(mg3ind,4) ];
plot3( brg, bre, bri, '.k', 'MarkerSize', 50);  

view(-27,41);
pbaspect([3 2 1]);
axis([0 4 0 2 -1 1 ]);

xlabel('$g$');
ylabel('$x_E$');
zlabel('$x_I$');

text(0.20,1.9,0.2,'$\beta_C = 1$','FontSize',labelFontSize,'interpreter','latex');
text(0.9,1.0,0.2,'$\beta_C = 3$','FontSize',labelFontSize,'interpreter','latex');

% bottom
text(4,0.6,-0.55,'$\beta = 3$','FontSize',labelFontSize,'interpreter','latex');
text(4.0,0.6,0.25,'$\beta = 1$','FontSize',labelFontSize,'interpreter','latex');

% top
text(2.6,2,0.95,'$\beta = 1$','FontSize',labelFontSize,'interpreter','latex');
text(4.05,1.75,-.75,'$\beta = 3$','FontSize',labelFontSize,'interpreter','latex');

