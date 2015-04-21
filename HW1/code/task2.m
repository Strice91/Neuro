close all;

Freqs = [100,600,9000];
A = [3,1,1.5,2];
Dur = 1;

[f1,t1] = genSignal(Freqs,A,Dur,100000);
[f2,t2] = genSignal(Freqs,A,Dur,20000);
[f3,t3] = genSignal(Freqs,A,Dur,10000);

F1 = abs(fftSpezial(f1,100000));
F2 = abs(fftSpezial(f2,20000));
F3 = abs(fftSpezial(f3,10000));
x = (1:10000) / 1000;
figure;
hold all;
plot(x,F1(1:10000),'b');
xlabel('Frequenz in kHz');
ylabel('Amplitude');
box on;
matlab2tikz('../tex/img/fft1.tikz')

figure;
plot(x,F2(1:10000),'r');
xlabel('Frequenz in kHz');
ylabel('Amplitude');
matlab2tikz('../tex/img/fft2.tikz')

figure;
plot(x(1:5000),F3,'g');
xlabel('Frequenz in kHz');
ylabel('Amplitude');
matlab2tikz('../tex/img/fft3.tikz')


% 2.1 b)
% sample rat von 10kHz ist zu niedrig, da 9kHz die höchste Frequenz ist.
% Nyquist => fs minimal ist 18 kHz.