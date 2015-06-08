close all;

%% 1.1
z = 10;
dim = [50,50];
I = 1;

[X,Y,Phi] = calcPotential(z,dim,I);

f = figure;
imagesc(Phi .* 1e-3);
ylabel('y distance in \mum');
xlabel('x distance in \mum');
set(gca, 'XTick', 1:50:501, 'XTickLabel', -25:5:25);
set(gca, 'YTick', 1:50:501, 'YTickLabel', 25:-5:-25);
c = colorbar;
ylabel(c, '\phi in V');

print(f,'-dpng','../tex/img/potField.png')

%% 1.2.1
z = 10;
dim = [50,0];
I = 1;

[X,Y,Phi] = calcPotential(z,dim,I);

% a)
f = figure;
plot(Phi .* 1e-3);
ylabel('\phi in V');
xlabel('x distance in \mum');
set(gca, 'XTick', 1:50:501, 'XTickLabel', -25:5:25);
xlim([1,501])
title('\phi with I = 1mA');
matlab2tikz('../tex/img/Phi1.tikz');

% b)
E = - diff(Phi .* 1e-3) / 0.1;
E = [E,E(end)];
f = figure;
plot(E);
ylabel('E in V/\mum');
xlabel('x distance in \mum');
set(gca, 'XTick', 1:50:501, 'XTickLabel', -25:5:25);
xlim([1,501])
title('E with I = 1mA');
matlab2tikz('../tex/img/E1.tikz');

% c)
A = diff(diff(Phi .* 1e-3)) / 0.1^2;
A = [A,A(end)];
f = figure;
plot(A);
ylabel('Activationfunction in V/ \mum^2');
xlabel('x distance in \mum');
set(gca, 'XTick', 1:50:501, 'XTickLabel', -25:5:25);
xlim([1,501])
title('Activation with I = 1mA');
matlab2tikz('../tex/img/A1.tikz');

%% 1.2.2
z = 10;
dim = [50,0];
I = -1;

[X,Y,Phi] = calcPotential(z,dim,I);

% a)
f = figure;
plot(Phi .* 1e-3);
ylabel('\phi in V');
xlabel('x distance in \mum');
set(gca, 'XTick', 1:50:501, 'XTickLabel', -25:5:25);
xlim([1,501])
title('\phi with I = -1mA');
matlab2tikz('../tex/img/Phi2.tikz');

% b)
E = - diff(Phi .* 1e-3) / 0.1;
E = [E,E(end)];
f = figure;
plot(E);
ylabel('E in V/\mum');
xlabel('x distance in \mum');
set(gca, 'XTick', 1:50:501, 'XTickLabel', -25:5:25);
xlim([1,501])
title('E with I = -1mA');
matlab2tikz('../tex/img/E2.tikz');

% c)
A = diff(diff(Phi .* 1e-3)) / 0.1^2;
A = [A,A(end)];
f = figure;
plot(A);
ylabel('Activationfunction in V/ \mum^2');
xlabel('x distance in \mum');
set(gca, 'XTick', 1:50:501, 'XTickLabel', -25:5:25);
xlim([1,501])
title('Activation with I = -1mA');
matlab2tikz('../tex/img/A2.tikz');