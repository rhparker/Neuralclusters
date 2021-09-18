% default MATLAB colors
c1 = [0 0.4470 0.7410];
c2 = [0.8500 0.3250 0.0980];
c3 = [0.9290 0.6940 0.1250];
c2 = [0.4940 0.1840 0.5560];

a = 4;
mu = 0.7;
N = 20;

% load fixed point data

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

%% E vs I1

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on;

skip = 5;

load HopfnoclusterN20b1.mat;
end1 = 208;
H1end = 569;
for index = 1:skip:end1
    plot3( persols{index}.g*ones(size(persols{index}.xi1)), ...
        persols{index}.xe, persols{index}.xi1, '-','LineWidth',0.5, 'Color', c2 );
end
plot3( persols{end1}.g*ones(size(persols{end1}.xi1)), ...
        persols{end1}.xe, persols{end1}.xi1, '-k','LineWidth',4 );
plot3(g1(1:H1end), -x1E(1:H1end), -x1I1(1:H1end), 'LineWidth',4, 'Color', c2);
plot3( [Hopfx(2)], [Hopfy(2,1)], [Hopfy(2,3)],'.k','MarkerSize',30);
plot3( [sqrt(N)/(mu*a)], [0], [0], '.k','MarkerSize',30);

load HopfnoclusterN20b3.mat;
end3 = 201;
for index = 1:skip:end3
    plot3( persols{index}.g*ones(size(persols{index}.xi1)), ...
        persols{index}.xe, persols{index}.xi1, 'LineWidth',1, 'Color', c3 );
end
H3end = 844;
plot3(g3(1:H3end), -x3E(1:H3end), -x3I1(1:H3end), 'LineWidth',4, 'Color', c3 );
plot3( [Hopfx(3)], [-Hopfy(3,1)], [-Hopfy(3,2)],'.k','MarkerSize',30);

load HopfnoclusterN20b0.mat;
end0 = length(persols);
for index = 1:skip:end0
    plot3( persols{index}.g*ones(size(persols{index}.xi1)), ...
        persols{index}.xe, persols{index}.xi1, 'LineWidth',1, 'Color', c1 );
end
H0end = 4252;
plot3(g00(1:H0end), x0E(1:H0end), x0I1(1:H0end), 'LineWidth',4, 'Color', c1 );
plot3( [Hopfx(1)], [Hopfy(1,1)], [Hopfy(1,2)],'.k','MarkerSize',30);

view(3);

xlabel('$g$');
ylabel('$x_E$');
zlabel('$x_{I_1}$');
