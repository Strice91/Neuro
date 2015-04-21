Freqs = [100,600,9000];
A = [3,1,1.5,2];
Dur = 1;
Rate = 100000;

[f,t] = genSignal(Freqs,A,Dur,Rate);

plot_section = 1:10000;                 % 100ms
figure;
plot(t(plot_section)*1000,f(plot_section));
xlabel('t/ms');
ylabel('f(t)');
title('Generated Signal');

matlab2tikz('../tex/img/sig.tikz')