%% make eigenvalue plot

% common parameters

f = 0.8;
a = f/(1-f);

% plotting parameters

fontSize = 30;
labelFontSize = 40;
markerSize = 60;


%% no clusters

N = 20;
Nc = 1;
p = 16;
Ne = p;
mee = 0.7;
mei = mee;
mei = 1.0
mie = -a*mee;
mii = -a*mee;
H = cluster(N, Nc, p, mee, mei, mie, mii); 

l  = eig(H);
[realvals, idx] = uniquetol(real(l));
l2 = l(idx);
uniquel = [ l2 ; conj(l2( l(idx) ~= conj(l(idx))))]

% adjust leftmost one lambda_E for looks
uniquel(1) = -1.2;

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

labels = {'$\lambda_E$', '$\lambda_0 + i \omega_0$', '$\lambda_I$', '$\lambda_0 - i \omega_0$'};
plot(real(uniquel),imag(uniquel), '.', 'MarkerSize', markerSize);
labelpoints(real(uniquel),imag(uniquel),labels,'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('Re $\lambda$');
ylabel('Im $\lambda$');
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-2 7 -18 18]);

lambdaE = -mee;
lambdaI = a*mee;
lambda = mee*(a-1)/2;
omega = mee*sqrt(a+1)*sqrt(Ne - (1+a)/4);


%% E clusters, balance restored

N = 20;
Nc = 4;
p = 4;
mee = 0.7*Nc;
mie = 0.7;
mii = -a*0.7;
mei = -a*0.7;

H = cluster(N, Nc, p, mee, mei, mie, mii); 

l  = eig(H);
[realvals, idx] = uniquetol(real(l));
l2 = l(idx);
uniquel = [ l2 ; conj(l2( l(idx) ~= conj(l(idx))))];
% move eigenvalues for convenience
uniquel(1) = -4;
uniquel(2) = uniquel(2) - 2.5;
uniquel(5) = uniquel(5) - 2.5;

figure('DefaultAxesFontSize', fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

labels = {'$\lambda_E$', '$\lambda_0 + i \omega_0$', '$\lambda_I$', '$\lambda_C$', '$\lambda_0 - i \omega_0$'};
plot(real(uniquel),imag(uniquel), '.', 'MarkerSize', markerSize);
labelpoints(real(uniquel),imag(uniquel),labels,'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('Re $\lambda$');
ylabel('Im $\lambda$');
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-5 16 -15 15]);

%% I clusters

N = 20;
Nc = 1;
p = 16;
Nci = 2;
pi = 2;
mee = 0.7*Nc;
mie = 0.7;
mii = -a*0.7;
mei = -a*0.7;

H = clusterEI(Nc, p, Nci, pi, mee, mei, mie, mii); 

l  = eig(H);
[realvals, idx] = uniquetol(real(l));
l2 = l(idx);
uniquel = [ l2 ; conj(l2( l(idx) ~= conj(l(idx))))];

% adjust to make prettier
uniquel(1) = -4;
uniquel(2) = -2;

figure('DefaultAxesFontSize', fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

labels = {'$\lambda_C$', '$\lambda_E$', '$\lambda_I$', '$\lambda_0 + i \omega_0$', '$\lambda_0 - i \omega_0$'};
plot(real(uniquel),imag(uniquel), '.', 'MarkerSize', markerSize);
labelpoints(real(uniquel),imag(uniquel),labels,'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('Re $\lambda$');
ylabel('Im $\lambda$');
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-4.5 10 -13 13]);

%% I and E clusters

N = 20;
Nc = 2;
p = 8;
Nci = 2;
pi = 2;
mee = 0.7*Nc;
mie = 0.7;
mii = -a*0.7;
mei = -a*0.7;

H = clusterEI(Nc, p, Nci, pi, mee, mei, mie, mii); 

l  = eig(H);
[realvals, idx] = uniquetol(real(l));
l2 = l(idx);
uniquel = [ l2 ; conj(l2( l(idx) ~= conj(l(idx))))];

figure('DefaultAxesFontSize', fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

labels = {'$\lambda_{CI}$', '$\lambda_E$', '$\lambda_I$', '$\lambda_0 + i \omega_0$', '$\lambda_{CE}$', '$\lambda_0 - i \omega_0$'};
plot(real(uniquel),imag(uniquel), '.', 'MarkerSize', markerSize);
labelpoints(real(uniquel),imag(uniquel),labels,'SE',0.5,1,'FontSize',labelFontSize,'interpreter','latex');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('Re $\lambda$');
ylabel('Im $\lambda$');
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-3.5 15 -12 12]);

%% no clusters, nonzero I1/I2 branch; N = 50 case

load noclusterN50beta15;
b = 1.5;
ind = 70;

a = 4;
N = 50;
Nc = 1;
p = 40;
Ne = p;
mee = 0.7;
mei = mee;
mie = -a*mee;
mii = -a*mee;

g0 = sqrt(N)/(a * mee);

xstar = [ repmat(br{1}.xS(ind,1),Ne,1) ; br{1}.xS(ind,2:11)' ];
g = br{1}.parS(ind);

H = cluster(N, Nc, p, mee, mei, mie, mii) * diag( sech(g*xstar).^2 ); 

l  = eig(H);
[realvals, idx] = uniquetol(real(l));
l2 = l(idx);
uniquel = [ l2 ; conj(l2( l(idx) ~= conj(l(idx))))]

% adjust for better cartoon plot
uniquel(1) = -.9;   % lambdaE
uniquel(2) = 1.;  % lambdaI1
uniquel(4) = 3.25;  % lamnbdaI2

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

labels = {'$\lambda_E$', '$\lambda_{I_2}$', '$\lambda_{I}$', '$\lambda_{I_1}$', '$\lambda_0 + i \omega_0$', '$\lambda_0 - i \omega_0$'};
plot(real(uniquel),imag(uniquel), '.', 'MarkerSize', markerSize);
labelpoints(real(uniquel),imag(uniquel),labels,'S',0.25,1,'FontSize',labelFontSize,'interpreter','latex');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('Re $\lambda$');
ylabel('Im $\lambda$');
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-2 6 -12 12]);

lambdaE = -mee;
lambdaI = a*mee;
lambda = mee*(a-1)/2;
omega = mee*sqrt(a+1)*sqrt(Ne - (1+a)/4);

%% E clusters, nonzero C1/C2 branch, N = 50 case

load EclusterN50Nc10beta2;

ind = 30;

N = 50;
Nc = 10;
Ni = 10;
p = 4;
mee = 0.7*Nc;
mie = 0.7;
mii = -a*0.7;
mei = -a*0.7;
b = 1.5;

H = cluster(N, Nc, p, mee, mei, mie, mii); 

gc = sqrt(N)/((p-1) * mee);
xstar = [ repelem(br{1}.xS(ind,1:10)',p) ; br{1}.xS(ind,11:20)' ];
g = br{1}.parS(ind);
H = cluster(N, Nc, p, mee, mei, mie, mii) * diag( sech(g*xstar).^2 ); 

l  = eig(H);
[realvals, idx] = uniquetol(real(l));
l2 = l(idx);
uniquel2 = [ l2 ; conj(l2( l(idx) ~= conj(l(idx))))];
% remove second lambdaE since reduced matrix
uniquel = [uniquel2(1) ; uniquel2(3:end) ];
% adjust for cartoon
uniquel(4) = 8;
uniquel(6) = 16;

figure('DefaultAxesFontSize', fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

labels = {'$\lambda_0 + i \omega_0$', '$\lambda_E$', '$\lambda_I$', ...
    '$\lambda_{C_2}$','$\lambda_C$','$\lambda_{C_1}$', '$\lambda_0 - i \omega_0$'};
plot(real(uniquel),imag(uniquel), '.', 'MarkerSize', markerSize);
labelpoints(real(uniquel),imag(uniquel),labels,'S',0.25,1,'FontSize',labelFontSize,'interpreter','latex');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('Re $\lambda$');
ylabel('Im $\lambda$');
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-11.5 18 -15 15]);


   
%% functions

% generate matrix H for linearization about origin
function H = cluster(N, Nc, p, mee, mei, mie, mii)
    if Nc*p >= N
        H = 0
    else
        ni = N - Nc*p;
        eblock = mee*clusterblock(Nc, p);        
        iblock = mii*clusterblock(1, ni);     
        eiblock = mei*ones( Nc*p, ni);
        ieblock = mie*ones( ni, Nc*p);  
        H = [ eblock eiblock ; ieblock iblock ];
    end
end

% generate matrix H for linearization about origin
function Hc = clustersimplified(Nc, Ni, p, mee, mei, mie, mii)
    eblock = mee*(p-1)*eye(Nc);  
    iblock = mii*clusterblock(1, Ni);     
    eiblock = mei*ones( Nc, Ni);
    ieblock = p*mie*ones( Ni, Nc);  
    Hc = [ eblock eiblock ; ieblock iblock ];
end

% generate matrix H for linearization about origin
% self-interaction allowed
function H = clusterself(N, Nc, p, mee, mei, mie, mii)
    if Nc*p >= N
        H = 0
    else
        ni = N - Nc*p;
        eblock = mee*clusterblockself(Nc, p);        
        iblock = mii*clusterblock(1, ni);     
        eiblock = mei*ones( Nc*p, ni);
        ieblock = mie*ones( ni, Nc*p);  
        H = [ eblock eiblock ; ieblock iblock ];
    end
end

% allow excitatory and inhibitory clusters
function H = clusterEI(Nc, p, Nci, pi, mee, mei, mie, mii)
    ni = Nci*pi;
    ne = Nc*p;
    eblock = mee*clusterblock(Nc, p);        
    iblock = mii*clusterblock(Nci, pi);     
    eiblock = mei*ones( ne, ni);
    ieblock = mie*ones( ni, ne);  
    H = [ eblock eiblock ; ieblock iblock ];
end

% make matrix for n blocks of size p, will be np x np
function M = clusterblock(n, p)
    mask  = ones(p,p) - eye(p);
    block = ones(p,p) .* mask;
    bcell = repmat({block}, 1, n);
    M = blkdiag(bcell{:});
end

% make matrix for n blocks of size p, self-interaction allowed
function M = clusterblockself(n, p)
    block = ones(p,p);
    bcell = repmat({block}, 1, n);
    M = blkdiag(bcell{:});
end

% matrix H(x) for arbitrary fixed point linearization
function M = Hx(H, g, x)
    row = sech(g*x').^2;
    M = H .* repmat( row, length(x), 1 );
end

% Runge-Kutta 4 ODE solver
% t is time grid
function u = rk4(f, u0, t)
    u = u0;
    h = t(2) - t(1);
    for index = 1:(length(t) - 1)
       k1 = h*f( t(index), u(:,end) );
       k2 = h*f( t(index)+h/2, u(:,end)+0.5*k1 );
       k3 = h*f( t(index)+h/2, u(:,end)+0.5*k2 ); 
       k4 = h*f( t(index)+h, u(:,end)+k3 );
       u = [ u  u(:,end)+(k1 + 2*k2 + 2*k3 + k4)/6 ];
    end
end