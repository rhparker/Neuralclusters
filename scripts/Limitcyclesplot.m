% parameters for simulation

N = 20;
nI = 4;
nE = 16;
alpha = 4;
f = 0.8;
mee = 0.7;

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

ind = 15;

load limitcycles;

% xI vs xE 
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

plot(br{1}.xS(ind,:,1), br{1}.xS(ind,:,2), 'LineWidth', lw );
xlabel('$x_E$');
ylabel('$x_I$');

%% xI vs xE 
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on;

plot( br{1}.t(ind,:)*br{1}.period(ind), br{1}.xS(ind,:,1), '-','LineWidth', lw );
plot( br{1}.t(ind,:)*br{1}.period(ind), br{1}.xS(ind,:,2), '--','LineWidth', lw );
xlabel('$t$');
ylabel('$x$');
labels = {'$x_E$','$x_I$'};
legend(labels,'location','SW');

disp( br{1}.parS(ind) );
disp( br{1}.period(ind) );





