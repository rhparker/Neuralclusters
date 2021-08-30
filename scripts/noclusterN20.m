% parameters for simulation

N = 20;
nI = 4;
nE = 16;
alpha = 4;
f = 0.8;
mee = 0.7;

%% plot of I1=I2 branch

% plot parameters
fontSize = 18;
labelFontSize = 18;
markerSize = 50;
lw = 3;

load noclusterN20beta1;

g = br{2}.par;
y = br{2}.u2;

g0 = g(1);

y3 = sqrt( 3*(g - g0)./g.^3 );
y5 =  0.5* sqrt( 5./(g.^2) - sqrt( (5*g.^5).*(24*g0 - 19*g))./(g.^5) ); 

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

plot(g,y,'-',g,y3,'--',g,y5,'-.','LineWidth',lw);
axis([1.5 2.0 0 0.6]);
xlabel('$g$');
ylabel('$x_I$');
labels = {'numerical solution', '3rd order approximation', '5th order approximation'};
legend(labels,'location','NorthWest');

%% error plots for I1=I2 branch

figure;
plot(g,log(abs(y-y3)),'--','LineWidth',lw);

%% plot of beta=3 branch

% plot parameters
fontSize = 18;
labelFontSize = 18;
markerSize = 50;
lw = 3;
b = 3;

load noclusterN20beta3;

g = br{2}.par;
y = br{2}.u2;

g0 = g(1);

y3 = sqrt( 3*(g - g0)./((1 - b + b^2)*g.^3) );

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

plot(g,y,'-',g,y3,'--','LineWidth',lw);
axis([1.5 2.0 0 0.2]);
xlabel('$g$');
ylabel('$x_{I_1}$');
labels = {'numerical solution', '3rd order approximation'};
legend(labels,'location','NorthWest');

%% error plots for I1=I2 branch

figure;
plot(g,log(abs(y-y3)),'--','LineWidth',lw);

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

load noclusterN20beta1;

g00  = br{1}.par;
x0E = br{1}.u1;
x0I1 = br{1}.u2;
x0I2 = br{1}.u3;
g0s = sb{1}.parS;
g0x = sb{1}.xS;

g1  = br{2}.par;
x1E = br{2}.u1;
x1I1 = br{2}.u2;
x1I2 = br{2}.u3;
g1s = sb{2}.parS;
g1x = sb{2}.xS;
Hopfx = xHB(1:2);
Hopfy = yHB(1:2, :);

load noclusterN20beta3;
g3  = br{2}.par;
x3E = br{2}.u1;
x3I1 = br{2}.u2;
x3I2 = br{2}.u3;
g3s = sb{2}.parS;
g3x = sb{2}.xS;
Hopfx = [Hopfx xHB(2) ];
Hopfy = [Hopfy ; yHB(2, :)];

gpos = [ g1(2000) ;  g3(2000) ];
Elabelpos = [ x1E(2000) ; x3E(2000 ) ];
I1labelpos = [ x1I1(2000) ; x3I1(2000 ) ];
I2labelpos = [ x1I2(2000) ; x3I2(2000 ) ];
labels = {'$\beta = 1$','$\beta = 3$'};


% excitatory
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot(g00(1:1586),x0E(1:1586),'-', 'LineWidth', lw, 'Color', c1 );
plot(g1,x1E,'--','LineWidth',lw, 'Color', c2 );
plot(g3,x3E,'--','LineWidth',lw, 'Color', c3 );
plot(g1s,g1x(:,1),'-','LineWidth',lw, 'Color', c2 );
% plot(g3s,g3x(:,1),'-','LineWidth',lw, 'Color', c3 );
labelpoints( gpos, Elabelpos, labels,'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
plot( g0, 0, '.k', 'MarkerSize', 40);                   % branch points
scatter( Hopfx, Hopfy(:,1), 175, 'sk', 'filled');       % Hopf
xlabel('$g$');
ylabel('$X_E$');

% inhibitory

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

hold on;
plot(g00,x0I1,'--', 'LineWidth', lw, 'Color', c1 );
plot(g0s,g0x(:,1),'-','LineWidth',lw, 'Color', c1 );

plot(g1,x1I1,'--','LineWidth',lw, 'Color', c2);
plot(g1,x1I2,'--','LineWidth',lw, 'Color', c2);
plot(g3,x3I1,'--','LineWidth',lw, 'Color', c3);
plot(g3,x3I2,'--','LineWidth',lw, 'Color', c3);
plot(g1s,g1x(:,2:3),'-','LineWidth',lw, 'Color', c2);
% plot(g3s,g3x(:,2:3),'-','LineWidth',lw, 'Color', c3);
labelpoints( gpos, I1labelpos, labels,'NE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
labelpoints( gpos(1), I2labelpos(1), labels(1),'NE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
labelpoints( gpos(2), I2labelpos(2), labels(2),'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
plot( g0, 0, '.k', 'MarkerSize', 40);                   % branch points
scatter( Hopfx, Hopfy(:,2), 175, 'sk', 'filled');       % Hopf (I1)
scatter( Hopfx, Hopfy(:,3), 175, 'sk', 'filled');       % Hopf (I2)
xlabel('$g$');
ylabel('$X_I$');
text(4.5,0.35,'$X_{I_1}$','FontSize',labelFontSize,'interpreter','latex');
text(4.5,-0.35,'$X_{I_2}$','FontSize',labelFontSize,'interpreter','latex');



