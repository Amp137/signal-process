fo = 50;  % 三角波和方波的频率(Hz)
Fs = 10000; % 采样频率(Hz)
Ts = 1 / Fs; % 采样周期(s)
L = 8192; % 信号长度（“点数”）
t = (0: L-1) * Ts; % 采样点序列

y7 = square(2*pi*fo*t, 50); % 方波
y8 = sawtooth(2*pi*fo*t, 0.5); % 三角波

figure(1);
LRange = 1000; % 取部分时域图像展示
plot(t(1:LRange), y7(1:LRange));
xlabel('t(s)');
ylabel('y(t)');
grid;
ylim([-1.5, 1.5]);

figure(2);
LRange = 1000; % 取部分时域图像展示
plot(t(1:LRange), y8(1:LRange));
xlabel('t(s)');
ylabel('y(t)');
grid;
ylim([-1.5, 1.5]);