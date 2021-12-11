% parameters for simulation

N = 50;
nI = 10;
nE = 40;
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
fontSize = 24;
labelFontSize = 24;
textLabelFontSize = 30;
markerSize = 50;
lw = 3;

load noclusterN50beta9;

g00 = br{1}.parS;
x0  = br{1}.xS;
g0s = sb{1}.parS;
g0x = sb{1}.xS;

g9  = br{2}.parS;
x9  = -br{2}.xS;
Hopfx = xHB(1);
Hopfy = yHB(2, :);

load noclusterN50beta4;

g4  = br{1}.parS;
x4  = br{1}.xS;
Hopfx = [Hopfx xHB ];
Hopfy = [Hopfy ; yHB ];

load noclusterN50beta2333;

g233  = br{1}.parS;
x233  = br{1}.xS;
Hopfx = [Hopfx xHB ];
Hopfy = [Hopfy ; yHB ];

load noclusterN50beta15;

g15  = br{1}.parS;
x15  = br{1}.xS;
g15s = sb{1}.parS;
g15x = sb{1}.xS;
Hopfx = [Hopfx xHB ];
Hopfy = [Hopfy ; yHB ];

load noclusterN50beta1;

g1  = br{1}.parS;
x1  = br{1}.xS;
g1s = sb{1}.parS;
g1x = sb{1}.xS;
Hopfx = [Hopfx xHB ];
Hopfy = [Hopfy ; yHB ];

% inhibitory, xI1 and xI2

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% zero solution
plot(g00,x0(:,1),'--', 'LineWidth', lw, 'Color', c1 );
plot(g0s,g0x(:,1),'-','LineWidth',lw, 'Color', c1 );
% beta=1
plot(g1,x1(:,2),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1,x1(:,10),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1s,g1x(:,2),'-', 'LineWidth', lw, 'Color', c2 );
plot(g1s,g1x(:,10),'-', 'LineWidth', lw, 'Color', c2 );
% beta=1.5
plot(g15,x15(:,2),'--', 'LineWidth', lw, 'Color', c3 );
plot(g15,x15(:,10),'--', 'LineWidth', lw, 'Color', c3 );
plot(g15s,g15x(:,2),'-', 'LineWidth', lw, 'Color', c3 );
plot(g15s,g15x(:,10),'-', 'LineWidth', lw, 'Color', c3 );
% beta=7/3
plot(g233,x233(:,2),'--', 'LineWidth', lw, 'Color', c4 );
plot(g233,x233(:,10),'--', 'LineWidth', lw, 'Color', c4 );
% beta=4
plot(g4,x4(:,2),'--', 'LineWidth', lw, 'Color', c5 );
plot(g4,x4(:,10),'--', 'LineWidth', lw, 'Color', c5 );
% beta=9
plot(g9,x9(:,2),'--', 'LineWidth', lw, 'Color', c6 );
plot(g9,x9(:,4),'--', 'LineWidth', lw, 'Color', c6 );

g0 = sqrt(50)/(4*0.7);
plot( g0, 0, '.k', 'MarkerSize', 40);                   % branch points
scatter( Hopfx, Hopfy(:,2), 175, 'sk', 'filled');       % Hopf (I1)
scatter( Hopfx, Hopfy(:,10), 175, 'sk', 'filled');       % Hopf (I2)

axis([2.45,3,-0.4,0.4]);

% labelpoints( gpos, I1labelpos, labels,'NE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
% labelpoints( gpos(1), I2labelpos(1), labels(1),'NE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
% labelpoints( gpos(2), I2labelpos(2), labels(2),'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');

xlabel('$g$');
ylabel('$X_I$');
text(2.95,0.35,'$X_{I_1}$','FontSize',labelFontSize,'interpreter','latex');
text(2.95,-0.35,'$X_{I_2}$','FontSize',labelFontSize,'interpreter','latex');

%% inhibitory, only xI2

gpos = [ g1(70) ; g15(80); g233(80); g4(80); g9(78) ];
I2labelpos = [ x1(75,2) ; x15(80,2)+0.01; x233(80,2)+0.01; x4(70,2)+0.0155; x9(80,2)+0.0205 ];
labels = {'$\beta = 1$','$\beta = 3/2$', '$\beta = 7/3$', '$\beta = 4$', '$\beta = 9$'};

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% zero solution
plot(g00,x0(:,1),'--', 'LineWidth', lw, 'Color', c1 );
plot(g0s,g0x(:,1),'-','LineWidth',lw, 'Color', c1 );
% beta=1
plot(g1,x1(:,2),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1s,g1x(:,2),'-', 'LineWidth', lw, 'Color', c2 );
% beta=1.5
plot(g15,x15(:,2),'--', 'LineWidth', lw, 'Color', c3 );
plot(g15s,g15x(:,2),'-', 'LineWidth', lw, 'Color', c3 );
% beta=7/3
plot(g233,x233(:,2),'--', 'LineWidth', lw, 'Color', c4 );
% beta=4
plot(g4,x4(:,2),'--', 'LineWidth', lw, 'Color', c5 );
% beta=9
plot(g9,x9(:,2),'--', 'LineWidth', lw, 'Color', c6 );

g0 = sqrt(50)/(4*0.7);
plot( g0, 0, '.k', 'MarkerSize', 40);                   % branch points
scatter( Hopfx, Hopfy(:,2), 175, 'sk', 'filled');       % Hopf (I2)

axis([2.45,3.55,-0.34,0.01]);

labelpoints( gpos, I2labelpos, labels,'S',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
% labelpoints( gpos(1), I2labelpos(1), labels(1),'NE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
% labelpoints( gpos(2), I2labelpos(2), labels(2),'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');

xlabel('$g$');
ylabel('$x_{I_2}$');

%% Excitatory

gpos = [ g1(140) ; g15(140); g233(140); g4(120); g9(100) ];
Elabelpos = [ x1(140,1) ; x15(140,1); x233(136,1); x4(120,1); x9(100,1) ];
labels = {'$\beta = 1$','$\beta = 3/2$', '$\beta = 7/3$', '$\beta = 4$', '$\beta = 9$'};

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
% zero solution
% plot(g00,x0(:,1),'--', 'LineWidth', lw, 'Color', c1 );
plot(g0s,g0x(:,1),'-','LineWidth',lw, 'Color', c1 );
% beta=1
plot(g1,x1(:,1),'--', 'LineWidth', lw, 'Color', c2 );
plot(g1s,g1x(:,1),'-', 'LineWidth', lw, 'Color', c2 );
% beta=1.5
plot(g15,x15(:,1),'--', 'LineWidth', lw, 'Color', c3 );
plot(g15s,g15x(:,1),'-', 'LineWidth', lw, 'Color', c3 );
% beta=7/3
plot(g233,x233(:,1),'--', 'LineWidth', lw, 'Color', c4 );
% beta=4
plot(g4,x4(:,1),'--', 'LineWidth', lw, 'Color', c5 );
% beta=9
plot(g9,x9(:,1),'--', 'LineWidth', lw, 'Color', c6 );

g0 = sqrt(50)/(4*0.7);
plot( g0, 0, '.k', 'MarkerSize', 40);                   % branch points
scatter( Hopfx, Hopfy(:,1), 175, 'sk', 'filled');       % Hopf (I2)

axis([2.45,3.55,-0.002,0.03]);

labelpoints( gpos, Elabelpos, labels,'NW',0,0,'FontSize',labelFontSize,'interpreter','latex');

xlabel('$g$');
ylabel('$x_E$');

