%% 使用FFT进行三角波和方波的频谱分析
fo = 50;  % 三角波和方波的频率(Hz)
Fs = 1000; % 采样频率(Hz)
Ts = 1 / Fs; % 采样周期(s)
L = 1000; % 信号长度（“点数”）
t = (0: L-1) * Ts; % 采样点序列

y7 = square(2*pi*fo*t, 50); % 方波
y8 = sawtooth(2*pi*fo*t, 0.5); % 三角波
figure(1);
plot(t(1:50), y7(1:50), t(1:50), y8(1:50));
xlabel('t(s)');
ylabel('y(t)');
title('时域图像');
grid;
ylim([-1.1 1.1]);

N = 2^nextpow2(L);
Y7 = fft(y7, N);
P2 = abs(Y7 / N);
P1 = P2(1: (N/2 + 1));
P1 = 2*P1;
freqRange = Fs * (0: (N/2)) / N;

figure(2);
plot(freqRange, P1);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('方波单边频谱图');






