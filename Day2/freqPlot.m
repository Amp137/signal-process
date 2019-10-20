%% 实验二 频谱分析
% 程序作者：李昊 2017301200060
% 日期：2019/9/20

% 解包SIMULINK的输出，得到各节点的信号
time = out.tout;
src = out.src;
imp = out.imp;
lpf = out.lpf;
product = out.product;
rec = out.rec;

% 从得到输出信号的长度和采样周期
L = length(time); % 信号长度“点数”
Ss = (time(L) - time(1)) / L; % 采样周期(s)
Fs = 1 / Ss; % 采样频率

%绘制各信号时域图
figure(1);
subplot(221);
plot(time, src);
xlabel('t(s)');
ylabel('y(t)');
title('信号源波形');
ylim([-1.5 1.5]);
grid;

subplot(222);
plot(time, imp);
xlabel('t(s)');
ylabel('y(t)');
title('抽样脉冲的波形');
grid;

subplot(223);
plot(time, product);
xlabel('t(s)');
ylabel('y(t)');
title('抽样后信号的波形');
grid;

subplot(224);
plot(time, rec);
xlabel('t(s)');
ylabel('y(t)');
title('恢复以后信号的波形');
grid;

% 使用fft()进行傅里叶变换并归一化，提取单边频谱
% N = 2^nextpow2(L); % 将L放大到最近的2的整数幂N，以加速fft()的计算
N = L;
if (mod(N, 2) == 1)
    N = N + 1;
end
% 序列末尾补0至长度N，进行傅里叶变换
Src = fft(src, N); Lpf = fft(lpf, N);
Product = fft(product, N); Rec = fft(rec, N); 
% 归一化并取绝对值，得到双边频谱，然后取左半边，得到单边频谱
Sd = abs(Src / N); Ss = Sd(1: (N/2 + 1)); Ss(2:end-1) = 2*Ss(2:end-1);
Ld = abs(Lpf / N); Ls = Ld(1: (N/2 + 1)); Ls(2:end-1) = 2*Ls(2:end-1);
Pd = abs(Product / N); Ps = Pd(1: (N/2 + 1)); Ps(2:end-1) = 2*Ps(2:end-1);
Rd = abs(Rec / N); Rs = Rd(1: (N/2 + 1)); Rs(2:end-1) = 2*Rs(2:end-1);

% 绘制频谱图
freq = Fs * (0: (N/2)) / N; % 生成频谱图的横坐标
figure(2);
freqRange = 50; % 取部分频谱展示
subplot(221);
plot(freq, Ss);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('输入信号的幅频特性');
grid;

subplot(222);
plot(freq, Ls);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('滤波后信号的幅频特性');
grid;

subplot(223);
plot(freq, Ps);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('抽样后信号的幅频特性');
grid;

subplot(224);
plot(freq, Rs);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('恢复后信号的幅频特性');
grid;