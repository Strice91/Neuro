close all;

Freqs = [100,600,9000];
A = [3,1,1.5,2];
Dur = 1;

[f1,t1] = genSignal(Freqs,A,Dur,100000);
[f2,t2] = genSignal(Freqs,A,Dur,20000);
[f3,t3] = genSignal(Freqs,A,Dur,10000);

F1 = fftSpezial(f1,100000);
F2 = fftSpezial(f2,20000);
F3 = fftSpezial(f3,10000);

figure;
hold all;
subplot(3,1,1);
plot(abs(F1),'b');
xlabel('Frequenz in Hz');
ylabel('Amplitude');
subplot(3,1,2);
plot(abs(F2),'r');
xlabel('Frequenz in Hz');
ylabel('Amplitude');
subplot(3,1,3);
plot(abs(F3),'g');
xlabel('Frequenz in Hz');
ylabel('Amplitude');


% 2.1 b)
% sample rat von 10kHz ist zu niedrig, da 9kHz die höchste Frequenz ist.
% Nyquist => fs minimal ist 18 kHz.