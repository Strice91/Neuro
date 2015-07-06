close all;

loFreq = 200;
hiFreq = 20000;
n_ff = 1000;

% Lese Signal ein
% x  = Signal
% fs = Abtastrate
[x,fs] = read_audio_mono('audio/test.wav');
t = (0:length(x)-1) / fs;

%% 8 Kanäle
nChan = 8;
[filtOut8, H8, Gr8, w8, w_gd8] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

HT8 = hilbert(filtOut8);
env8 = abs(HT8);

sig_dyn_comp8 = comp_dyn(env8,500);
sum_dyn8 = mean(sig_dyn_comp8);

figure;
bar(sum_dyn8);
title('Summenspektrum Dyn Comp')
ylabel('Durck in pa');
xlabel('Kanal Nr.');

figure;
imagesc(sig_dyn_comp8(:,8:-1:1)');
title('Envelope Dyn Comp');
ylabel('Kanal Nr.');
xlabel('Zeit in s');
set(gca, 'XTick', 1:fs:length(x), 'XTickLabel', 0:1:t(end));
set(gca, 'YTick', 1:1:8, 'YTickLabel', 8:-1:1);


%% 16 Kanäle
nChan = 16;
[filtOut16, H16, Gr16, w16, w_gd16] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

HT16 = hilbert(filtOut16);
env16 = abs(HT16);

sig_dyn_comp16 = comp_dyn(env16,500);
sum_dyn16 = mean(sig_dyn_comp16);

figure;
bar(sum_dyn16);
title('Summenspektrum Dyn Comp')
ylabel('Durck in pa');
xlabel('Kanal Nr.');

figure;
imagesc(sig_dyn_comp16(:,16:-1:1)');
title('Envelope Dyn Comp');
ylabel('Kanal Nr.');
xlabel('Zeit in s');
set(gca, 'XTick', 1:fs:length(x), 'XTickLabel', 0:1:t(end));
set(gca, 'YTick', 1:1:16, 'YTickLabel', 16:-1:1);