% fraction excitatory
f = 0.8;
a = f/(1-f);

fontSize=24;

% clusters 
N  = 1600;
Ne = round( f*N );
Ni = round( (1-f)*N );
Nc  = 1;
Nci = 20;

p  = round( Ne/Nc );
pinh = round( Ni/Nci );

mm = 0.7;
mee = mm;
mie = mm;
mei = -a*mm;
mii = -a*mm;

H = clusterEI(Nc, p, Nci, pinh, mee, mei, mie, mii);
l  = eig(H);
realvals = uniquetol(real(l));

gstar = sqrt(N)/realvals(end);
g = gstar*1.02;

l3 = (g/sqrt(N))*l-1;

%%
% timesteppinhng

x0 = randn(N,1)*0.5;

fn = @(t, x)(-x + (H/sqrt(N))*tanh(g*x));

[t,x] = ode45(fn, [0,500], x0);

J = Hx( H, g, x(end,:)' );
lJ = eig(J);
realvalsJ = uniquetol(real(lJ));

figure;
subplot(2,2,1);
plot(real(l), imag(l), '.r', 'MarkerSize', 30);
subplot(2,2,2);
plot(real(l3), imag(l3), '.', 'MarkerSize', 30);
subplot(2,2,3);
plot(t, x(:,1),'--b',t,x(:,f*N+1),'-r','LineWidth',1);
subplot(2,2,4);
l4 = g*lJ/sqrt(N) - 1;
plot(real(l4),imag(l4), '.', 'MarkerSize', 30);

%% plots

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

plot(t-400, x(:,1),'--b',t-400,x(:,f*N+1),'-r','LineWidth',3);
axis([0 20 -5.5 5.5 ]);
labels = {'$x_E$','$x_I$'};
legend(labels,'Location','NorthEast');
xlabel('$t$');
ylabel('$x$');

%%
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(x(3500:end,1),x(3500:end,f*N+1),'LineWidth',3);
xlabel('$x_E$');
ylabel('$x_I$');

[pks,locs] = findpeaks(x(:,1));
per = mean( t(locs(end-20:end)) - t(locs(end-21:end-1)) );


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

% allow excitatory and inhibitory clusters
function H = clusterEI(Nc, p, Nci, pinh, mee, mei, mie, mii)
    ni = Nci*pinh;
    ne = Nc*p;
    eblock = mee*clusterblock(Nc, p);        
    iblock = mii*clusterblock(Nci, pinh);     
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